import 'dart:convert';

import 'package:canaspad/data/model/result/result.dart';
import 'package:canaspad/data/repository/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'tube_repository.dart';

final apiClientProvider = Provider.autoDispose(
  (_) => ApiClientImpl(baseUrl: 'http://192.168.10.123'),
);

final tubeRepositoryProvider = Provider<TubeRepository>(
    (ref) => TubeRepositoryImpl(apiClient: ref.read(apiClientProvider)));

class TubeRepositoryImpl implements TubeRepository {
  TubeRepositoryImpl({required this.apiClient});
  final ApiClient apiClient;
  static const tubeJsonEndPoint = '/api/tube/';

  @override
  Future<Result<Map<String, dynamic>>> tubeGet(
      {required String accessToken}) async {
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    return Result.guardFuture(() async {
      final responseBody =
          await apiClient.get(tubeJsonEndPoint, headers: header);
      try {
        final Map<String, dynamic> decodedJson = json.decode(responseBody);
        return decodedJson;
      } on Exception catch (error) {
        throw Exception('Json decode error: $error');
      }
    });
  }
}
