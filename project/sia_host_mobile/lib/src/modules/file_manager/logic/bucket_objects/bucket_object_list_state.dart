part of 'bucket_object_list_cubit.dart';

final class BucketObjectListState extends Equatable {
  const BucketObjectListState({
    this.status = StateStatus.initial,
    this.error,
    this.objects = const [],
    this.visibleObjects = const [],
    this.prefix,
    this.hasMore = false,
  });

  final StateStatus status;
  final DartSiaException? error;
  final List<BucketObjectModel> objects;
  final List<BucketObjectModel> visibleObjects;

  // for filtrering
  final String? prefix;

  // for pagination
  final bool hasMore;

  BucketObjectListState copyWith({
    StateStatus? status,
    DartSiaException? error,
    List<BucketObjectModel>? objects,
    List<BucketObjectModel>? visibleObjects,
    String? prefix,
    bool? hasMore,
  }) {
    return BucketObjectListState(
      status: status ?? this.status,
      objects: objects ?? this.objects,
      visibleObjects: visibleObjects ?? this.visibleObjects,
      prefix: prefix ?? this.prefix,
      error: error,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        objects,
      ];
}
