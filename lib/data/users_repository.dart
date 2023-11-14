import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/api_error_handler.dart';
import '../application/dio_provider.dart';
import '../domain/user.dart';

part 'users_repository.g.dart';

class UsersRepository {
  UsersRepository({required this.dio});
  final Dio dio;

  Future<User> fetchUser(int userId, {CancelToken? cancelToken}) => _run<User>(
    request: () => dio.get(
      'https://jsonplaceholder.typicode.com/users/$userId',
      cancelToken: cancelToken,
    ),
    parse: (data) => User.fromJson(data),
  );

  // Generic method to make a request and parse the response data
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
UsersRepository usersRepository(UsersRepositoryRef ref) {
  return UsersRepository(dio: ref.watch(dioProvider));
}

@riverpod
Future<User> fetchUser(FetchUserRef ref, int userId) {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  return ref
      .watch(usersRepositoryProvider)
      .fetchUser(userId, cancelToken: cancelToken);
}
