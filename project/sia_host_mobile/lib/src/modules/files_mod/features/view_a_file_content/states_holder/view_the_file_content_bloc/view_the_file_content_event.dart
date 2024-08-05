part of 'view_the_file_content_bloc.dart';

sealed class ViewTheFileContentEvent extends Equatable {
  const ViewTheFileContentEvent();

  @override
  List<Object> get props => [];
}

class UserViewTheFileContentEvent extends ViewTheFileContentEvent {}
