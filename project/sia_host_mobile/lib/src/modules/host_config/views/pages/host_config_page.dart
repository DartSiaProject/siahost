import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/modules/current_host/logic/cubit/current_host_cubit.dart';
import 'package:sia_host_mobile/src/modules/host_config/logic/cubit/host_config_cubit.dart';
import 'package:sia_host_mobile/src/modules/host_config/views/widgets/host_config_form.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@RoutePage()
class HostConfigPage extends StatelessWidget {
  const HostConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HostConfigCubit(sl.get()),
      child: const HostConfigView(),
    );
  }
}

class HostConfigView extends StatelessWidget {
  const HostConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CurrentHostCubit, CurrentHostState>(
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
              title: Text(context.l10n.hostConfigTitle),
              pinned: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      return HostConfigForm(
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
    );
  }
}
