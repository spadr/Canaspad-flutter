import 'package:canaspad/data/model/result/result.dart';

abstract class AuthRepository {
  Future<Result<Map<String, dynamic>>> access(
      {required String id, required String pass});
  Future<Result<Map<String, dynamic>>> refresh({required String refreshToken});
}
