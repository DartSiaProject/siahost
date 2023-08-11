import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sia_host_mobile/src/logic/abstracts/account_abst.dart';
import 'package:sia_host_mobile/src/logic/controllers/hoster_bloc/hoster_bloc.dart';
import 'package:sia_host_mobile/src/logic/services/account_impl.dart';
import 'package:sia_host_mobile/src/logic/usecases/account_usecases/check_account_credential_usecase.dart';
import 'package:sia_host_mobile/src/logic/usecases/account_usecases/make_login_usecase.dart';
import 'package:sia_host_mobile/src/logic/usecases/host_usecases/get_some_host_from_renterd_usecase.dart';
import 'package:sia_host_mobile/src/logic/usecases/host_usecases/update_some_host_from_renterd_usecase.dart';

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
import 'logic/usecases/host_usecases/get_one_host_usecase.dart';
import 'logic/usecases/network_overview_usecases/get_network_data_usecase.dart';
import 'utils/constants/pngs_const.dart' as png;
import 'utils/constants/svgs_const.dart' as icon;
import 'utils/helpers/request_helpers/http_overrides_helper.dart';

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
      icon.settingsSvg,
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

//! initialisation of httpOverride
  HttpOverrides.global = new MyHttpOverridesHelper();

//! initialisation of renterd package

//! final Instances Variables
// variables of instance's class
  var _sharedPreference = await SharedPreferences.getInstance();

//! External Variables

  // serviceLocator.registerLazySingleton code

  sl.registerLazySingleton(() => _sharedPreference);

//! services

  sl.registerLazySingleton<NetworkAbst>(() => NetworkImpl());
  sl.registerLazySingleton<HostAbst>(
      () => HostImpl(sharedPreferences: sl.call()));
  sl.registerLazySingleton<AccountAbst>(
      () => AccountImpl(sharedPreferences: sl.call()));

//! Usecases

  sl.registerLazySingleton<GetNetworkDataUsecase>(
      () => GetNetworkDataUsecase(networkOverviewAbst: sl.call()));
  sl.registerLazySingleton<GetHostDataListUsecase>(
      () => GetHostDataListUsecase(hostAbst: sl.call()));
  sl.registerLazySingleton<GetHostSearchedByPubKeyUsecase>(
      () => GetHostSearchedByPubKeyUsecase(hostAbst: sl.call()));
  sl.registerLazySingleton<GetOneHostUsecase>(
      () => GetOneHostUsecase(hostAbst: sl.call()));
  sl.registerLazySingleton<GetSomeHostFromRenterdUsecase>(
      () => GetSomeHostFromRenterdUsecase(hostAbst: sl.call()));
  sl.registerLazySingleton<UpdateSomeHostFromRenterdUsecase>(
      () => UpdateSomeHostFromRenterdUsecase(hostAbst: sl.call()));
  sl.registerLazySingleton<MakeLoginUsecase>(
      () => MakeLoginUsecase(accountAbst: sl.call()));

  sl.registerLazySingleton<CheckAccountCredentialUsecase>(
      () => CheckAccountCredentialUsecase(accountAbst: sl.call()));

//! Bloc

  /**
   *  here you must register the bloc state manager using : sl.registerFactory(() => null);
   */
  sl.registerFactory<AccountBloc>(() => AccountBloc(
        makeLoginUsecase: sl.call(),
        checkAccountCredentialUsecase: sl.call(),
      ));
  sl.registerFactory<SiaBloc>(() => SiaBloc());
  sl.registerFactory<NetworkBloc>(
      () => NetworkBloc(getNetworkDataUsecase: sl.call()));
  sl.registerFactory<SearchBloc>(() => SearchBloc(
        getHostDataListUsecase: sl.call(),
        getHostSearchedByPubKeyUsecase: sl.call(),
        getOneHostUsecase: sl.call(),
      ));
  sl.registerFactory<HosterBloc>(() => HosterBloc(
        getSomeHostFromRenterdUsecase: sl.call(),
        updateSomeHostFromRenterdUsecase: sl.call(),
      ));
}
