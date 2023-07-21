import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/constants/svgs_const.dart' as icon;

class CardNetworkWidget extends StatelessWidget {
  final double value;
  final String descriptifText;
  final double valuePercent;

  const CardNetworkWidget({
    super.key,
    required this.value,
    required this.descriptifText,
    required this.valuePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.tunaColor,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              value.toString(),
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 32.0.sp,
                color: color.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              descriptifText,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12.0.sp,
                color: color.cottonSeedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                SvgPicture.asset(
                  icon.arrowDropUpSvg,
                  width: 25.0.w,
                  height: 25.0.h,
                ),
                Text(
                  "+$valuePercent%",
                  style: TextStyle(
                    fontFamily: "DmSans",
                    fontSize: 12.0.sp,
                    color: color.caribbeanGreenColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
