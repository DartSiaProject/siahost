import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/host_list/logic/cubit/host_location_cubit.dart';
import 'package:sia_host_mobile/src/modules/host_list/views/widgets/host_details_list_info.dart';
import 'package:sia_host_mobile/src/modules/host_list/views/widgets/price_info_bar.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

@RoutePage()
class HostDetailsPage extends StatelessWidget {
  const HostDetailsPage({required this.host, super.key});
  final HostInfoModel host;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HostLocationCubit(sl.get())
        ..getLocationAddress(
          host.netAddress,
        ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.medium(
            title: Text(context.l10n.hostInfo),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
              child: HostDetailsView(
                host: host,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HostDetailsView extends StatelessWidget {
  const HostDetailsView({required this.host, super.key});

  final HostInfoModel host;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Host scoring
        Container(
          decoration: BoxDecoration(
            color: Colors.teal.withValues(alpha: 0.46),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: CircularPercentIndicator(
              radius: 35,
              lineWidth: 8,
              animation: true,
              reverse: true,
              backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.4),
              percent: host.finalScore / 10,
              center: Text(
                (host.finalScore * 10).toStringAsFixed(1),
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              progressColor: Colors.white,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
        ),

        // Ip address
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            host.netAddress,
            style: context.textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
            maxLines: 1,
          ),
        ),

        // Location
        BlocBuilder<HostLocationCubit, HostLocationState>(
          builder: (context, state) {
            if (state is HostLocationLoading || state is HostLocationInitial) {
              return const AppLoader();
            }

            if (state is HostLocationSuccess) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: <Widget>[
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppTheme.primaryColor,
                  ),
                  Text(
                    state.location,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
        SizedBox(height: 16.h),

        // Pricing details
        PriceInfoBarWidget(host: host),
        SizedBox(height: 16.h),

        // Other details
        HostDetailsListInfo(host: host),
      ],
    );
  }
}
