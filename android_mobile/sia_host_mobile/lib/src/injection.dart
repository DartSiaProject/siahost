import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import 'logic/abstracts/host_abst.dart';
import 'logic/abstracts/network_abst.dart';
import 'logic/controllers/account_bloc/account_bloc.dart';
import 'logic/controllers/network_bloc/network_bloc.dart';
import 'logic/controllers/search_bloc/search_bloc.dart';
import 'logic/controllers/sia_bloc/sia_bloc.dart';
import 'logic/services/host_impl.dart';
import 'logic/services/network_impl.dart';
import 'logic/usecases/host_usecases/get_host_list_usecase.dart';
import 'logic/usecases/host_usecases/get_host_searched_by_pub_key_usecase.dart';
import 'logic/usecases/network_overview_usecases/get_network_data_usecase.dart';
import 'utils/constants/pngs_const.dart' as png;
import 'utils/constants/svgs_const.dart' as icon;

final sl = GetIt.instance;

Future<void> init() async {
//! WidgetFlutter and DeviceType Initialization
  // active these lines down

  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
    Element context = WidgetsFlutterBinding.ensureInitialized().rootElement!;

    //! Prelod All the svg
    final svgs = [
      icon.eyeOffSvg,
      icon.homeSvg,
      icon.searchSvg,
      icon.chartSvg,
      icon.clockSvg,
      icon.smsNotifsSvg,
      icon.arrowDropUpSvg,
      icon.checkTrackSvg,
      icon.moreVerticalSvg,
      icon.locationSvg,
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
        (pngElement) => precacheImage(Image.asset(pngElement).image, context));
    await Future.wait(imagesPng);

    //! Prelod All the jpg
    final jpgs = [];
    final imagesJpg = jpgs.map(
        (jpgElement) => precacheImage(Image.asset(jpgElement).image, context));
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
  sl.registerLazySingleton<HostAbst>(() => HostImpl());

//! Usecases

  sl.registerLazySingleton<GetNetworkDataUsecase>(
      () => GetNetworkDataUsecase(networkOverviewAbst: sl.call()));
  sl.registerLazySingleton<GetHostDataListUsecase>(
      () => GetHostDataListUsecase(hostAbst: sl.call()));
  sl.registerLazySingleton<GetHostSearchedByPubKeyUsecase>(
      () => GetHostSearchedByPubKeyUsecase(hostAbst: sl.call()));

//! Bloc

  /**
   *  here you must register the bloc state manager using : sl.registerFactory(() => null);
   */
  sl.registerFactory<AccountBloc>(() => AccountBloc());
  sl.registerFactory<SiaBloc>(() => SiaBloc());
  sl.registerFactory<NetworkBloc>(
      () => NetworkBloc(getNetworkDataUsecase: sl.call()));
  sl.registerFactory<SearchBloc>(() => SearchBloc(
        getHostDataListUsecase: sl.call(),
        getHostSearchedByPubKeyUsecase: sl.call(),
      ));
}
