import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import 'logic/abstracts/network_abst.dart';
import 'logic/controllers/account_bloc/account_bloc.dart';
import 'logic/controllers/network_bloc/network_bloc.dart';
import 'logic/controllers/sia_bloc/sia_bloc.dart';
import 'logic/services/network_impl.dart';
import 'logic/usecases/network_overview_usecases/get_all_hosts_usecase.dart';
import 'utils/constants/pngs_const.dart' as png;
import 'utils/constants/svgs_const.dart' as icon;

// import 'backend/data/reposit_impls/welcome_reposit_impl.dart';
// import 'backend/data/services/welcome_services/welcome_abst.dart';
// import 'backend/data/services/welcome_services/welcome_impl.dart';
// import 'backend/domain/reposit_absts/welcome_reposit_abst.dart';
// import 'backend/domain/usecases/welcome_usecases/welcome_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! WidgetFlutter and DeviceType Initialization
  // active these lines down

  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    Element? context = WidgetsFlutterBinding.ensureInitialized().rootElement;

    //! Prelod All the svg
    final svgs = [
      icon.eyeOffSvg,
      icon.homeSvg,
      icon.searchSvg,
      icon.chartSvg,
      icon.clockSvg,
      icon.smsNotifsSvg,
      icon.pyramidSvg
    ];
    final imagesSvg = svgs.map((svgElement) => SvgAssetLoader(svgElement));
    imagesSvg.map((imageSvg) async => await svg.cache.putIfAbsent(
        imageSvg.cacheKey(context), () => imageSvg.loadBytes(context)));

    //! Prelod All the png
    final pngs = [
      png.dataAnalysisPng,
      png.fileSynchronizationPng,
      png.serverStatusPng,
      png.secureServerPng,
    ];
    final imagesPng = pngs.map(
        (pngElement) => precacheImage(Image.asset(pngElement).image, context!));
    await Future.wait(imagesPng);

    //! Prelod All the jpg
    final jpgs = [];
    final imagesJpg = jpgs.map(
        (jpgElement) => precacheImage(Image.asset(jpgElement).image, context!));
    await Future.wait(imagesJpg);
  });

  await Future.delayed(const Duration(seconds: 5)).then((value) => {
        FlutterNativeSplash.remove(),
      });
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

//! initialisation of dotenv
  // There you can initialize your env file, you can activate the below line

  await dotenv.load(fileName: "assets/envs/.env");

//! Database internal initialisation
  // There you can initialize your Internal Database
  // like sqflite, Hive or Adapter s' Hive generate or ObjectBox

//! final Instances Variables
// variables of instance's class
/**
   *  exemples : 
   *  final sharedPreference = await SharedPreferences.getInstance();
   * 
   */
//! External Variables

  // serviceLocator.registerLazySingleton code

  /**
   *  exemples : 
   *  sl.registerLazySingleton(() => sharedPreference);
   * 
   */

//! services

  sl.registerLazySingleton<NetworkAbst>(() => NetworkImpl());

//! Usecases

  sl.registerLazySingleton<GetAllHostsUsecase>(
      () => GetAllHostsUsecase(networkOverviewAbst: sl.call()));

//! Bloc

  /**
   *  here you must register the bloc state manager using : sl.registerFactory(() => null);
   */
  sl.registerFactory<AccountBloc>(() => AccountBloc());
  sl.registerFactory<SiaBloc>(() => SiaBloc());
  sl.registerFactory<NetworkBloc>(
      () => NetworkBloc(getAllHostsUsecase: sl.call()));
}
