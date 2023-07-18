import 'package:go_router/go_router.dart';

import '../../views/screens/login_screens/login_account_screen.dart';
import '../../views/screens/onboarding_screens/onboarding_screen.dart';
import '../../views/screens/sia_screen.dart';
import '../constants/routes_const.dart' as route;

class GoRouters {
  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        //  redirect: (BuildContext context, GoRouterState state) {
        //   if (fingerIsPresent) {
        //     return route.loginScreen;
        //   } else {
        //     return null;
        //   }
        // },  // todo :  Cette partie est par rapport au fait que le [redirect] permet de rédiriger l'utilisateur vers la page principale ssi  la condition est vrai, mais dans le cas contraire , l'utilsateur se retrouve au début de l'appli ( page d'inscription ou autre)
        path: route.onboardingScreen,
        builder: (context, state) =>
            // const SiaScreen(),

            const OnboardingScreen(),
      ),
      GoRoute(
        path: route.loginAccountScreen,
        builder: (context, state) => const LoginAccountScreen(),
      ),
      GoRoute(
        path: route.siaScreen,
        builder: (context, state) => const SiaScreen(),
      ),
    ],
  );
}
