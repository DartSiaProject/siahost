import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/router/auto_routes.dart';
import 'package:sia_host_mobile/src/modules/notifications/data/models/notification_model.dart';

import '../../../../shared/constants/colors_const.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsApp.tunaColor,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0.0,
          title: Column(
            spacing: 0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notification.formattedDate,
                style: const TextStyle(
                  color: ColorsApp.greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                notification.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: ColorsApp.whiteColor,
                ),
              ),
            ],
          ),
          subtitle: Text(
            notification.data?.hint ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(color: ColorsApp.caribbeanGreenColor),
          ),
          trailing: IconButton(
            color: ColorsApp.caribbeanGreenColor,
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
