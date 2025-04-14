import 'package:equatable/equatable.dart';

import '../../notifications.dart';

class NotificationResponseModel extends Equatable {
  final List<NotificationModel> notifications;
  final bool hasMore;

  const NotificationResponseModel({
    required this.notifications,
    required this.hasMore,
  });

  @override
  List<Object?> get props => [notifications, hasMore];

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      notifications: (json['alerts'] as List? ?? [])
          .map((e) => NotificationModel.fromJson(e))
          .toList(),
      hasMore: json['hasMore'] ?? false,
    );
  }
}
