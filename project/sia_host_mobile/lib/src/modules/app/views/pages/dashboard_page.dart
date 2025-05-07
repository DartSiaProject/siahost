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
    const HostListRoute(),
    const CurrentHostRoute(),
    const HostConfigRoute(),
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
                context.router.push(const NotificationListRoute());
              },
            ),
          ],
        );
      },
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavyBar(
          selectedIndex: tabsRouter.activeIndex,
          backgroundColor: const Color(0xFF1D1F24),
          itemPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          items: [
            _buildNavItem(
              CupertinoIcons.home,
              l10n.navHome,
            ),
            _buildNavItem(
              CupertinoIcons.search,
              l10n.navSearch,
            ),
            _buildNavItem(
              CupertinoIcons.chart_pie,
              l10n.navMyHost,
            ),
            _buildNavItem(
              Icons.settings,
              l10n.navConfig,
            ),
          ],
          onItemSelected: tabsRouter.setActiveIndex,
        );
      },
    );
  }

  BottomNavyBarItem _buildNavItem(
    IconData icon,
    String title,
  ) {
    return BottomNavyBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Icon(icon),
      ),
      title: Text(title),
      activeColor: AppTheme.primaryColor,
      inactiveColor: AppTheme.inactiveNavIconColor,
      textAlign: TextAlign.center,
    );
  }
}
