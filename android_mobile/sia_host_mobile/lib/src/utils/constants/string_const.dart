import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pngs_const.dart' as png;
import 'svgs_const.dart' as icon;

const titleApp = "Sia Hosts Mobile";

final onboardingList = <Map<String, dynamic>>[
  {
    "img": {
      "image": png.dataAnalysisPng,
      "width": 300.0.w,
      "height": 284.34.h,
    },
    "title": "host_title_text",
    "description": "host_description_text",
  },
  {
    "img": {
      "image": png.fileSynchronizationPng,
      "width": 300.0.w,
      "height": 291.86.h,
    },
    "title": "data_title_text",
    "description": "data_description_text",
  },
  {
    "img": {
      "image": png.serverStatusPng,
      "width": 300.0.w,
      "height": 277.25.h,
    },
    "title": "network_title_text",
    "description": "network_description_text",
  },
];

const bottomNavigatorItems = <Map<String, dynamic>>[
  {
    "icon": icon.homeSvg,
    "label": "home_text",
  },
  {
    "icon": icon.searchSvg,
    "label": "search_text",
  },
  {
    "icon": icon.chartSvg,
    "label": "chart_text",
  },
  {
    "icon": icon.clockSvg,
    "label": "clock_text",
  },
];
