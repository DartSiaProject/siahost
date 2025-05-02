import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/modules/auth/data/repositories/auth_repository.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  FutureOr<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final authRepository = sl.get<AuthRepository>();

    if (await authRepository.isAuthenticated()) {
      resolver.next();
    } else {
      await resolver.redirectUntil(const LoginRoute(), replace: true);
    }
  }
}
