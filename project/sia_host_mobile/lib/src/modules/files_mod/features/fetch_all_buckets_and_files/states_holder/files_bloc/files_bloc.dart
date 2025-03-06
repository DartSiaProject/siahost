import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'files_event.dart';
part 'files_state.dart';

@injectable
class FilesBloc extends Bloc<FilesEvent, FilesState> {
  FilesBloc() : super(FilesInitial()) {
    on<SelectTheBucketIndexEvent>((event, emit) {
      emit(BucketSelected(bucketIndexSelected: event.bucketIndex));
    });
  }
}
