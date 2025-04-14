import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/configs/language_config/translator.dart';
import 'package:sia_host_mobile/src/shared/constants/colors_const.dart';
import 'package:sia_host_mobile/src/shared/constants/lang_const.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_empty_list_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_error_widget.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/custom_login_widget.dart';

import '../../notifications.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<NotificationBloc>().add(const NotificationFetchedEvent());
      },
      child: Scaffold(
        body: BlocConsumer<NotificationBloc, NotificationState>(
          listener: (context, state) {
            final status = state.status;

            if (status == NotificationStatus.paginatingFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to fetch more notifications'),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (status == NotificationStatus.dismissingFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to delete notification'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final status = state.status;

            if (status == NotificationStatus.loading ||
                status == NotificationStatus.initial ||
                status == NotificationStatus.dismissing) {
              return const Center(
                child:
                    CircularProgressIndicator(color: ColorsApp.spearmintColor),
              );
            }

            final notifications = state.notifications;
            if (status == NotificationStatus.failure) {
              if (notifications == null) {
                final error = state.error;
                if (error == Lang.makeLoginDemandText) {
                  return CustomLoginWidget(
                    showBackButton: true,
                    onLoginSuccess: () {
                      context
                          .read<NotificationBloc>()
                          .add(const NotificationFetchedEvent());
                    },
                  );
                }

                return AppErrorWidget(
                  showBackButton: true,
                  onRefresh: () {
                    context
                        .read<NotificationBloc>()
                        .add(const NotificationFetchedEvent());
                  },
                  message: Translator.of(context)!
                      .translate(error ?? Lang.errorText),
                );
              }
            }

            if (notifications == null || notifications.isEmpty) {
              return AppEmptyListWidget(
                showBackButton: true,
                message:
                    Translator.of(context)!.translate(Lang.noNotificationsText),
                onRefresh: () {
                  context
                      .read<NotificationBloc>()
                      .add(const NotificationFetchedEvent());
                },
              );
            }

            return CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  title: const Text(
                    'Notifications',
                  ),
                  leading: BackButton(
                    onPressed: () => context.maybePop(),
                  ),
                  backgroundColor: ColorsApp.bleachedCedarColor,
                  actions: [
                    if (notifications.isNotEmpty)
                      IconButton(
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: ColorsApp.caribbeanGreenColor,
                        ),
                        onPressed: () {
                          _showDismissDialog(context);
                        },
                      ),
                  ],
                  pinned: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList.builder(
                    itemBuilder: (context, index) {
                      if (index >= notifications.length) {
                        if (state.hasMore) {
                          context
                              .read<NotificationBloc>()
                              .add(const NotificationFetchedEvent(
                                isRefresh: false,
                              ));
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorsApp.caribbeanGreenColor,
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showDismissDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Notice',
            style: TextStyle(
              color: ColorsApp.caribbeanGreenColor,
            ),
          ),
          content: const Text(
              'You are about to delete all alerts from Renterd. Are you sure?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: ColorsApp.caribbeanGreenColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // delete all alerts
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Delete',
                style: TextStyle(
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
