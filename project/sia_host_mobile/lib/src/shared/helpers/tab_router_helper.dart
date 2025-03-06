import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class TabRouterHelper {
  static bool siaBackSubScreen(
    TabsRouter tabsRouter,
    BuildContext context,
  ) {
    if (tabsRouter.activeIndex == 0) {
      return true;
    } else {
      context.router.back();
      return false;
    }
  }
}
