import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart' as lang;

import '../../../../core/configs/language_config/translator.dart';

class FieldsWidget extends StatelessWidget {
  final TextEditingController maxDownloadController;
  final TextEditingController maxUploadController;
  final TextEditingController maxStorageController;
  final TextEditingController maxContractController;
  final TextEditingController minAccountController;
  final TextEditingController maxRpcController;

  const FieldsWidget({
    super.key,
    required this.maxDownloadController,
    required this.maxUploadController,
    required this.maxStorageController,
    required this.maxContractController,
    required this.minAccountController,
    required this.maxRpcController,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                Translator.of(context)!.translate(lang.maxDownloadFieldText),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: maxDownloadController,
              maxLength: 3,
              decoration: InputDecoration(
                counterText: "",
                hintText: Translator.of(context)!
                    .translate(lang.maxDownloadFieldText),
              ),
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: color.ironsideGreyColor,
                fontSize: 16.0.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                Translator.of(context)!.translate(lang.maxUploadFieldText),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: maxUploadController,
              maxLength: 3,
              decoration: InputDecoration(
                counterText: "",
                hintText:
                    Translator.of(context)!.translate(lang.maxUploadFieldText),
              ),
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: color.ironsideGreyColor,
                fontSize: 16.0.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                Translator.of(context)!.translate(lang.maxStorageFieldText),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: maxStorageController,
              maxLength: 3,
              decoration: InputDecoration(
                counterText: "",
                hintText:
                    Translator.of(context)!.translate(lang.maxStorageFieldText),
              ),
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: color.ironsideGreyColor,
                fontSize: 16.0.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                Translator.of(context)!.translate(lang.maxContractFieldText),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: maxContractController,
              maxLength: 3,
              decoration: InputDecoration(
                counterText: "",
                hintText: Translator.of(context)!
                    .translate(lang.maxContractFieldText),
              ),
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: color.ironsideGreyColor,
                fontSize: 16.0.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                Translator.of(context)!.translate(lang.minAccountFieldText),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: minAccountController,
              maxLength: 3,
              decoration: InputDecoration(
                counterText: "",
                hintText:
                    Translator.of(context)!.translate(lang.minAccountFieldText),
              ),
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: color.ironsideGreyColor,
                fontSize: 16.0.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                Translator.of(context)!.translate(lang.maxRpcFieldText),
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: maxRpcController,
              maxLength: 3,
              decoration: InputDecoration(
                counterText: "",
                hintText:
                    Translator.of(context)!.translate(lang.maxRpcFieldText),
              ),
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: color.ironsideGreyColor,
                fontSize: 16.0.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
