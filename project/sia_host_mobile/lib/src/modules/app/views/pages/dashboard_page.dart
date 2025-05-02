import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('New UI design')),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({
    super.key,
    this.routes = const [
      //
    ],
  });

  final List<PageRouteInfo<void>> routes;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: routes,
      animationCurve: Curves.easeInExpo,
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: (index) {
            if (tabsRouter.activeIndex == index) {
              tabsRouter.navigate(routes[index]);
            } else {
              tabsRouter.setActiveIndex(index);
            }
          },
          destinations: const [
            //
          ],
        );
      },
    );
  }
}
