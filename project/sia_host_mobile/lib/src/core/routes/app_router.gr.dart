// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i9;
import 'package:sia_host_mobile/src/modules/app/views/pages/dashboard_page.dart'
    as _i1;
import 'package:sia_host_mobile/src/modules/app/views/pages/onboarding_page.dart'
    as _i6;
import 'package:sia_host_mobile/src/modules/auth/views/pages/login_page.dart'
    as _i5;
import 'package:sia_host_mobile/src/modules/home/views/pages/home_page.dart'
    as _i2;
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart'
    as _i8;
import 'package:sia_host_mobile/src/modules/host_list/views/pages/host_details_page.dart'
    as _i3;
import 'package:sia_host_mobile/src/modules/host_list/views/pages/host_list_page.dart'
    as _i4;

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.DashboardPage();
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.HostDetailsPage]
class HostDetailsRoute extends _i7.PageRouteInfo<HostDetailsRouteArgs> {
  HostDetailsRoute({
    required _i8.HostInfoModel host,
    _i9.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         HostDetailsRoute.name,
         args: HostDetailsRouteArgs(host: host, key: key),
         initialChildren: children,
       );

  static const String name = 'HostDetailsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostDetailsRouteArgs>();
      return _i3.HostDetailsPage(host: args.host, key: args.key);
    },
  );
}

class HostDetailsRouteArgs {
  const HostDetailsRouteArgs({required this.host, this.key});

  final _i8.HostInfoModel host;

  final _i9.Key? key;

  @override
  String toString() {
    return 'HostDetailsRouteArgs{host: $host, key: $key}';
  }
}

/// generated route for
/// [_i4.HostListPage]
class HostListRoute extends _i7.PageRouteInfo<void> {
  const HostListRoute({List<_i7.PageRouteInfo>? children})
    : super(HostListRoute.name, initialChildren: children);

  static const String name = 'HostListRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.HostListPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginPage();
    },
  );
}

/// generated route for
/// [_i6.OnboardingPage]
class OnboardingRoute extends _i7.PageRouteInfo<void> {
  const OnboardingRoute({List<_i7.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.OnboardingPage();
    },
  );
}
