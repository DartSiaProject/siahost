import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart'
    as color;
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart' as lang;

import '../../../../core/configs/language_config/translator.dart';
import '../../features/fetch_and_show_one_host/domain/entities/host_info_entity.dart';
import 'card_widgets/card_info_widget.dart';

class InfoListWidget extends StatelessWidget {
  final HostInfoEntity hostModel;
  const InfoListWidget({super.key, required this.hostModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardInfoWidget(
          title: lang.currentText,
          value: Translator.of(context)!
              .translate(hostModel.online ? lang.onlineText : lang.offlineText),
        ),
        CardInfoWidget(
          title: "accept_text",
          value: Translator.of(context)!.translate(
              hostModel.acceptingContracts ? lang.yesText : lang.noText),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(new ClipboardData(text: hostModel.pubKey))
                .whenComplete(
              () {
                Fluttertoast.showToast(
                  msg: Translator.of(context)!.translate(lang.copiedText),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: color.paleTealColor,
                  textColor: color.whiteColor,
                  fontSize: 20.0.sp,
                );
              },
            );
          },
          child: CardInfoWidget(
            title: lang.hostAddressText,
            value: hostModel.pubKey,
          ),
        ),
        CardInfoWidget(
          title: lang.contractPriceText,
          value:
              "${hostModel.contractPrice.toStringAsPrecision(5).substring(0, 4)} Sc",
        ),
        CardInfoWidget(
          title: lang.totalStorageText,
          value:
              "${hostModel.totalStorage.toStringAsPrecision(5).substring(0, 4)} Tb",
        ),
        CardInfoWidget(
          title: lang.usedStorageText,
          value:
              "${hostModel.usedStorage.toStringAsPrecision(5).substring(0, 4)} Tb",
        ),
        CardInfoWidget(
          title: lang.availableStorageText,
          value:
              "${hostModel.remainingStorage.toStringAsPrecision(5).substring(0, 4)} Tb",
        ),
      ],
    );
  }
}
