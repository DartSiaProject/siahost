import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../shared/constants/colors_const.dart';
import '../../../../../shared/constants/svgs_const.dart';

class CardNetworkWidget extends StatelessWidget {
  final String value;
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
        color: ColorsApp.tunaColor,
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FittedBox(
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 32.0.sp,
                  color: ColorsApp.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              descriptifText,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 12.0.sp,
                color: ColorsApp.cottonSeedColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                SvgPicture.asset(
                  IconSvgs.arrowDropUpSvg,
                  width: 25.0.w,
                  height: 25.0.h,
                ),
                Text(
                  "+$valuePercent%",
                  style: TextStyle(
                    fontFamily: "DmSans",
                    fontSize: 12.0.sp,
                    color: ColorsApp.caribbeanGreenColor,
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
