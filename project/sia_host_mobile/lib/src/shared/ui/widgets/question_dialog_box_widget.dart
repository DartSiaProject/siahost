import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors_const.dart';

import '../../../core/configs/language_config/translator.dart';

class QuestionDialogBoxWidget extends StatelessWidget {
  final String title;
  final Widget builderItems;

  const QuestionDialogBoxWidget({
    super.key,
    required this.title,
    required this.builderItems,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      backgroundColor: ColorsApp.bleachedCedarColor,
      title: Text(
        Translator.of(context)!.translate(
          title,
        ),
        style: TextStyle(
          fontFamily: "ReadexPro",
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w600,
          color: ColorsApp.whiteColor,
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SizedBox(
            width: 404.0.w,
            height: 100.0.h,
            child: builderItems,
          );
        },
      ),
    );
  }
}
