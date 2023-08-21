import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';

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
                LanguageTranslationHelper.of(context)!
                    .translate("max_download_field_text"),
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
              decoration: InputDecoration(
                hintText: LanguageTranslationHelper.of(context)!
                    .translate("max_download_field_text"),
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
                LanguageTranslationHelper.of(context)!
                    .translate("max_upload_field_text"),
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
              decoration: InputDecoration(
                hintText: LanguageTranslationHelper.of(context)!
                    .translate("max_upload_field_text"),
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
                LanguageTranslationHelper.of(context)!
                    .translate("max_storage_field_text"),
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
              decoration: InputDecoration(
                hintText: LanguageTranslationHelper.of(context)!
                    .translate("max_storage_field_text"),
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
                LanguageTranslationHelper.of(context)!
                    .translate("max_contract_field_text"),
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
              decoration: InputDecoration(
                hintText: LanguageTranslationHelper.of(context)!
                    .translate("max_contract_field_text"),
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
                LanguageTranslationHelper.of(context)!
                    .translate("min_account_field_text"),
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
              decoration: InputDecoration(
                hintText: LanguageTranslationHelper.of(context)!
                    .translate("min_account_field_text"),
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
                LanguageTranslationHelper.of(context)!
                    .translate("max_rpc_field_text"),
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
              decoration: InputDecoration(
                hintText: LanguageTranslationHelper.of(context)!
                    .translate("max_rpc_field_text"),
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
