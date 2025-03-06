import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/language_config/translator.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';
import '../../features/fetch_and_show_one_host/domain/entities/host_info_entity.dart';

class PriceInfoBarWidget extends StatelessWidget {
  final HostInfoEntity hostModel;
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
              Translator.of(context)!.translate(Lang.uploadPriceText),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 12.0.sp,
                color: ColorsApp.rockBlueColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              strutStyle: const StrutStyle(
                fontFamily: "Manrope",
              ),
              text: TextSpan(
                text: hostModel.uploadPrice.toString().substring(0, 2),
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 24.0.sp,
                  color: ColorsApp.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "sc/tb",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 10.0.sp,
                      color: ColorsApp.whiteColor,
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
              Translator.of(context)!.translate(Lang.downloadPriceText),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 12.0.sp,
                color: ColorsApp.rockBlueColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              strutStyle: const StrutStyle(
                fontFamily: "Manrope",
              ),
              text: TextSpan(
                text: hostModel.downloadPrice.toString().substring(0, 2),
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 24.0.sp,
                  color: ColorsApp.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "sc/tb",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 10.0.sp,
                      color: ColorsApp.rockBlueColor,
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
              Translator.of(context)!.translate(Lang.storagePriceText),
              style: TextStyle(
                fontFamily: "Manrope",
                fontSize: 12.0.sp,
                color: ColorsApp.rockBlueColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            RichText(
              strutStyle: const StrutStyle(
                fontFamily: "Manrope",
              ),
              text: TextSpan(
                text: hostModel.storagePrice.toString().substring(0, 2),
                style: TextStyle(
                  fontFamily: "Manrope",
                  fontSize: 24.0.sp,
                  color: ColorsApp.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "sc/tb",
                    style: TextStyle(
                      fontFamily: "Manrope",
                      fontSize: 10.0.sp,
                      color: ColorsApp.rockBlueColor,
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
