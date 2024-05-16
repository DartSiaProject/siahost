import 'package:http/http.dart';

import '../models/user_login_model.dart';

abstract class UserMakeHisLoginAbst {
  Future<Response> makeTheLogin({
    required UserLoginModel userLoginModel,
  });
}
