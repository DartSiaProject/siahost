import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'lang_const.dart';
import 'pngs_const.dart';
import 'svgs_const.dart';

const organization = "sia";
const app = "sia_host_mobile";

final onboardingList = <Map<String, dynamic>>[
  {
    "img": {
      "image": Pngs.dataAnalysisPng,
      "width": 300.0.w,
      "height": 284.34.h,
    },
    "title": Lang.hostTitleText,
    "description": Lang.hostDescriptionText,
  },
  {
    "img": {
      "image": Pngs.fileSynchronizationPng,
      "width": 300.0.w,
      "height": 291.86.h,
    },
    "title": Lang.dataTitleText,
    "description": Lang.dataDescriptionText,
  },
  {
    "img": {
      "image": Pngs.serverStatusPng,
      "width": 300.0.w,
      "height": 277.25.h,
    },
    "title": Lang.networkTitleText,
    "description": Lang.networkDescriptionText,
  },
];

const bottomNavigatorItems = <Map<String, dynamic>>[
  {
    "icon": IconSvgs.homeSvg,
    "label": Lang.homeText,
  },
  {
    "icon": IconSvgs.searchSvg,
    "label": Lang.searchText,
  },
  {
    "icon": IconSvgs.chartSvg,
    "label": Lang.chartText,
  },
  {
    "icon": IconSvgs.settingsSvg,
    "label": Lang.configText,
  },
  {
    "icon": IconSvgs.filesSvg,
    "label": Lang.filesText,
  },
];

const zeroCompletion_1 = "00000000000000000";
const zeroCompletion_2 = "0000000000000000";
const urlPattern =
    r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

const bucketsListItems = <Map<String, dynamic>>[
  {"image": Pngs.folderPng, "label": "Bucket 1", "files": []},
  {"image": Pngs.folderPng, "label": "Bucket 2", "files": []},
];
