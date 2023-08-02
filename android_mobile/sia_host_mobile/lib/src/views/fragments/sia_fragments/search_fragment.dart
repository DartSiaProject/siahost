import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/controllers/search_bloc/search_bloc.dart';
import '../../../utils/constants/colors_const.dart' as color;
import '../../../utils/helpers/back_press_helpers/back_press_helper.dart';
import '../search_sub_fragments/host_infos_sub_fragment.dart';
import '../search_sub_fragments/search_sub_fragment.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  late int _indexFragment;

  @override
  void initState() {
    super.initState();
    _indexFragment = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, searchBuilderState) {
        if (searchBuilderState is NextSubFragmentSelected) {
          _indexFragment = searchBuilderState.nextSubFragmentIndex;
          BackPressHelper.searchBackstack.add(_indexFragment);
          BlocProvider.of<SearchBloc>(context)
              .add(GetOneHostEvent(pubKey: searchBuilderState.hostPubKey));
        }
        if (searchBuilderState is PreviousSubFragmentSelected) {
          _indexFragment = searchBuilderState.previousSubFragmentIndex;
        }

        return IndexedStack(
          index: _indexFragment,
          children: <Widget>[
            const SearchSubFragment(),
            searchBuilderState is HostInfoGot
                ? HostInfoSubFragment(hostModel: searchBuilderState.hostModel)
                : const Center(
                    child:
                        CircularProgressIndicator(color: color.spearmintColor),
                  )
          ],
        );
      },
    );
  }
}
