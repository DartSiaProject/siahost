import 'package:flutter/material.dart';

import '../../../utils/constants/colors_const.dart';

class ClockFragment extends StatefulWidget {
  const ClockFragment({super.key});

  @override
  State<ClockFragment> createState() => _ClockFragmentState();
}

class _ClockFragmentState extends State<ClockFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "clock",
        style: TextStyle(color: whiteColor),
      ),
    );
  }
}
