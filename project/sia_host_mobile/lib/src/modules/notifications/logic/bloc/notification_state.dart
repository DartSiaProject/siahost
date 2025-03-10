part of 'notification_bloc.dart';

enum NotificationStatus {
  initial,
  loading,
  success,
  failure,
  paginating,
  paginatingFailure,
  dismissing,
  dismissingFailure,
  dismissed,
}

final class NotificationState extends Equatable {
  const NotificationState({
    this.status = NotificationStatus.initial,
    this.notifications,
    this.error,
    this.hasMore = false,
    this.page = 0,
  });

  final NotificationStatus status;
  final List<NotificationModel>? notifications;
  final String? error;
  final bool hasMore;
  final int page;

  NotificationState copyWith({
    NotificationStatus? status,
    List<NotificationModel>? notifications,
    String? error,
    bool? hasMore,
    int? page,
  }) {
    return NotificationState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      error: error ?? this.error,
      hasMore: hasMore ?? this.hasMore,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        status,
        notifications,
        error,
        hasMore,
        page,
      ];
}
