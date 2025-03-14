import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart';

part 'notification_event.dart';
part 'notification_state.dart';

@Injectable()
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({
    required NotificationRepository repository,
  })  : _repository = repository,
        super(const NotificationState()) {
    on<NotificationFetchedEvent>(_handleFetchedEvent);
    on<NotificationDismissedEvent>(_handleDismissedEvent);
  }

  final NotificationRepository _repository;

  FutureOr<void> _handleFetchedEvent(
    NotificationFetchedEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final isRefresh = event.isRefresh;
    if (isRefresh) {
      emit(state.copyWith(
        status: NotificationStatus.loading,
        page: 0,
        notifications: null,
      ));
    } else {
      if (state.status == NotificationStatus.paginating) return;
      if (!state.hasMore) return;

      emit(state.copyWith(status: NotificationStatus.paginating));
    }

    final result = await _repository.findAll(page: state.page);

    result.when(
      (success) {
        final List<NotificationModel> notifications = isRefresh
            ? success.notifications
            : [...(state.notifications ?? []), ...success.notifications];

        emit(state.copyWith(
          status: NotificationStatus.success,
          notifications: notifications,
          hasMore: success.hasMore,
          page: state.page + 1,
        ));
      },
      (error) {
        emit(state.copyWith(
          status: NotificationStatus.failure,
          error: error,
        ));
      },
    );
  }

  FutureOr<void> _handleDismissedEvent(
    NotificationDismissedEvent event,
    Emitter<NotificationState> emit,
  ) async {
    if (state.notifications == null) return;
    if (state.notifications!.isEmpty) return;

    emit(state.copyWith(status: NotificationStatus.dismissing));

    final isAll = event.ids.isEmpty;
    List<String> ids = [];
    if (isAll) {
      ids =
          state.notifications!.map((notification) => notification.id).toList();
    } else {
      ids = event.ids;
    }

    final result = await _repository.dismissList(ids: ids);

    result.when(
      (success) {
        emit(state.copyWith(
          status: NotificationStatus.dismissed,
          notifications: isAll ? [] : state.notifications
              ?.where((notification) => !ids.contains(notification.id))
              .toList(),
        ));
      },
      (error) {
        emit(state.copyWith(
          status: NotificationStatus.dismissingFailure,
          error: error,
        ));
      },
    );
  }
}
