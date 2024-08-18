import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/entities/file_details_entity.dart';
import '../../domain/usecases/view_the_file_details_usecase.dart';

part 'view_the_file_details_event.dart';
part 'view_the_file_details_state.dart';

@injectable
class ViewTheFileDetailsBloc
    extends Bloc<ViewTheFileDetailsEvent, ViewTheFileDetailsState> {
  final ViewTheFileDetailsUsecase viewTheFileDetailsUsecase;

  ViewTheFileDetailsBloc({
    required this.viewTheFileDetailsUsecase,
  }) : super(ViewTheFileDetailsInitial()) {
    on<UserViewTheFileDetailsEvent>((event, emit) async {
      emit(FileDetailsLoading());
      Result<FileDetailsEntity, String> _result =
          await viewTheFileDetailsUsecase.call(
        bucketName: event.bucketName,
        fileName: event.fileName,
      );

      _result.when(
        (success) => emit(FileDetailsSuccess(
          fileDetailsEntity: success,
        )),
        (error) => emit(FileDetailsFailed(message: error)),
      );
    });
  }
}
