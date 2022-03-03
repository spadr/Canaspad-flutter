import 'dart:convert';

import 'package:canaspad/data/model/result/result.dart';
import 'package:canaspad/data/repository/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'element_repository.dart';

final apiClientProvider = Provider.autoDispose(
  (_) => ApiClientImpl(baseUrl: 'http://192.168.10.123'),
);

final elementRepositoryProvider = Provider<ElementRepository>(
    (ref) => ElementRepositoryImpl(apiClient: ref.read(apiClientProvider)));

class ElementRepositoryImpl implements ElementRepository {
  ElementRepositoryImpl({required this.apiClient});
  final ApiClient apiClient;
  static const elementJsonEndPoint = '/api/element/';

  @override
  Future<Result<Map<String, dynamic>>> elementGet(
      {required String accessToken}) async {
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    return Result.guardFuture(() async {
      final responseBody =
          await apiClient.get(elementJsonEndPoint, headers: header);
      try {
        final Map<String, dynamic> decodedJson = json.decode(responseBody);
        return decodedJson;
      } on Exception catch (error) {
        throw Exception('Json decode error: $error');
      }
    });
  }
}
