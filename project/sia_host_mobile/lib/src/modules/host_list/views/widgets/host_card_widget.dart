import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/models/host_info.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';

class HostCardWidget extends StatelessWidget {
  const HostCardWidget({
    required this.host,
    super.key,
  });

  final HostInfoModel host;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.pushRoute(HostDetailsRoute(host: host));
        },
        contentPadding: EdgeInsets.zero,
        leading: Container(
          margin: EdgeInsets.only(left: 15.0.w),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12.0.r),
            border: const Border.fromBorderSide(BorderSide.none),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircularPercentIndicator(
              radius: 17,
              lineWidth: 4,
              animation: true,
              reverse: true,
              backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.5),
              percent: host.finalScore / 10,
              center: Text(
                (host.finalScore * 10).toStringAsFixed(1),
                style: context.textTheme.labelMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              progressColor: Colors.white,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
        ),
        title: Text(
          '${context.l10n.host}: ${host.publicKey}',
          style: context.textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${context.l10n.totalStorage}: ${HostHelper.formatStorage(context, host.totalStorage)}',
          style: context.textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.forward),
        ),
      ),
    );
  }
}
