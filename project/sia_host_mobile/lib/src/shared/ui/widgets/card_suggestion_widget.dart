import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors_const.dart';

class CardSuggestionWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  const CardSuggestionWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 1.0.w),
      child: SizedBox(
        height: 70.0.h,
        child: Material(
          color: ColorsApp.bleachedCedarColor,
          elevation: 2.0,
          borderRadius: BorderRadius.circular(8.0.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0.r),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(20.0.r),
              child: Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.whiteColor,
                    ),
                  ),
                  Icon(
                    Icons.check,
                    color: ColorsApp.spearmintColor,
                    size: 20.0.r,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
