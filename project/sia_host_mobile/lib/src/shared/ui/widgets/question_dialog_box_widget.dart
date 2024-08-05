import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/language_config/translator.dart';

class QuestionDialogBoxWidget extends StatelessWidget {
  final String title;
  final Widget listBuilderItems;

  const QuestionDialogBoxWidget({
    super.key,
    required this.title,
    required this.listBuilderItems,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      title: Text(
        Translator.of(context)!.translate(
          title,
        ),
        style: TextStyle(
          fontFamily: "ReadexPro",
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SizedBox(
            width: 404.0.w,
            height: 200.0.h,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: listBuilderItems,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
