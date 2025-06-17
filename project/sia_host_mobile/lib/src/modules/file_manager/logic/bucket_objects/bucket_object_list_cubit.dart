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
  })  : _repository = repository ?? di.get(),
        super(const BucketObjectListState());

  final String _bucketName;
  final BucketRepository _repository;

  /// Find all objects in the bucket
  ///
  Future<void> findAll({bool reset = false}) async {
    if (reset) {
      emit(
        state.copyWith(
          status: StateStatus.loading,
        ),
      );
    }

    const limit = 100;
    try {
      final marker = reset
          ? null
          : (state.hasMore && state.objects.isNotEmpty)
              ? state.objects.last.key
              : null;

      final objects = await _repository.findAllObjects(
        _bucketName,
        prefix: state.prefix,
        limit: limit,
        marker: marker,
      );

      final allObjects = reset ? objects : [...state.objects, ...objects];
      final hasMore = objects.length == limit;
      final visibleObjects =
          BucketObjectHelper.getObjectsAtPrefix(objects, state.prefix);

      emit(
        state.copyWith(
          status: StateStatus.success,
          objects: allObjects,
          visibleObjects: visibleObjects,
          hasMore: hasMore,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: _failureStatus(state.status),
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
        hasMore: false,
      ),
    );
    findAll(reset: true);
  }

  /// Load more objects while scrolling for pagination purpose
  ///
  void loadMore() {
    if (state.hasMore) {
      findAll();
    }
  }

  /// Check if an action is already in process
  ///
  StateStatus _failureStatus(StateStatus status) {
    return status == StateStatus.searching
        ? StateStatus.searchingFailure
        : status == StateStatus.paginating
            ? StateStatus.paginatingFailure
            : status == StateStatus.sorting
                ? StateStatus.sortingFailure
                : StateStatus.failure;
  }

  /// Update file object by filtring the list with the key
  ///
  void updateFileObject(BucketObjectModel newFileObject, String objectKey) {
    emit(state.copyWith(status: StateStatus.updating));

    final index =
        state.objects.indexWhere((element) => element.key == objectKey);
    final indexInVisible =
        state.visibleObjects.indexWhere((element) => element.key == objectKey);

    final objects = state.objects;
    final visibleObjects = state.visibleObjects;
    if (index != -1) {
      objects[index] = newFileObject;
    }
    if (indexInVisible != -1) {
      visibleObjects[indexInVisible] = newFileObject;
    }

    emit(
      state.copyWith(
        status: StateStatus.success,
        objects: objects,
        visibleObjects: visibleObjects,
      ),
    );
  }

  /// Delete file object by filtering the list with the key
  ///
  void deleteFileObject(String objectKey) {
    emit(state.copyWith(status: StateStatus.updating));

    final index =
        state.objects.indexWhere((element) => element.key == objectKey);
    final indexInVisible =
        state.visibleObjects.indexWhere((element) => element.key == objectKey);

    final objects = state.objects;
    final visibleObjects = state.visibleObjects;
    if (index != -1) {
      objects.removeAt(index);
    }
    if (indexInVisible != -1) {
      visibleObjects.removeAt(indexInVisible);
    }

    emit(
      state.copyWith(
        status: StateStatus.success,
        objects: objects,
        visibleObjects: visibleObjects,
      ),
    );
  }
}
