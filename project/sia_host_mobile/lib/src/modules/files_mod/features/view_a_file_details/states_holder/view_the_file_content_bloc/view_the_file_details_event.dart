part of 'view_the_file_details_bloc.dart';

sealed class ViewTheFileDetailsEvent extends Equatable {
  const ViewTheFileDetailsEvent();

  @override
  List<Object> get props => [];
}

class UserViewTheFileDetailsEvent extends ViewTheFileDetailsEvent {
  final String fileName;
  final String bucketName;

  const UserViewTheFileDetailsEvent({
    required this.fileName,
    required this.bucketName,
  });
}
