import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'view_the_file_content_event.dart';
part 'view_the_file_content_state.dart';

@injectable
class ViewTheFileContentBloc
    extends Bloc<ViewTheFileContentEvent, ViewTheFileContentState> {
  ViewTheFileContentBloc() : super(ViewTheFileContentInitial()) {
    on<ViewTheFileContentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
