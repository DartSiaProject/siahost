import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';

class FieldsOfFileRenameWidget extends StatelessWidget {
  final TextEditingController fileRenameController;

  const FieldsOfFileRenameWidget({
    super.key,
    required this.fileRenameController,
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
          controller: fileRenameController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: TextStyle(
            color: ColorsApp.blackColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: Translator.of(context)!.translate(Lang.renameTheFileText),
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
      ],
    );
  }
}
