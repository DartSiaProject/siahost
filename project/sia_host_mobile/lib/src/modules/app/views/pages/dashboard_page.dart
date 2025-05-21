import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/core/theme/app_theme.dart';
import 'package:sia_host_mobile/src/shared/ui/widgets/app_loader.dart';

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
    const FileManagerRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AutoTabsScaffold(
      routes: routes,
      animationCurve: Curves.easeInExpo,
      drawer: _buildDrawer(context),
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          actions: [
            IconButton.outlined(
              icon: const Badge(
                backgroundColor: AppTheme.primaryColor,
                child: Icon(
                  Icons.mail_outline_rounded,
                  color: AppTheme.primaryColor,
                ),
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
            _buildNavItem(
              CupertinoIcons.folder,
              l10n.navFiles,
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

  /// build a drawer with those details
  /// - Header containing the logo and the app name
  /// - List of items
  ///   * Preferences
  ///   * DB Backup
  ///   * Cache Management
  ///   * About
  ///
  /// - Footer with the version number
  ///
  Drawer _buildDrawer(BuildContext context) {
    final l10n = context.l10n;
    return Drawer(
      backgroundColor: AppTheme.backgoundColor,
      child: Column(
        children: [
          DrawerHeader(
            // decoration: const BoxDecoration(
            //   color: AppTheme.primaryColor,
            // ),
            child: SizedBox(
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'DartSia',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(l10n.preferences),
            onTap: () {
              context
                ..maybePop()
                ..router.push(const PreferenceRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.backup),
            title: Text(l10n.dbBackup),
            onTap: () {
              // context.router.push(const DBBackupRoute());
            },
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.folder_fill_badge_person_crop),
            title: Text(l10n.cacheManager),
            onTap: () {
              // context.router.push(const CacheManagementRoute());
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(l10n.about),
            onTap: () {
              // context.router.push(const AboutRoute());
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FutureBuilder(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const AppLoader();
                  }

                  if (snapshot.hasData) {
                    final deviceInfo = snapshot.data;
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        'Version ${deviceInfo?.version} +${deviceInfo?.buildNumber}',
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
