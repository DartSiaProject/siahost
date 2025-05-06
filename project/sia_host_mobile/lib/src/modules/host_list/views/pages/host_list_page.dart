import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/host_list/logic/bloc/host_list_bloc.dart';
import 'package:sia_host_mobile/src/modules/host_list/views/widgets/host_card_widget.dart';
import 'package:sia_host_mobile/src/modules/host_list/views/widgets/search_host_widget.dart';
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
    return BlocListener<HostListBloc, HostListState>(
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
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<HostListBloc>().add(HostListFetchedEvent());
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text(context.l10n.searchTitle),
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

        if (status == StateStatus.loading) {
          return const AppLoader();
        }

        final hosts =
            (state.searchedHost != null) ? [state.searchedHost!] : state.hosts;

        if (status == StateStatus.failure) {
          if (hosts.isEmpty) {
            return AppErrorWidget(
              onRefresh: () {
                context.read<HostListBloc>().add(HostListFetchedEvent());
              },
              message: translateErrorMessage(context, state.error!),
            );
          }
        }

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: hosts.length,
          itemBuilder: (BuildContext context, int hostIndex) {
            return HostCardWidget(
              host: hosts[hostIndex],
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
