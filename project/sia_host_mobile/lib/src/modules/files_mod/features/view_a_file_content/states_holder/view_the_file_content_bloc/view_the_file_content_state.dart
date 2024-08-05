part of 'view_the_file_content_bloc.dart';

sealed class ViewTheFileContentState extends Equatable {
  const ViewTheFileContentState();

  @override
  List<Object> get props => [];
}

final class ViewTheFileContentInitial extends ViewTheFileContentState {}

class FileLoading extends ViewTheFileContentState {}
