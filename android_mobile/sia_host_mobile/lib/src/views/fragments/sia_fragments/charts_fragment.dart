import 'package:flutter/material.dart';

import '../../../utils/constants/colors_const.dart';

class ChartsFragment extends StatefulWidget {
  const ChartsFragment({super.key});

  @override
  State<ChartsFragment> createState() => _ChartsFragmentState();
}

class _ChartsFragmentState extends State<ChartsFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Stats",
        style: TextStyle(color: whiteColor),
      ),
    );
  }
}
