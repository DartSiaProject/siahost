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
        // Main pages
        AutoRoute(
          page: DashboardRoute.page,
          path: '/',
          initial: true,
          children: [
            // home
            AutoRoute(
              page: HomeRoute.page,
              path: '',
            ),

            // hosts list
            AutoRoute(
              page: const EmptyShellRoute('host_list'),
              path: 'hosts',
              children: [
                AutoRoute(
                  page: HostListRoute.page,
                  path: '',
                ),
                AutoRoute(
                  page: HostDetailsRoute.page,
                ),
              ],
            ),

            // my_host | current_host
            AutoRoute(
              page: CurrentHostRoute.page,
              path: 'current',
            ),

            // current_host_config
            AutoRoute(
              page: HostConfigRoute.page,
              path: 'config',
            ),

            // file and bucket manager
            AutoRoute(
              page: const EmptyShellRoute('files'),
              path: 'files',
              children: [
                AutoRoute(page: FileManagerRoute.page, path: ''),
                AutoRoute(
                  page: BucketDetailsRoute.page,
                  path: 'details/:bucket',
                ),
              ],
            ),
          ],
          guards: [OnboardingGuard(), AuthGuard()],
        ),

        // Notifications
        AutoRoute(
          page: const EmptyShellRoute(''),
          path: '/notifications',
          children: [
            AutoRoute(
              page: NotificationListRoute.page,
              path: '',
            ),
            AutoRoute(
              page: NotificationDetailsRoute.page,
              path: 'details',
            ),
          ],
          guards: [OnboardingGuard(), AuthGuard()],
        ),

        // Login
        AutoRoute(
          page: LoginRoute.page,
          path: '/auth',
          guards: [OnboardingGuard()],
        ),

        // Onboarding
        AutoRoute(
          page: OnboardingRoute.page,
          path: '/onboarding',
        ),

        // file viewer
        AutoRoute(
          page: FileViewerRoute.page,
          path: '/viewer',
          guards: [OnboardingGuard(), AuthGuard()],
        ),

        // settings
        AutoRoute(
          page: const EmptyShellRoute('settings'),
          path: '/settings',
          children: [
            AutoRoute(page: PreferenceRoute.page, path: ''),
            // AutoRoute(page: PreferenceRoute.page, path: 'backups'),
          ],
          guards: [OnboardingGuard(), AuthGuard()],
        ),
      ];
}
