import 'package:canaspad/data/model/result/result.dart';

abstract class InitRepository {
  Future<Result<Map<String, dynamic>>> initGet({required String accessToken});
  Future<Result<Map<String, dynamic>>> userPut(
      {required String accessToken, required Object? body});
}
