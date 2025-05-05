import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:renterd/renterd.dart' as renterd;
import 'package:sia_host_mobile/src/shared/functions/service_locator.dart';
import 'package:sia_host_mobile/src/shared/helpers/helpers.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  //! Licencing font
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/Manrope/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts/Manrope'], license);
  });

  //! General error logging
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  //! Bloc observer
  Bloc.observer = const AppBlocObserver();

  //! Widgets binding
  WidgetsFlutterBinding.ensureInitialized();

  //! services locator
  serviceLocator();

  //! Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //! set ui mode
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  //! Http overrides
  HttpOverrides.global = CustomHttpOverrides();

  //! Renterd deps injection initialization
  await renterd.renterdInit();

  runApp(await builder());
}
