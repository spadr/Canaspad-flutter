import 'dart:convert';

import 'package:canaspad/data/model/result/result.dart';
import 'package:canaspad/data/repository/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'auth_repository.dart';

final apiClientProvider = Provider.autoDispose(
  (_) => ApiClientImpl(baseUrl: 'http://192.168.10.123'),
);

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(apiClient: ref.read(apiClientProvider)));

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.apiClient});
  final ApiClient apiClient;
  static const accessTokenEndPoint = '/api/token/';
  static const refreshTokenEndPoint = '/api/token/refresh/';

  @override
  Future<Result<Map<String, dynamic>>> access(
      {required String id, required String pass}) async {
    final header = {'Content-Type': 'application/json'};
    final body = {'email': id, 'password': pass};
    return Result.guardFuture(() async {
      final responseBody = await apiClient.post(accessTokenEndPoint,
          headers: header, body: json.encode(body));
      try {
        final Map<String, dynamic> decodedJson = json.decode(responseBody);
        return decodedJson;
      } on Exception catch (error) {
        throw Exception('Json decode error: $error');
      }
    });
  }

  @override
  Future<Result<Map<String, dynamic>>> refresh(
      {required String refreshToken}) async {
    final header = {'Content-Type': 'application/json'};
    final body = {'refresh': refreshToken};
    return Result.guardFuture(() async {
      final responseBody = await apiClient.post(refreshTokenEndPoint,
          headers: header, body: json.encode(body));
      try {
        final Map<String, dynamic> decodedJson = json.decode(responseBody);
        return decodedJson;
      } on Exception catch (error) {
        throw Exception('Json decode error: $error');
      }
    });
  }
}
