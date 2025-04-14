part of 'fetch_all_bucket_bloc.dart';

sealed class FetchAllBucketEvent extends Equatable {
  const FetchAllBucketEvent();

  @override
  List<Object> get props => [];
}

class FetchBucketsEvent extends FetchAllBucketEvent {}
