part of 'view_the_file_details_bloc.dart';

sealed class ViewTheFileDetailsState {
  const ViewTheFileDetailsState();
}

final class ViewTheFileDetailsInitial extends ViewTheFileDetailsState {}

class FileDetailsLoading extends ViewTheFileDetailsState {}

class FileDetailsSuccess extends ViewTheFileDetailsState {
  final FileDetailsEntity fileDetailsEntity;

  FileDetailsSuccess({
    required this.fileDetailsEntity,
  });
}

class FileDetailsFailed extends ViewTheFileDetailsState {
  final String message;

  const FileDetailsFailed({
    required this.message,
  });
}
