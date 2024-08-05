import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../../../shared/constants/pngs_const.dart';

class CardOfBucketWidget extends StatelessWidget {
  final VoidCallback onPressed;

  final String label;
  final int totalFiles;

  const CardOfBucketWidget({
    super.key,
    required this.totalFiles,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Image.asset(
            Pngs.folderPng,
            width: 160.w,
            height: 140.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$totalFiles ${Translator.of(context)!.translate(Lang.filesText)}",
                  style: TextStyle(
                    color: ColorsApp.whiteColor.withOpacity(0.7),
                    fontSize: 12.0.sp,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: ColorsApp.whiteColor,
                    fontSize: 20.0.sp,
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      onTap: onPressed,
    );
  }
}
