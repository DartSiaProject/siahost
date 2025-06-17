import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/shared/functions/service_locator.config.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@InjectableInit(
  generateForDir: ['lib', 'test'],
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<GetIt> serviceLocator() => di.init();
