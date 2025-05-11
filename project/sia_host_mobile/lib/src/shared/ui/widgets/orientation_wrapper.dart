import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Wrap any fullscreen page which needs all orientations, then reset.
///
class OrientationWrapper extends StatefulWidget {
  const OrientationWrapper({required this.child, super.key});
  final Widget child;

  @override
  _OrientationWrapperState createState() => _OrientationWrapperState();
}

class _OrientationWrapperState extends State<OrientationWrapper> {
  @override
  void initState() {
    super.initState();
    // allow all orientations
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // restore portrait-only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
