part of 'notification_bloc.dart';

final class NotificationState extends Equatable {
  const NotificationState({
    this.status = StateStatus.initial,
    this.notifications,
    this.error,
    this.hasMore = false,
    this.page = 0,
  });

  final StateStatus status;
  final List<NotificationModel>? notifications;
  final DartSiaException? error;
  final bool hasMore;
  final int page;

  NotificationState copyWith({
    StateStatus? status,
    List<NotificationModel>? notifications,
    DartSiaException? error,
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
