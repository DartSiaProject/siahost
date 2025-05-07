import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart';

class NotificationResponseModel extends Equatable {
  const NotificationResponseModel({
    required this.notifications,
    required this.hasMore,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      notifications: (json['alerts'] as List? ?? [])
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['hasMore'] as bool? ?? false,
    );
  }
  final List<NotificationModel> notifications;
  final bool hasMore;

  @override
  List<Object?> get props => [notifications, hasMore];
}
