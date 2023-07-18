import 'package:flutter/material.dart';

import '../../../utils/constants/colors_const.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({super.key});

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search",
        style: TextStyle(color: whiteColor),
      ),
    );
  }
}
