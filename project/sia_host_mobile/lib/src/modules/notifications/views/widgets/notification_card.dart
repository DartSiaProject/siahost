import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/modules/notifications/data/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, super.key});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.formattedDate,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                notification.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          subtitle: Text(
            notification.data?.hint ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(color: AppTheme.primaryColor),
          ),
          trailing: IconButton(
            color: AppTheme.primaryColor,
            onPressed: () {
              context.router.push(
                NotificationDetailsRoute(
                  notification: notification,
                ),
              );
            },
            icon: const Icon(Icons.visibility_outlined),
          ),
        ),
      ),
    );
  }
}
