import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../../shared/constants/lang_const.dart';
import '../../domain/entities/bucket_entity.dart';
import '../../domain/usecases/fetch_all_buckets_usecase.dart';

part 'fetch_all_bucket_event.dart';
part 'fetch_all_bucket_state.dart';

@injectable
class FetchAllBucketBloc
    extends Bloc<FetchAllBucketEvent, FetchAllBucketState> {
  final FetchAllBucketsUsecase fetchAllBucketsUsecase;

  FetchAllBucketBloc({required this.fetchAllBucketsUsecase})
      : super(FetchAllBucketInitial()) {
    on<FetchBucketsEvent>((event, emit) async {
      emit(AllBucketFetchedLoading());
      Result<List<BucketEntity>, String> _result =
          await fetchAllBucketsUsecase.call();

      _result.when(
          (success) => emit(AllBucketFetchedSuccess(allBuckets: success)),
          (error) => emit(error == Lang.noBucketText
              ? AllBucketFetchedEmpty(message: error)
              : AllBucketFetchedFailed(message: error)));
    });
  }
}
