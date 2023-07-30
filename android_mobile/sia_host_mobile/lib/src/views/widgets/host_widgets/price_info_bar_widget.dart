import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/logic/models/host.dart';
import 'package:sia_host_mobile/src/utils/constants/colors_const.dart' as color;
import 'package:sia_host_mobile/src/utils/helpers/language_helpers/language_translation_helper.dart';

class PriceInfoBarWidget extends StatelessWidget {
  final Host hostModel;
  const PriceInfoBarWidget({
    super.key,
    required this.hostModel,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              LanguageTranslationHelper.of(context)!
                  .translate("upload_price_text"),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 12.0.sp,
                color: color.rockBlueColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              strutStyle: const StrutStyle(
                fontFamily: "Manrope",
              ),
              text: TextSpan(
                text: hostModel.uploadPrice.toString(),
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 24.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "sc/tb",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 10.0.sp,
                      color: color.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              LanguageTranslationHelper.of(context)!
                  .translate("download_price_text"),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 12.0.sp,
                color: color.rockBlueColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              strutStyle: const StrutStyle(
                fontFamily: "Manrope",
              ),
              text: TextSpan(
                text: hostModel.downloadPrice.toString(),
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 24.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "sc/tb",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 10.0.sp,
                      color: color.rockBlueColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              LanguageTranslationHelper.of(context)!
                  .translate("storage_price_text"),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 12.0.sp,
                color: color.rockBlueColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              strutStyle: const StrutStyle(
                fontFamily: "Manrope",
              ),
              text: TextSpan(
                text: hostModel.storagePrice.toString(),
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 24.0.sp,
                  color: color.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "sc/tb",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 10.0.sp,
                      color: color.rockBlueColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
