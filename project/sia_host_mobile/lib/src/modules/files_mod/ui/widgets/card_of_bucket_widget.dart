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
          SizedBox(
            width: 160.w,
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 20.w, bottom: 35.0.h),
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
                  FittedBox(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: ColorsApp.whiteColor,
                        fontSize: 20.0.sp,
                        fontFamily: "Manrope",
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: onPressed,
    );
  }
}
