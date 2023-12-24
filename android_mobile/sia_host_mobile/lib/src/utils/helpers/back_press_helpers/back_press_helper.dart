import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/controllers/search_bloc/search_bloc.dart';
import '../../../logic/controllers/sia_bloc/sia_bloc.dart';

class BackPressHelper {
  static DateTime? backButtonPressTime;
  static List<int> backstack = [0];
  static List<int> searchBackstack = [0];

  static Future<bool> siaBackFragment(
    BuildContext context,
  ) {
    print("CustomPop is called");
    print("backstackList = $backstack");
    if (backstack.length > 1) {
      backstack.removeAt(backstack.length - 1);
      BlocProvider.of<SiaBloc>(context)
          .add(PreviousPageIndexEvent(index: backstack[backstack.length - 1]));

      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  static Future<bool> searchBackFragment(
    BuildContext context,
  ) {
    print("CustomPop is called");
    print("searchBackstack = $searchBackstack");
    if (searchBackstack.length > 1) {
      searchBackstack.removeAt(searchBackstack.length - 1);
      BlocProvider.of<SearchBloc>(context).add(PreviousSubPageIndexEvent(
          index: searchBackstack[searchBackstack.length - 1]));

      return Future.value(false);
    } else {
      backstack.removeAt(backstack.length - 1);
      BlocProvider.of<SiaBloc>(context)
          .add(PreviousPageIndexEvent(index: backstack[backstack.length - 1]));
      return Future.value(false);
    }
  }
}
