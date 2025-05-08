import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_snackbar.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@RoutePage()
class NotificationDetailsPage extends StatelessWidget {
  const NotificationDetailsPage({
    required this.notification,
    super.key,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NotificationBloc, NotificationState>(
        listener: (context, state) {
          if (state.status == StateStatus.dismissingFailure) {
            AppSnackBar.error(
              message: context.l10n.failedDismissAlert,
            );
            return;
          }

          if (state.status == StateStatus.dismissed) {
            context.router.maybePop();
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar.medium(
              title: Text(context.l10n.notifDetail),
              actions: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.delete,
                    color: AppTheme.primaryColor,
                  ),
                  onPressed: () {
                    _showDismissDialog(context);
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: NotificationDetailsView(notification: notification),
            ),
          ],
        ),
      ),
    );
  }

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
            l10n.deleteNotifText,
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
                context.read<NotificationBloc>().add(
                      NotificationDismissedEvent(ids: [notification.id]),
                    );
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
    );
  }
}

class NotificationDetailsView extends StatelessWidget {
  const NotificationDetailsView({
    required this.notification,
    super.key,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state.status == StateStatus.dismissing) {
          return const AppLoader();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Message
            NotificationDetailRow(
              label: context.l10n.message,
              value: notification.message,
            ),
            const Divider(),

            // Date
            NotificationDetailRow(
              label: context.l10n.date,
              value: notification.formattedDate,
            ),
            const Divider(),

            // Source
            NotificationDetailRow(
              label: context.l10n.source,
              value: notification.data?.name ?? '',
            ),
            const Divider(),

            // Description
            NotificationDetailRow(
              valueColor: AppTheme.primaryColor,
              value: notification.data?.hint ?? '',
            ),
          ],
        );
      },
    );
  }
}
