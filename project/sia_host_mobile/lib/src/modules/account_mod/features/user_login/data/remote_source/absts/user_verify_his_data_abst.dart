import '../models/user_login_model.dart';

abstract class UserVerifyHisDataAbst {
  Future<Map<String, dynamic>> makeVerification({
    required UserLoginModel userLoginModel,
  });
}
