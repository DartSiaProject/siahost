import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/language_config/translator.dart';

class FormDialogBoxWidget extends StatelessWidget {
  final ScrollController? scrollController;
  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final List<Widget> children;
  final double width;
  final double height;

  const FormDialogBoxWidget({
    super.key,
    this.scrollController,
    required this.title,
    required this.children,
    this.mainAxisSize = MainAxisSize.min,
    required this.crossAxisAlignment,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      insetPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      title: Text(
        Translator.of(context)!.translate(title),
        style: TextStyle(
          fontFamily: "ReadexPro",
          fontSize: 15.0.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: crossAxisAlignment,
                  mainAxisSize: mainAxisSize,
                  children: children,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
