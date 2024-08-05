import 'package:injectable/injectable.dart';

import '../absts/view_the_file_abst.dart';

@LazySingleton(as: ViewTheFileAbst)
class ViewTheFileImpl implements ViewTheFileAbst {}
