import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../shared/constants/colors_const.dart';
import '../../../../shared/constants/lang_const.dart';

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
          title: Lang.currentText,
          value: Translator.of(context)!
              .translate(hostModel.online ? Lang.onlineText : Lang.offlineText),
        ),
        CardInfoWidget(
          title: "accept_text",
          value: Translator.of(context)!.translate(
              hostModel.acceptingContracts ? Lang.yesText : Lang.noText),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(new ClipboardData(text: hostModel.pubKey))
                .whenComplete(
              () {
                Fluttertoast.showToast(
                  msg: Translator.of(context)!.translate(Lang.copiedText),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: ColorsApp.paleTealColor,
                  textColor: ColorsApp.whiteColor,
                  fontSize: 20.0.sp,
                );
              },
            );
          },
          child: CardInfoWidget(
            title: Lang.hostAddressText,
            value: hostModel.pubKey,
          ),
        ),
        CardInfoWidget(
          title: Lang.contractPriceText,
          value:
              "${hostModel.contractPrice.toStringAsPrecision(5).substring(0, 4)} Sc",
        ),
        CardInfoWidget(
          title: Lang.totalStorageText,
          value:
              "${hostModel.totalStorage.toStringAsPrecision(5).substring(0, 4)} Tb",
        ),
        CardInfoWidget(
          title: Lang.usedStorageText,
          value:
              "${hostModel.usedStorage.toStringAsPrecision(5).substring(0, 4)} Tb",
        ),
        CardInfoWidget(
          title: Lang.availableStorageText,
          value:
              "${hostModel.remainingStorage.toStringAsPrecision(5).substring(0, 4)} Tb",
        ),
      ],
    );
  }
}
