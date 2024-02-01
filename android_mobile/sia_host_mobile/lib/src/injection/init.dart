import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renterd/renterd.dart';

import '../core/configs/env_config/env_checker.dart';
import '../shared/constants/int_const.dart';
import '../shared/constants/pngs_const.dart' as png;
import '../shared/constants/svgs_const.dart' as icon;
import '../shared/services/http/configs/http_overrides_helper.dart';
import 'injectors/injector.dart';

class Init {
  static Future<void> launch() async {
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
      final imagesPng = pngs.map((pngElement) =>
          precacheImage(Image.asset(pngElement).image, context!));
      await Future.wait(imagesPng);

      //! Prelod All the jpg
      final jpgs = [];
      final imagesJpg = jpgs.map((jpgElement) =>
          precacheImage(Image.asset(jpgElement).image, context!));
      await Future.wait(imagesJpg);

      //! splash screen remover
      await Future.delayed(const Duration(seconds: splashDuration))
          .then((value) => {
                FlutterNativeSplash.remove(),
              });

      //! screen orientation
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    });

    //! initialisation of dotenv
    await dotenv.load(
      fileName: "assets/envs/${await EnvChecker.fetchEnv()}.env",
    );

    //! services or package config init
    // await FirebaseConfig.init(
    //   env: await EnvChecker.fetchEnv(),
    // );
    HttpOverrides.global = new HttpOverridesHelper();
    Renterd.init();

    //! initialisation of service locator
    await initSl();
  }
}
