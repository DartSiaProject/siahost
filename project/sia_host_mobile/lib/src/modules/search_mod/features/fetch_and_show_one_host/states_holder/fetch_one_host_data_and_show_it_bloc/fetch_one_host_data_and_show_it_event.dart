part of 'fetch_one_host_data_and_show_it_bloc.dart';

sealed class FetchOneHostDataAndShowItEvent extends Equatable {
  const FetchOneHostDataAndShowItEvent();

  @override
  List<Object> get props => [];
}

class FetchOneHostDataEvent extends FetchOneHostDataAndShowItEvent {
  final String pubKey;

  const FetchOneHostDataEvent({required this.pubKey});
}
