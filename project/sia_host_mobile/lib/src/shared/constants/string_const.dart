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

const menuVerticalForFilesList = <String>[
  Lang.addFileText,
];

const menuFilesList = <String>[
  Lang.openFileText,
  Lang.viewDetailFileText,
  Lang.renameFileText,
  Lang.copyAndPasteFileText,
  Lang.deleteFileText,
];

// var mimeTypeText = "text/plain";

const errorDstBucket =
    "couldn't copy object: failed to fetch dst bucket: record not found";

const errorSrcObject =
    "couldn't copy object: failed to fetch src object: record not found";

const errorRenameObject = "can't rename dirs with mode single";

const storageDownload = "/storage/emulated/0/Download";
