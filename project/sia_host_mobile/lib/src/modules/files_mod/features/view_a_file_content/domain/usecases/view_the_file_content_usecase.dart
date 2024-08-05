import 'package:injectable/injectable.dart';

import '../reposit_absts/user_view_the_file_content_reposit_abst.dart';

@lazySingleton
class ViewTheFileContentUsecase {
  final UserViewTheFileContentRepositAbst _userViewTheFileContentRepositAbst;

  ViewTheFileContentUsecase({
    required UserViewTheFileContentRepositAbst
        userViewTheFileContentRepositAbst,
  }) : _userViewTheFileContentRepositAbst = userViewTheFileContentRepositAbst;
}
