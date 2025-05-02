import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:sia_host_mobile/src/core/routes/app_router.gr.dart';
import 'package:sia_host_mobile/src/shared/services/services.dart';
import 'package:sia_host_mobile/src/shared/utils/constants.dart';

class OnboardingGuard extends AutoRouteGuard {
  @override
  FutureOr<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final storage = sl.get<StorageService>();

    if (await storage.getOnboarding()) {
      resolver.next();
    } else {
      await resolver.redirectUntil(const OnboardingRoute(), replace: true);
    }
  }
}
