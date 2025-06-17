import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/host_list/views/widgets/card_info_widget.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';

class HostDetailsListInfo extends StatelessWidget {
  const HostDetailsListInfo({required this.host, super.key});
  final HostInfoModel host;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardInfoWidget(
          title: l10n.currentStatus,
          value: l10n.online,
        ),
        CardInfoWidget(
          title: l10n.acceptingContracts,
          value: host.acceptingContracts ? l10n.yes : l10n.no,
        ),
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: host.publicKey)).whenComplete(
              () {
                AppSnackBar.success(message: l10n.addressCopiedSuccessfully);
              },
            );
          },
          child: CardInfoWidget(
            title: l10n.hostPublicAddress,
            value: host.publicKey,
          ),
        ),
        CardInfoWidget(
          title: l10n.totalStorage,
          value: HostHelper.formatStorage(context, host.totalStorage),
        ),
        CardInfoWidget(
          title: l10n.usedStorage,
          value: HostHelper.formatStorage(context, host.usedStorage),
        ),
        CardInfoWidget(
          title: l10n.availableStorage,
          value: HostHelper.formatStorage(context, host.remainingStorage),
        ),
      ],
    );
  }
}
