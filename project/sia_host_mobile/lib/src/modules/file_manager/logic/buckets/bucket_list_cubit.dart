import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/bucket_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'bucket_list_state.dart';

@LazySingleton()
class BucketListCubit extends Cubit<BucketListState> {
  BucketListCubit(this._repository) : super(const BucketListState());

  final BucketRepository _repository;

  /// Find all buckets
  ///
  Future<void> findAll() async {
    emit(state.copyWith(status: StateStatus.loading));

    try {
      final buckets = await _repository.findAll();
      emit(
        state.copyWith(
          status: StateStatus.success,
          buckets: buckets,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: StateStatus.failure,
          error: DartSiaException.handleError(e),
        ),
      );
    }
  }

  /// Add a new bucket to the list
  ///
  Future<void> addBucket(BucketModel bucket) async {
    emit(state.copyWith(status: StateStatus.updating));

    final index = state.buckets.indexWhere((b) => b.name == bucket.name);

    if (index != -1) {
      return;
    }

    emit(
      state.copyWith(
        buckets: [...state.buckets, bucket],
      ),
    );
  }
}
