import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardView(),
    );
  }
}

class DashboardView extends StatelessWidget {
  DashboardView({
    super.key,
  });

  final List<PageRouteInfo<void>> routes = [
    const HomeRoute(),
    const HomeRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AutoTabsScaffold(
      routes: routes,
      animationCurve: Curves.easeInExpo,
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.mail_outline_rounded,
                color: AppTheme.primaryColor,
              ),
              onPressed: () {
                //
              },
            ),
          ],
        );
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavyBar(
          backgroundColor: const Color(0xFF1D1F24),
          itemPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          items: [
            BottomNavyBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(CupertinoIcons.home),
              ),
              title: Text(l10n.navHome),
              activeColor: AppTheme.primaryColor,
              inactiveColor: AppTheme.inactiveNavIconColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(CupertinoIcons.home),
              title: Text(l10n.navHome),
              activeColor: AppTheme.primaryColor,
              inactiveColor: AppTheme.inactiveNavIconColor,
            ),
          ],
          onItemSelected: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
