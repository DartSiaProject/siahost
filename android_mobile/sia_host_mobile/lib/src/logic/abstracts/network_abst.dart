import 'package:multiple_result/multiple_result.dart';

abstract class NetworkAbst {
  Future<Result<Map<String, dynamic>, String>> getNetworkData();
}
