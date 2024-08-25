import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/extensions/string_ext.dart';
import '../../../../shared/global/list_variable.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';

class FieldsOfFileCopyWidget extends StatelessWidget {
  final TextEditingController newFileNameController;
  final ValueChanged<String> bucketNameSelected;

  const FieldsOfFileCopyWidget({
    super.key,
    required this.newFileNameController,
    required this.bucketNameSelected,
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
        DropdownButtonFormField<String>(
          value: bucketNameList.first,
          onChanged: (String? value) {
            bucketNameSelected.call(value!);
          },
          decoration: InputDecoration(
            hintText: Translator.of(context)!.translate(Lang.addBucketNameText),
          ),
          items: bucketNameList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value.capitalizeLetter(),
                style: TextStyle(
                  color: ColorsApp.blackColor,
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          height: 16.0.h,
        ),
      ],
    );
  }
}
