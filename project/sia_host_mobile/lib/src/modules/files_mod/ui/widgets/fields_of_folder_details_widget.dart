import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';

class FieldsOfFolderDetailsWidget extends StatelessWidget {
  final String folderName;
  final String folderSize;
  final String totalsFile;

  const FieldsOfFolderDetailsWidget({
    super.key,
    required this.folderName,
    required this.folderSize,
    required this.totalsFile,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 16.0.h,
        ),
        Text(
          "${Translator.of(context)!.translate(Lang.labelNameText)} : $folderName",
          style: TextStyle(
            color: ColorsApp.whiteColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        Text(
          "${Translator.of(context)!.translate(Lang.labelSizeText)} : $folderSize",
          style: TextStyle(
            color: ColorsApp.whiteColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        Text(
          "${Translator.of(context)!.translate(Lang.labelTotalFilesText)} : $totalsFile",
          style: TextStyle(
            color: ColorsApp.whiteColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
      ],
    );
  }
}
