part of 'fetch_all_bucket_bloc.dart';

sealed class FetchAllBucketState {
  const FetchAllBucketState();
}

final class FetchAllBucketInitial extends FetchAllBucketState {}

class AllBucketFetchedLoading extends FetchAllBucketState {}

class AllBucketFetchedSuccess extends FetchAllBucketState {
  final List<BucketEntity> allBuckets;

  const AllBucketFetchedSuccess({
    required this.allBuckets,
  });
}

class AllBucketFetchedEmpty extends FetchAllBucketState {
  final String message;

  const AllBucketFetchedEmpty({
    required this.message,
  });
}

class AllBucketFetchedFailed extends FetchAllBucketState {
  final String message;

  const AllBucketFetchedFailed({
    required this.message,
  });
}

class MakLoginToSeeTheBucket extends FetchAllBucketState {
  final String message;

  const MakLoginToSeeTheBucket({
    required this.message,
  });
}
