import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../logic/controllers/account_bloc/account_bloc.dart';
import '../../views/screens/login_screens/login_account_screen.dart';
import '../../views/screens/onboarding_screens/onboarding_screen.dart';
import '../../views/screens/sia_screen.dart';
import '../constants/routes_const.dart' as route;

class GoRouters {
  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: route.onboardingScreen,
        builder: (context, state) {
          return BlocBuilder<AccountBloc, AccountState>(
            builder: (context, _accountCredentialState) {
              if (_accountCredentialState is CredentialAreExist) {
                return const SiaScreen();
              }
              return const OnboardingScreen();
            },
          );

          // final _accountCredentialState = context.watch<AccountBloc>().state;
          // return _accountCredentialState is CredentialAreExist
          //     ? const SiaScreen()
          //     : const OnboardingScreen();
        },
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
