import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/extensions/extensions.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';

class PriceInfoBarWidget extends StatelessWidget {
  const PriceInfoBarWidget({required this.host, super.key});
  final HostInfoModel host;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 8,
      children: <Widget>[
        Column(
          spacing: 8,
          children: <Widget>[
            Text(
              l10n.uploadPrice,
              style: textTheme.bodyMedium,
            ),
            RichText(
              text: TextSpan(
                text: HostHelper.formatPricing(host.uploadPrice),
                style: textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${l10n.scPerTB.toLowerCase()}',
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          spacing: 8,
          children: <Widget>[
            Text(
              l10n.downloadPrice,
              style: textTheme.bodyMedium,
            ),
            RichText(
              text: TextSpan(
                text: HostHelper.formatPricing(host.downloadPrice),
                style: textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${l10n.scPerTB.toLowerCase()}',
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          spacing: 8,
          children: <Widget>[
            Text(
              l10n.storagePrice,
              style: textTheme.bodyMedium,
            ),
            RichText(
              text: TextSpan(
                text: HostHelper.formatPricing(host.storagePrice),
                style: textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${l10n.scPerTB.toLowerCase()}',
                    style: textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        // Flex(
        //   direction: Axis.vertical,
        //   children: <Widget>[
        //     Text(
        //       Translator.of(context)!.translate(Lang.downloadPriceText),
        //       style: TextStyle(
        //         fontFamily: "Manrope",
        //         fontSize: 12.0.sp,
        //         color: ColorsApp.rockBlueColor,
        //         fontWeight: FontWeight.w400,
        //       ),
        //     ),
        //     RichText(
        //       strutStyle: const StrutStyle(
        //         fontFamily: "Manrope",
        //       ),
        //       text: TextSpan(
        //         text: (host.downloadPrice / (pow(10, 12))).toStringAsFixed(0),
        //         style: TextStyle(
        //           fontFamily: "Manrope",
        //           fontSize: 24.0.sp,
        //           color: ColorsApp.whiteColor,
        //           fontWeight: FontWeight.w700,
        //         ),
        //         children: <TextSpan>[
        //           TextSpan(
        //             text: "sc/tb",
        //             style: TextStyle(
        //               fontFamily: "Manrope",
        //               fontSize: 10.0.sp,
        //               color: ColorsApp.rockBlueColor,
        //               fontWeight: FontWeight.w400,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        // Flex(
        //   direction: Axis.vertical,
        //   children: <Widget>[
        //     Text(
        //       Translator.of(context)!.translate(Lang.storagePriceText),
        //       style: TextStyle(
        //         fontFamily: "Manrope",
        //         fontSize: 12.0.sp,
        //         color: ColorsApp.rockBlueColor,
        //         fontWeight: FontWeight.w400,
        //       ),
        //     ),
        //     RichText(
        //       strutStyle: const StrutStyle(
        //         fontFamily: "Manrope",
        //       ),
        //       text: TextSpan(
        //         text: (host.storagePrice / (pow(10, 12))).toStringAsFixed(2),
        //         style: TextStyle(
        //           fontFamily: "Manrope",
        //           fontSize: 24.0.sp,
        //           color: ColorsApp.whiteColor,
        //           fontWeight: FontWeight.w700,
        //         ),
        //         children: <TextSpan>[
        //           TextSpan(
        //             text: "sc/tb",
        //             style: TextStyle(
        //               fontFamily: "Manrope",
        //               fontSize: 10.0.sp,
        //               color: ColorsApp.rockBlueColor,
        //               fontWeight: FontWeight.w400,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }
}
