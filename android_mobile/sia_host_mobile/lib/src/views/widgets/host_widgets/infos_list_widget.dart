import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/logic/models/host.dart';
import 'package:sia_host_mobile/src/utils/helpers/language_helpers/language_translation_helper.dart';
import 'package:sia_host_mobile/src/views/widgets/host_widgets/card_info_widget.dart';

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
        CardInfoWidget(
          title: "host_address_text",
          value: hostModel.pubkey,
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
        // CardInfoWidget(
        //   title: "available_storage_text",
        //   value: hostModel,
        // ), // todo :  il manque available storage
      ],
    );
  }
}
