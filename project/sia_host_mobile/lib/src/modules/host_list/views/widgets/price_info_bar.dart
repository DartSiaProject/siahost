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
    return SizedBox(
      height: kTextTabBarHeight + 16,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
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
                    text: HostHelper.formatPricing(
                      host.uploadPrice,
                      lowerCase: true,
                    ),
                    style: textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' /${l10n.teraByte.toLowerCase()}',
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
                        text: ' /${l10n.teraByte.toLowerCase()}',
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
                        text: ' /${l10n.teraByte.toLowerCase()}',
                        style: textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
