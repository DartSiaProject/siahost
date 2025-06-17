import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/current_host/data/models/current_host_info.dart';
import 'package:sia_host_mobile/src/modules/current_host/logic/cubit/current_host_cubit.dart';
import 'package:sia_host_mobile/src/modules/current_host/views/widgets/card_speed_widget.dart';
import 'package:sia_host_mobile/src/modules/current_host/views/widgets/current_host_card_widget.dart';
import 'package:sia_host_mobile/src/shared/extensions/extensions.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';

@RoutePage()
class CurrentHostPage extends StatelessWidget {
  const CurrentHostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CurrentHostCubit, CurrentHostState>(
        listener: (context, state) {
          if (state is CurrentHostFailure) {
            AppSnackBar.error(
              message: translateErrorMessage(context, state.error),
            );
          }
        },
        listenWhen: (previous, current) {
          return current is CurrentHostFailure;
        },
        child: RefreshIndicator.adaptive(
          onRefresh: context.read<CurrentHostCubit>().getData,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverAppBar(
                title: Text(context.l10n.myHostTitle),
                floating: true,
                snap: true,
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverToBoxAdapter(
                  child: BlocBuilder<CurrentHostCubit, CurrentHostState>(
                    builder: (context, state) {
                      if (state is CurrentHostLoading) return const AppLoader();

                      if (state is CurrentHostFailure) {
                        return AppErrorWidget(
                          onRefresh: () {
                            context.read<CurrentHostCubit>().getData();
                          },
                          message: translateErrorMessage(context, state.error),
                        );
                      }

                      if (state is CurrentHostSuccess) {
                        return CurrentHostView(
                          hostInfo: state.hostInfo,
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentHostView extends StatelessWidget {
  const CurrentHostView({required this.hostInfo, super.key});

  final CurrentHostInfoModel hostInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          childAspectRatio: 0.56,
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(15.0.r),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: AppTheme.primaryColor,
                        width: 3,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Flex(
                    direction: Axis.vertical,
                    spacing: 6.0.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        context.l10n.currentHostHeight,
                        // style: context.textTheme.labelMedium,
                      ),
                      Text(
                        hostInfo.blockHeight.substring(0, 3),
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontSize: 24.0.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              spacing: 16.0.h,
              children: <Widget>[
                Expanded(
                  child: CurrentHostCardWidget(
                    title: context.l10n.maxDownloadPrice,
                    value: hostInfo.maxDownloadPrice,
                    padding: const EdgeInsets.only(left: 10),
                  ),
                ),
                Expanded(
                  child: CurrentHostCardWidget(
                    title: context.l10n.maxUploadPrice,
                    value: hostInfo.maxUploadPrice,
                    padding: const EdgeInsets.only(left: 10),
                  ),
                ),
              ],
            ),
          ],
        ),

        // download and upload speed
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20.0.w,
          children: <Widget>[
            CardSpeedWidget(
              title: context.l10n.downloadSpeed,
              value: 9,
            ),
            CardSpeedWidget(
              title: context.l10n.uploadSpeed,
              value: 5,
            ),
          ],
        ),

        // prices
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20.0.w,
          mainAxisSpacing: 20.0.h,
          children: <Widget>[
            CurrentHostCardWidget(
              title: context.l10n.maxStoragePrice,
              value: hostInfo.maxStoragePrice,
              padding: const EdgeInsets.only(left: 10),
            ),
            CurrentHostCardWidget(
              title: context.l10n.maxContractsPrice,
              value: hostInfo.maxContractPrice,
              padding: const EdgeInsets.only(left: 10),
            ),
            CurrentHostCardWidget(
              title: context.l10n.minAccountExpiry,
              value: hostInfo.minAccountExpiry,
              padding: const EdgeInsets.only(left: 10),
            ),
            CurrentHostCardWidget(
              title: context.l10n.maxRPCPrice,
              value: hostInfo.maxRPCPrice,
              padding: const EdgeInsets.only(left: 10),
            ),
          ],
        ),
      ],
    );
  }
}
