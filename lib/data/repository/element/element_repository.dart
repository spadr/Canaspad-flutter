import 'package:canaspad/data/model/result/result.dart';

abstract class ElementRepository {
  Future<Result<Map<String, dynamic>>> elementGet(
      {required String accessToken});
}
