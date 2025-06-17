import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/bucket_model.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/bucket_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';

part 'bucket_state.dart';

class BucketCubit extends Cubit<BucketState> {
  BucketCubit(this._repository) : super(BucketInitial());

  final BucketRepository _repository;

  /// Create a new bucket
  ///
  Future<void> createBucket(String bucketName) async {
    emit(BucketLoading());
    try {
      final bucket = await _repository.createBucket(bucketName);
      emit(BucketCreated(bucket));
    } catch (e) {
      emit(BucketFailure(DartSiaException.handleError(e)));
    }
  }
}
