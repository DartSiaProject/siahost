import 'package:multiple_result/multiple_result.dart';

import '../entities/user_login_entity.dart';

abstract class UserMakeTheLoginRepositAbst {
  // Future<Result<Map<String, dynamic>, String>> verifyData({
  //   required UserVerifyEntity userVerifyEntity,
  // });
  Future<Result<String, String>> userMakeHisLogin({
    required UserLoginEntity userLoginEntity,
  });
}
