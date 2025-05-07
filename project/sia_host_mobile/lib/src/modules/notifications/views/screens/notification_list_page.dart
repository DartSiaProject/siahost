import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart';
import 'package:sia_host_mobile/src/shared/functions/translate_error_message.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/empty_list_widget.dart';

@RoutePage()
class NotificationListPage extends StatelessWidget {
  const NotificationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NotificationBloc, NotificationState>(
        listener: (context, state) {
          final status = state.status;

          if (status == StateStatus.paginatingFailure) {
            AppSnackBar.error(
              message: context.l10n.failedFetchedMoreAlert,
            );
          } else if (status == StateStatus.dismissingFailure) {
            AppSnackBar.error(
              message: context.l10n.failedDismissAlert,
            );
          }
        },
        listenWhen: (previous, current) {
          return current.status == StateStatus.paginatingFailure ||
              current.status == StateStatus.dismissingFailure;
        },
        child: RefreshIndicator.adaptive(
          onRefresh: () async {
            context
                .read<NotificationBloc>()
                .add(const NotificationFetchedEvent());
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              SliverAppBar.medium(
                leading: BackButton(
                  onPressed: () {
                    context.maybePop();
                  },
                ),
                title: Text(context.l10n.notificationsTitle),
                floating: true,
                snap: true,
                actions: [
                  BlocBuilder<NotificationBloc, NotificationState>(
                    buildWhen: (previous, current) {
                      return previous.notifications?.length !=
                          current.notifications?.length;
                    },
                    builder: (context, state) {
                      final notifis = state.notifications;
                      if (notifis == null || notifis.isEmpty) {
                        return const SizedBox.shrink();
                      }

                      return IconButton(
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: AppTheme.primaryColor,
                        ),
                        onPressed: () {
                          _showDismissDialog(context);
                        },
                      );
                    },
                  ),
                ],
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverToBoxAdapter(
                  child: NotificationListView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Dismissing dialog
  ///
  void _showDismissDialog(BuildContext context) {
    final l10n = context.l10n;
    showCupertinoDialog<dynamic>(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            l10n.notice,
            style: const TextStyle(
              color: AppTheme.primaryColor,
            ),
          ),
          content: Text(
            l10n.deleteAllNotifText,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                l10n.cancel,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                l10n.delete,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    ).then((value) {
      if (value == true) {
        context.read<NotificationBloc>().add(
              const NotificationDismissedEvent(
                ids: [],
              ),
            );
      }
    });
  }
}

class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        final status = state.status;

        if (status == StateStatus.loading ||
            status == StateStatus.initial ||
            status == StateStatus.dismissing) {
          return const AppLoader();
        }

        final notifications = state.notifications;
        if (status == StateStatus.failure) {
          if (notifications == null) {
            return AppErrorWidget(
              onRefresh: () {
                context
                    .read<NotificationBloc>()
                    .add(const NotificationFetchedEvent());
              },
              message: translateErrorMessage(context, state.error!),
            );
          }
        }

        if (notifications == null || notifications.isEmpty) {
          return EmptyListWidget(
            message: context.l10n.noAlertFound,
            onRefresh: () {
              context
                  .read<NotificationBloc>()
                  .add(const NotificationFetchedEvent());
            },
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            if (index >= notifications.length) {
              if (state.hasMore) {
                context.read<NotificationBloc>().add(
                      const NotificationFetchedEvent(
                        isRefresh: false,
                      ),
                    );
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }

            final notification = notifications[index];
            return NotificationCard(
              notification: notification,
            );
          },
          itemCount: notifications.length + (state.hasMore ? 1 : 0),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
        );
      },
    );
  }
}
