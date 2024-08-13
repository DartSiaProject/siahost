import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart';

class FieldsOfFileDetailsWidget extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String createdAt;

  const FieldsOfFileDetailsWidget({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 16.0.h,
        ),
        Text(
          fileName,
          style: TextStyle(
            color: ColorsApp.blackColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        Text(
          fileSize,
          style: TextStyle(
            color: ColorsApp.blackColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
        Text(
          createdAt,
          style: TextStyle(
            color: ColorsApp.blackColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16.0.h,
        ),
      ],
    );
  }
}
