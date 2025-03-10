part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

final class NotificationFetchedEvent extends NotificationEvent {
  const NotificationFetchedEvent({
    this.isRefresh = true,
  });

  final bool isRefresh;

  @override
  List<Object> get props => [
        isRefresh,
      ];
}

final class NotificationDismissedEvent extends NotificationEvent {
  const NotificationDismissedEvent({required this.ids});

  final List<String> ids;

  @override
  List<Object> get props => [ids];
}
