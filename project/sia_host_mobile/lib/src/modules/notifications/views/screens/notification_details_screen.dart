import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart';

import '../../../../shared/constants/colors_const.dart';

@RoutePage()
class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NotificationBloc, NotificationState>(
        listener: (context, state) {
          if (state.status == NotificationStatus.dismissingFailure) {
            Fluttertoast.showToast(
              msg: 'Failed to dismiss notification',
              backgroundColor: Colors.red,
            );
          }

          if (state.status == NotificationStatus.dismissed) {
            context.router.maybePop();
          }
        },
        builder: (context, state) {
          if (state.status == NotificationStatus.dismissing) {
            return const Padding(
              padding: EdgeInsets.all(8),
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsApp.spearmintColor,
                ),
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: const Text('Notification details'),
                actions: [
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
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Message
                    NotificationDetailRow(
                      label: 'Message',
                      value: notification.message,
                    ),
                    const Divider(),

                    // Date
                    NotificationDetailRow(
                      label: 'Date',
                      value: notification.formattedDate,
                    ),
                    const Divider(),

                    // Source
                    NotificationDetailRow(
                      label: 'Source',
                      value: notification.data?.name ?? '',
                    ),
                    const Divider(),

                    // Description
                    NotificationDetailRow(
                      valueColor: ColorsApp.caribbeanGreenColor,
                      value: notification.data?.hint ?? '',
                    ),
                  ],
                ),
              ),
            ],
          );
        },
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
            'You are about to delete this notification. Are you sure?',
          ),
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
                context.read<NotificationBloc>().add(
                      NotificationDismissedEvent(ids: [notification.id]),
                    );
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
    );
  }
}
