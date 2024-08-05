import 'package:injectable/injectable.dart';

import '../../domain/reposit_absts/user_view_the_file_content_reposit_abst.dart';
import '../remote_source/absts/view_the_file_abst.dart';

@LazySingleton(as: UserViewTheFileContentRepositAbst)
class UserViewTheFileContentRepositImpl
    implements UserViewTheFileContentRepositAbst {
  final ViewTheFileAbst _viewTheFileAbst;

  UserViewTheFileContentRepositImpl({
    required ViewTheFileAbst viewTheFileAbst,
  }) : _viewTheFileAbst = viewTheFileAbst;
}
