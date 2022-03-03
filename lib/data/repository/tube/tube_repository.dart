import 'package:canaspad/data/model/result/result.dart';

abstract class TubeRepository {
  Future<Result<Map<String, dynamic>>> tubeGet({required String accessToken});
}
