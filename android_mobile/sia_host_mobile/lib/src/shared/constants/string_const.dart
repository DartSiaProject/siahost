import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'lang_const.dart' as lang;
import 'pngs_const.dart' as png;
import 'svgs_const.dart' as icon;

const organization = "sia";
const app = "sia_host_mobile";

final onboardingList = <Map<String, dynamic>>[
  {
    "img": {
      "image": png.dataAnalysisPng,
      "width": 300.0.w,
      "height": 284.34.h,
    },
    "title": lang.hostTitleText,
    "description": lang.hostDescriptionText,
  },
  {
    "img": {
      "image": png.fileSynchronizationPng,
      "width": 300.0.w,
      "height": 291.86.h,
    },
    "title": lang.dataTitleText,
    "description": lang.dataDescriptionText,
  },
  {
    "img": {
      "image": png.serverStatusPng,
      "width": 300.0.w,
      "height": 277.25.h,
    },
    "title": lang.networkTitleText,
    "description": lang.networkDescriptionText,
  },
];

const bottomNavigatorItems = <Map<String, dynamic>>[
  {
    "icon": icon.homeSvg,
    "label": lang.homeText,
  },
  {
    "icon": icon.searchSvg,
    "label": lang.searchText,
  },
  {
    "icon": icon.chartSvg,
    "label": lang.chartText,
  },
  {
    "icon": icon.settingsSvg,
    "label": lang.configText,
  },
];

const zeroCompletion_1 = "00000000000000000";
const zeroCompletion_2 = "0000000000000000";
const urlPattern =
    r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
