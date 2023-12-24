import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';

class CardInfoWidget extends StatelessWidget {
  final String title;
  final String value;
  const CardInfoWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0.h),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: color.spearmintColor,
            width: 3.0,
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(5.0),
      child: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            LanguageTranslationHelper.of(context)!.translate(title),
            style: TextStyle(
              fontFamily: "Manrope",
              fontSize: 12.0.sp,
              color: color.cottonSeedColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6.0.h,
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: "Manrope",
              fontSize: 12.0.sp,
              color: color.spearmintColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
