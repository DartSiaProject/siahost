part of 'bucket_cubit.dart';

sealed class BucketState extends Equatable {
  const BucketState();

  @override
  List<Object> get props => [];
}

final class BucketInitial extends BucketState {}

final class BucketLoading extends BucketState {}

final class BucketCreated extends BucketState {
  const BucketCreated(this.bucket);

  final BucketModel bucket;

  @override
  List<Object> get props => [bucket];
}

final class BucketFailure extends BucketState {
  const BucketFailure(this.error);

  final DartSiaException error;

  @override
  List<Object> get props => [error];
}
