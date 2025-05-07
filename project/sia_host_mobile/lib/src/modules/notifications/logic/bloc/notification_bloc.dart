import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

part 'notification_event.dart';
part 'notification_state.dart';

@LazySingleton()
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc(this._repository) : super(const NotificationState()) {
    on<NotificationFetchedEvent>(_handleFetchedEvent);
    on<NotificationDismissedEvent>(_handleDismissedEvent);
  }

  final NotificationRepository _repository;

  /// Handle the fetched event
  ///
  FutureOr<void> _handleFetchedEvent(
    NotificationFetchedEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final isRefresh = event.isRefresh;
    if (isRefresh) {
      emit(
        state.copyWith(
          status: StateStatus.loading,
          page: 0,
        ),
      );
    } else {
      if (state.status == StateStatus.paginating) return;
      if (!state.hasMore) return;

      emit(state.copyWith(status: StateStatus.paginating));
    }

    try {
      final result = await _repository.findAll(page: state.page);

      var notifications = result.notifications;
      if (!isRefresh) {
        final oldNotifs = state.notifications ?? [];

        notifications = oldNotifs + notifications;
      }

      emit(
        state.copyWith(
          status: StateStatus.success,
          notifications: notifications,
          hasMore: result.hasMore,
          page: state.page + 1,
        ),
      );
    } on DartSiaException catch (e) {
      emit(
        state.copyWith(
          status: StateStatus.failure,
          error: e,
        ),
      );
    }
  }

  /// Handle the dismissed event
  ///
  FutureOr<void> _handleDismissedEvent(
    NotificationDismissedEvent event,
    Emitter<NotificationState> emit,
  ) async {
    if (state.notifications == null) return;
    if (state.notifications!.isEmpty) return;

    emit(state.copyWith(status: StateStatus.dismissing));

    final isAll = event.ids.isEmpty;
    var ids = <String>[];
    if (isAll) {
      ids = state.notifications!
          .map(
            (notification) => notification.id,
          )
          .toList();
    } else {
      ids = event.ids;
    }

    try {
      await _repository.dismissList(ids: ids);

      emit(
        state.copyWith(
          status: StateStatus.dismissed,
          notifications: isAll
              ? []
              : state.notifications
                  ?.where((notification) => !ids.contains(notification.id))
                  .toList(),
        ),
      );
    } on DartSiaException catch (e) {
      emit(
        state.copyWith(
          status: StateStatus.dismissingFailure,
          error: e,
        ),
      );
    }
  }
}
