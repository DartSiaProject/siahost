part of 'bucket_object_list_cubit.dart';

final class BucketObjectListState extends Equatable {
  const BucketObjectListState({
    this.status = StateStatus.initial,
    this.error,
    this.objects = const [],
    this.visibleObjects = const [],
    this.prefix,
    this.marker,
    this.sortBy,
    this.sortDir,
    this.substring,
    this.hasMore = false,
  });

  final StateStatus status;
  final DartSiaException? error;
  final List<BucketObjectModel> objects;
  final List<BucketObjectModel> visibleObjects;

  // for filtrering
  final String? prefix;
  final String? marker;
  final String? sortBy;
  final String? sortDir;
  final String? substring;

  // for pagination
  final bool hasMore;

  BucketObjectListState copyWith({
    StateStatus? status,
    DartSiaException? error,
    List<BucketObjectModel>? objects,
    List<BucketObjectModel>? visibleObjects,
    String? prefix,
    String? marker,
    String? sortBy,
    String? sortDir,
    String? substring,
    bool? hasMore,
  }) {
    return BucketObjectListState(
      status: status ?? this.status,
      objects: objects ?? this.objects,
      visibleObjects: visibleObjects ?? this.visibleObjects,
      prefix: prefix ?? this.prefix,
      error: error,
      marker: marker,
      sortBy: sortBy ?? this.sortBy,
      sortDir: sortDir ?? this.sortDir,
      substring: substring ?? this.substring,
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
