import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/api_error_handler.dart';
import '../application/dio_provider.dart';
import '../domain/comment.dart';

part 'comments_repository.g.dart';

class CommentsRepository {
  CommentsRepository({required this.dio});
  final Dio dio;

  Future<List<Comment>> fetchComments(int postId, {CancelToken? cancelToken}) =>
      _run<List<Comment>>(
        request: () => dio.get(
          'https://jsonplaceholder.typicode.com/comments?postId=$postId',
          cancelToken: cancelToken,
        ),
        parse: (data) {
          final comments = data as List<dynamic>;
          return comments.map((comment) => Comment.fromJson(comment)).toList();
        },
      );

  Future<T> _run<T>({
    required Future<Response> Function() request,
    required T Function(dynamic) parse,
  }) async {
    try {
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
CommentsRepository commentsRepository(CommentsRepositoryRef ref) {
  return CommentsRepository(dio: ref.watch(dioProvider));
}

@riverpod
Future<List<Comment>> fetchComments(FetchCommentsRef ref, int postId) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  return ref
      .watch(commentsRepositoryProvider)
      .fetchComments(postId, cancelToken: cancelToken);
}
