import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sia_host_mobile/src/logic/controllers/search_bloc/search_bloc.dart';
import 'package:sia_host_mobile/src/logic/models/host.dart';
import 'package:sia_host_mobile/src/views/fragments/search_sub_fragments/host_infos_sub_fragment.dart';
import 'package:sia_host_mobile/src/views/fragments/search_sub_fragments/search_sub_fragment.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  late int _indexFragment;
  late Host host;

  @override
  void initState() {
    super.initState();
    _indexFragment = 0;
    host = const Host();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, searchBuilderState) {
        if (searchBuilderState is NextSubFragmentSelected) {
          _indexFragment = searchBuilderState.nextSubFragmentIndex;
          host = searchBuilderState.hostModel;
        }
        if (searchBuilderState is PreviousSubFragmentSelected) {
          _indexFragment = searchBuilderState.previousSubFragmentIndex;
        }
        return IndexedStack(
          index: _indexFragment,
          children: <Widget>[
            const SearchSubFragment(),
            HostInfoSubFragment(
              hostModel: host,
            ),
          ],
        );
      },
    );
  }
}
