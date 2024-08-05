import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';

class FieldsOfFileCopyWidget extends StatelessWidget {
  final TextEditingController bucketNameDestController;
  final TextEditingController newFileNameController;

  const FieldsOfFileCopyWidget({
    super.key,
    required this.bucketNameDestController,
    required this.newFileNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        SizedBox(
          height: 16.0.h,
        ),
        TextField(
          controller: bucketNameDestController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          style: TextStyle(
            color: ColorsApp.blackColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: Translator.of(context)!.translate(Lang.addBucketNameText),
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        TextField(
          controller: newFileNameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: TextStyle(
            color: ColorsApp.blackColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText:
                Translator.of(context)!.translate(Lang.addTheNewFileNameText),
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
      ],
    );
  }
}
