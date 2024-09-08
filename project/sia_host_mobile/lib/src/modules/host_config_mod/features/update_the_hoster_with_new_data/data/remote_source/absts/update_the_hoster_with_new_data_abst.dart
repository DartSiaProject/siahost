import '../models/the_new_data_host_model.dart';

abstract class UpdateTheHosterWithNewDataAbst {
  Future<Map<String, dynamic>> updateTheHosterWithNewData({
    required TheNewDataHostModel theNewDataHostModel,
    required String serverAddress,
    // required String password,
    required String key,
    required String iv,
  });
}
