import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/bootstrap.dart';
import 'package:sia_host_mobile/src/modules/app/views/pages/app.dart';

@injectableInit
void main() {
  bootstrap(() => const App());
}
