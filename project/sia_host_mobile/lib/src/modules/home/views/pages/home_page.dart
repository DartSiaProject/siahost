import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/home/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/home/logic/cubit/network_overview_cubit.dart';
import 'package:sia_host_mobile/src/modules/home/views/widgets/bar_chart_networking.dart';
import 'package:sia_host_mobile/src/modules/home/views/widgets/card_network_widget.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkOverviewCubit, NetworkOverviewState>(
      listener: (context, state) {
        if (state is NetworkOverviewFailure) {
          AppSnackBar.error(
            message: translateErrorMessage(context, state.error),
          );
        }
      },
      listenWhen: (previous, current) => current is NetworkOverviewFailure,
      child: RefreshIndicator.adaptive(
        onRefresh: context.read<NetworkOverviewCubit>().getData,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(context.l10n.homeTitle),
              floating: true,
              snap: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: BlocBuilder<NetworkOverviewCubit, NetworkOverviewState>(
                  builder: (context, state) {
                    return switch (state) {
                      NetworkOverviewLoading() => const AppLoader(),
                      NetworkOverviewSuccess() => HomeView(
                          networkData: state.networkData,
                        ),
                      NetworkOverviewFailure() => AppErrorWidget(
                          onRefresh: () {
                            context.read<NetworkOverviewCubit>().getData();
                          },
                          message: translateErrorMessage(context, state.error),
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({required this.networkData, super.key});

  final NetworkDataModel networkData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 35,
            mainAxisSpacing: 35,
            children: <Widget>[
              CardNetworkWidget(
                value: networkData.totalCurrentHosts.toString(),
                description: context.l10n.currentActiveHosts,
                percentage: 2,
              ),
              CardNetworkWidget(
                value: networkData.networkStorageFormatted(context),
                description: context.l10n.totalNetworkStorage,
                percentage: 2,
              ),
              CardNetworkWidget(
                value: networkData.usedStorageFormatted(context),
                description: context.l10n.totalUsedStorage,
                percentage: 2,
              ),
              CardNetworkWidget(
                value: networkData.pricePerTBFormatted(context),
                description: context.l10n.pricePerTBPerMonth,
                percentage: 2,
              ),
            ],
          ),
          SizedBox(
            height: 20.0.h,
          ),
          BarChartNetworking(
            activeContractCount: networkData.activeContractCount,
          ),
        ],
      ),
    );
  }
}
