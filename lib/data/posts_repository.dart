import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/api_error_handler.dart';
import '../application/dio_provider.dart';
import '../application/new_post_provider.dart';
import '../application/selected_user_provider.dart';
import '../domain/post.dart';

part 'posts_repository.g.dart';

class PostsRepository {
  PostsRepository({required this.dio});

  final Dio dio;

  Future<List<Post>> fetchPosts({int? userId, CancelToken? cancelToken}) async {
    final url = userId != null
        ? 'https://jsonplaceholder.typicode.com/posts?userId=$userId'
        : 'https://jsonplaceholder.typicode.com/posts';

    final response = await dio.get(
      url,
      cancelToken: cancelToken,
    );

    final List<Post> posts = (response.data as List<dynamic>)
        .map((post) => Post.fromJson(post))
        .toList();

    return posts;
  }

  Future<Post> fetchPost(int postId, {CancelToken? cancelToken}) => _run<Post>(
        request: () => dio.get(
          'https://jsonplaceholder.typicode.com/posts/$postId',
          cancelToken: cancelToken,
        ),
        parse: (data) => Post.fromJson(data),
      );

  Future<void> deletePost(int postId, {CancelToken? cancelToken}) async {
    await _run<void>(
      request: () => dio.delete(
        'https://jsonplaceholder.typicode.com/posts/$postId',
        cancelToken: cancelToken,
      ),
      parse: (data) {},
    );
  }

  Future<Post> createPost(Post post, {CancelToken? cancelToken}) async {
    /*return _run<Post>(
      request: () {
        return dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': post.title,
          'body': post.body,
          'userId': 1,
        },
        cancelToken: cancelToken,
      );
      },
      parse: (data) {
        return Post.fromJson(data);
      },
    );*/
    return post;
  }

  // Generic method to make a request and parse the response data
  Future<T> _run<T>({
    required Future<Response> Function() request,
    required T Function(dynamic) parse,
  }) async {
    try {
      // add artificial delay to test loading UI
      //await Future.delayed(const Duration(seconds: 1));
      final response = await request();
      switch (response.statusCode) {
        case 200:
          return parse(response.data);
        case 404:
          throw const APIError.notFound();
        default:
          throw const APIError.unknown();
      }
    } on SocketException catch (_) {
      throw const APIError.noInternetConnection();
    }
  }
}

@Riverpod(keepAlive: true)
PostsRepository postsRepository(PostsRepositoryRef ref) {
  return PostsRepository(dio: ref.watch(dioProvider));
}

@riverpod
Future<Post> createPost(CreatePostRef ref) {
  final cancelToken = CancelToken();
  final newPost = ref.watch(newPostProvider)!;
  ref.onDispose(() => cancelToken.cancel());
  return ref
      .watch(postsRepositoryProvider)
      .createPost(newPost, cancelToken: cancelToken);
}

@riverpod
Future<List<Post>> fetchPosts(FetchPostsRef ref) {
  final cancelToken = CancelToken();

  final selectedUserId = ref.watch(selectedUserIdProvider);

  ref.onDispose(() => cancelToken.cancel());

  return ref
      .watch(postsRepositoryProvider)
      .fetchPosts(userId: selectedUserId, cancelToken: cancelToken);
}

@riverpod
Future<Post> fetchPost(FetchPostRef ref, int postId) {
  // print('init: fetchPost($postId)');
  // ref.onCancel(() => print('cancel: fetchPost($postId)'));
  // ref.onResume(() => print('resume: fetchPost($postId)'));
  // ref.onDispose(() => print('dispose: fetchPost($postId)'));
  // get the [KeepAliveLink]
  final link = ref.keepAlive();
  // a timer to be used by the callbacks below
  Timer? timer;
  // An object from package:dio that allows cancelling http requests
  final cancelToken = CancelToken();
  // When the provider is destroyed, cancel the http request
  ref.onDispose(() {
    timer?.cancel();
    cancelToken.cancel();
  });
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    // start a 30 second timer
    timer = Timer(const Duration(seconds: 5), () {
      // dispose on timeout
      link.close();
    });
  });
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
  });
  // Fetch our data and pass our `cancelToken` for cancellation to work
  return ref
      .watch(postsRepositoryProvider)
      .fetchPost(postId, cancelToken: cancelToken);
}
