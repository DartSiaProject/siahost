import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/core/guards/auth_guard.dart';
import 'package:sia_host_mobile/src/core/guards/onboarding_guard.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DashboardRoute.page,
          path: '/',
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: '',
            ),
          ],
          guards: [OnboardingGuard(), AuthGuard()],
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/auth',
          guards: [OnboardingGuard()],
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: '/onboarding',
        ),
      ];
}
