import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;

import '../../../../core/configs/language_config/translator.dart';

class CardMyHostInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  final EdgeInsetsGeometry padding;
  const CardMyHostInfoWidget({
    super.key,
    required this.title,
    required this.value,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0.w,
      decoration: BoxDecoration(
        color: color.tunaColor,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      padding: EdgeInsets.all(15.0.r),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            left: BorderSide(
              color: color.spearmintColor,
              width: 3.0,
            ),
          ),
        ),
        alignment: Alignment.centerLeft,
        padding: padding,
        child: Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              value.isEmpty
                  ? ""
                  : value.length > 2
                      ? value.substring(0, 3)
                      : value,
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 32.0.sp,
                color: color.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 6.0.h,
            ),
            Text(
              Translator.of(context)!.translate(title),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 12.0.sp,
                color: color.cottonSeedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
