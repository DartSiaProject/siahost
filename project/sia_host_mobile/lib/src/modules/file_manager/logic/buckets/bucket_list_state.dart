part of 'bucket_list_cubit.dart';

final class BucketListState extends Equatable {
  const BucketListState({
    this.status = StateStatus.initial,
    this.error,
    this.buckets = const [],
  });

  final StateStatus status;
  final DartSiaException? error;
  final List<BucketModel> buckets;

  BucketListState copyWith({
    StateStatus? status,
    DartSiaException? error,
    List<BucketModel>? buckets,
  }) {
    return BucketListState(
      status: status ?? this.status,
      error: error,
      buckets: buckets ?? this.buckets,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        buckets,
      ];
}
