import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../logic/models/host.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/language_helpers/language_translation_helper.dart';
import 'card_info_widget.dart';

class InfoListWidget extends StatelessWidget {
  final Host hostModel;
  const InfoListWidget({super.key, required this.hostModel});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CardInfoWidget(
          title: "current_text",
          value: LanguageTranslationHelper.of(context)!
              .translate(hostModel.online ? "online_text" : "offline_text"),
        ),
        CardInfoWidget(
          title: "accept_text",
          value: LanguageTranslationHelper.of(context)!
              .translate(hostModel.acceptingContracts ? "yes_text" : "no_text"),
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(new ClipboardData(text: hostModel.pubkey))
                .whenComplete(
              () {
                Fluttertoast.showToast(
                  msg: LanguageTranslationHelper.of(context)!
                      .translate("copied_text"),
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
            title: "host_address_text",
            value: hostModel.pubkey,
          ),
        ),
        CardInfoWidget(
          title: "contract_price_text",
          value: "${hostModel.contractPrice} Sc",
        ),
        CardInfoWidget(
          title: "total_storage_text",
          value: "${hostModel.totalStorage} Tb",
        ),
        CardInfoWidget(
          title: "used_storage_text",
          value: "${hostModel.usedStorage} Tb",
        ),
        CardInfoWidget(
          title: "available_storage_text",
          value: "${hostModel.totalStorage - hostModel.usedStorage} Tb",
        ),
      ],
    );
  }
}
