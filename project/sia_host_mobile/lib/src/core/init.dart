import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renterd/renterd.dart';

import '../shared/constants/int_const.dart';
import '../shared/constants/pngs_const.dart';
import '../shared/constants/svgs_const.dart';
import '../shared/services/http/configs/http_overrides_helper.dart';
import 'configs/injectors_config/injector.dart';

class Init {
  static Future<void> launch() async {
    //! WidgetFlutter and DeviceType Initialization
    // active these lines down
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      Element? context = WidgetsFlutterBinding.ensureInitialized().rootElement;

      //! Prelod All the svg
      final svgs = [
        IconSvgs.eyeOffSvg,
        IconSvgs.homeSvg,
        IconSvgs.searchSvg,
        IconSvgs.chartSvg,
        IconSvgs.clockSvg,
        IconSvgs.smsNotifsSvg,
        IconSvgs.arrowDropUpSvg,
        IconSvgs.checkTrackSvg,
        IconSvgs.moreVerticalSvg,
        IconSvgs.locationSvg,
        IconSvgs.settingsSvg,
      ];
      for (var svgImage in svgs) {
        await svg.cache.putIfAbsent(SvgAssetLoader(svgImage).cacheKey(null),
            () => SvgAssetLoader(svgImage).loadBytes(null));
      }

      //! Prelod All the png
      final pngs = [
        Pngs.dataAnalysisPng,
        Pngs.fileSynchronizationPng,
        Pngs.serverStatusPng,
        Pngs.secureServerPng,
        Pngs.folderPng,
      ];
      for (var pngImage in pngs) {
        await precacheImage(Image.asset(pngImage).image, context!);
      }

      //! Prelod All the jpg
      final jpgs = [];
      for (var jpgImage in jpgs) {
        await precacheImage(Image.asset(jpgImage).image, context!);
      }

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

    //! Monitoring and performance analysis
    debugProfileBuildsEnabled = true;

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
