import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart';
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/bucket_repository.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/helpers/bucket_object_helper.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

part 'bucket_object_list_state.dart';

class BucketObjectListCubit extends Cubit<BucketObjectListState> {
  BucketObjectListCubit(
    this._bucketName, {
    BucketRepository? repository,
  })  : _repository = repository ?? sl.get(),
        super(const BucketObjectListState());

  final String _bucketName;
  final BucketRepository _repository;

  /// Find all objects in the bucket
  ///
  Future<void> findAll({bool reset = false}) async {
    if (_isInWork(state.status)) return;

    emit(state.copyWith(status: StateStatus.loading, marker: state.marker));

    const limit = 50;
    try {
      final objects = await _repository.findAllObjects(
        _bucketName,
        prefix: state.prefix,
        marker: reset ? null : state.marker,
        sortBy: state.sortBy,
        sortDir: state.sortDir,
        substring: state.substring,
      );

      final allObjects = reset ? objects : [...state.objects, ...objects];
      final hasMore = objects.length == limit;
      final marker = hasMore && objects.isNotEmpty ? objects.last.key : null;
      final visibleObjects =
          BucketObjectHelper.getObjectsAtPrefix(objects, state.prefix);

      emit(
        state.copyWith(
          objects: allObjects,
          visibleObjects: visibleObjects,
          hasMore: hasMore,
          marker: marker,
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

  /// Navigate by breadcrumb to a specific part
  ///
  void navigateTo(String? prefix) {
    emit(
      state.copyWith(
        prefix: prefix,
        objects: [],
        visibleObjects: [],
        hasMore: true,
      ),
    );
    findAll(reset: true);
  }

  /// On sorting file
  ///
  void sort(String sortBy, String sortDir) {
    emit(
      state.copyWith(
        sortBy: sortBy,
        sortDir: sortDir,
        objects: [],
        visibleObjects: [],
        hasMore: true,
      ),
    );
    findAll(reset: true);
  }

  /// On searching file
  ///
  void search(String substring) {
    emit(
      state.copyWith(
        substring: substring,
        objects: [],
        visibleObjects: [],
        hasMore: true,
      ),
    );
    findAll(reset: true);
  }

  /// Load more objects while scrolling for pagination purpose
  ///
  void loadMore() {
    if (state.hasMore && !_isInWork(state.status)) {
      findAll();
    }
  }

  /// Check if an action is already in process
  ///
  bool _isInWork(StateStatus status) {
    return status == StateStatus.loading ||
        status == StateStatus.paginating ||
        status == StateStatus.filtrering ||
        status == StateStatus.sorting;
  }
}
