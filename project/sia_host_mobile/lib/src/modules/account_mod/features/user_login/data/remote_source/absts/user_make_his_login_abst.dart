import '../models/user_login_model.dart';

abstract class UserMakeHisLoginAbst {
  Future<Map<String, dynamic>> makeTheLogin({
    required UserLoginModel userLoginModel,
    required String key,
    required String iv,
  });
}
