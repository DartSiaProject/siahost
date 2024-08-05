import 'package:http/http.dart';

import '../models/the_new_data_host_model.dart';

abstract class UpdateTheHosterWithNewDataAbst {
  Future<Response> updateTheHosterWithNewData({
    required TheNewDataHostModel theNewDataHostModel,
    required String serverAddress,
    required String password,
  });
}
