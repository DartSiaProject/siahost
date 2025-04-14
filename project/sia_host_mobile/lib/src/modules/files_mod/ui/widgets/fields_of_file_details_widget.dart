import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';

class FieldsOfFileDetailsWidget extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String createdAt;

  const FieldsOfFileDetailsWidget({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.createdAt,
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
          "${Translator.of(context)!.translate(Lang.labelNameText)} : $fileName",
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
          "${Translator.of(context)!.translate(Lang.labelSizeText)} : $fileSize",
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
          "${Translator.of(context)!.translate(Lang.labelDateCreatedText)} : $createdAt",
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
