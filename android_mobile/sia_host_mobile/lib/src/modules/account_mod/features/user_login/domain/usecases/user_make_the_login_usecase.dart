import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/user_login_entity.dart';
import '../reposit_absts/user_make_the_login_reposit_abst.dart';

@lazySingleton
class UserMakeTheLoginUsecase {
  final UserMakeTheLoginRepositAbst _userMakeTheLoginRepositAbst;

  UserMakeTheLoginUsecase({
    required UserMakeTheLoginRepositAbst userMakeTheLoginRepositAbst,
  }) : _userMakeTheLoginRepositAbst = userMakeTheLoginRepositAbst;

  Future<Result<String, String>> call({
    required UserLoginEntity userLoginEntity,
  }) async =>
      await _userMakeTheLoginRepositAbst.userMakeHisLogin(
          userLoginEntity: userLoginEntity);
}
