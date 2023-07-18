import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/constants/svgs_const.dart' as icon;

class CardNetworkWidget extends StatelessWidget {
  final int value;
  final String descriptifText;
  final int valuePercent;

  const CardNetworkWidget({
    super.key,
    required this.value,
    required this.descriptifText,
    required this.valuePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 144.0.w,
      // height: 121.0.h,
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
                SvgPicture.asset(icon.pyramidSvg),
                SizedBox(
                  width: 5.0.w,
                ),
                Text(
                  "$valuePercent%",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16.0.sp,
                    color: color.spearmintColor,
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
