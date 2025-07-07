import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/host_list/logic/bloc/host_list_bloc.dart';
import 'package:sia_host_mobile/src/modules/host_list/views/widgets/host_card_widget.dart';
import 'package:sia_host_mobile/src/modules/host_list/views/widgets/search_host_widget.dart';
import 'package:sia_host_mobile/src/shared/extensions/theme_ext.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/enums.dart';

@RoutePage()
class HostListPage extends StatelessWidget {
  const HostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HostListBloc, HostListState>(
        listener: (context, state) {
          if (state.status == StateStatus.searchingFailure) {
            AppSnackBar.error(
              message: context.l10n.cannotFindHostByKey,
            );
            return;
          }

          if (state.status == StateStatus.failure) {
            AppSnackBar.error(
              message: translateErrorMessage(context, state.error!),
            );
          }
        },
        listenWhen: (previous, current) {
          return current.status == StateStatus.searchingFailure ||
              current.status == StateStatus.failure;
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent &&
                context.read<HostListBloc>().state.hasMore) {
              context.read<HostListBloc>().add(const HostListFetchedEvent());
            }
            return true;
          },
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              // context.read<HostListBloc>().add(const HostListFetchedEvent());
              context
                  .read<HostListBloc>()
                  .add(const HostListFetchedEvent(reset: true));
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: Badge(
                    label: Text(
                      context.l10n.v2OnlyBadge,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    child: Text(context.l10n.searchTitle),
                  ),
                  floating: true,
                  snap: true,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight + 50),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: SearchHostWidget(),
                    ),
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  sliver: SliverToBoxAdapter(
                    child: HostListView(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HostListView extends StatelessWidget {
  const HostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HostListBloc, HostListState>(
      builder: (context, state) {
        final status = state.status;

        if (status == StateStatus.loading || status == StateStatus.searching) {
          return const AppLoader();
        }

        final hosts =
            (state.searchedHost != null) ? [state.searchedHost!] : state.hosts;

        if (status == StateStatus.failure) {
          if (hosts.isEmpty) {
            return AppErrorWidget(
              onRefresh: () {
                context
                    .read<HostListBloc>()
                    .add(const HostListFetchedEvent(reset: true));
              },
              message: translateErrorMessage(context, state.error!),
            );
          }
        }

        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          itemCount: hosts.length +
              (state.searchedHost != null
                  ? 0
                  : state.hasMore
                      ? 1
                      : 0),
          itemBuilder: (BuildContext context, int index) {
            if (index == hosts.length) {
              return const Padding(
                padding: EdgeInsets.all(8),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            return HostCardWidget(
              host: hosts[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
        );
      },
    );
  }
}
