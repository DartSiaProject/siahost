import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;

import '../../../../core/configs/language_config/translator.dart';

class CardSpeedWidget extends StatelessWidget {
  final String title;
  final int value;

  const CardSpeedWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.tunaColor,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              Translator.of(context)!.translate(title),
              style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 12.0.sp,
                  color: color.cottonSeedColor,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.ellipsis),
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: 16.0.h,
          ),
          CircularPercentIndicator(
            radius: 40.0,
            lineWidth: 8.0,
            animation: true,
            reverse: true,
            backgroundColor: color.spearmintColor.withOpacity(0.4),
            percent: value / 10,
            center: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  value.toString(),
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w500,
                    color: color.cottonSeedColor,
                    fontSize: 16.0.sp,
                  ),
                ),
                Text(
                  "Mbps",
                  style: TextStyle(
                    fontFamily: "Manrope",
                    fontWeight: FontWeight.w500,
                    color: color.cottonSeedColor,
                    fontSize: 12.0.sp,
                  ),
                ),
              ],
            ),
            progressColor: color.whiteColor,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ],
      ),
    );
  }
}
