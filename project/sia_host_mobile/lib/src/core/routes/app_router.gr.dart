// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i11;
import 'package:sia_host_mobile/src/modules/app/views/pages/dashboard_page.dart'
    as _i2;
import 'package:sia_host_mobile/src/modules/app/views/pages/onboarding_page.dart'
    as _i8;
import 'package:sia_host_mobile/src/modules/auth/views/pages/login_page.dart'
    as _i7;
import 'package:sia_host_mobile/src/modules/current_host/views/pages/current_host_page.dart'
    as _i1;
import 'package:sia_host_mobile/src/modules/home/views/pages/home_page.dart'
    as _i3;
import 'package:sia_host_mobile/src/modules/host_config/views/pages/host_config_page.dart'
    as _i4;
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart'
    as _i10;
import 'package:sia_host_mobile/src/modules/host_list/views/pages/host_details_page.dart'
    as _i5;
import 'package:sia_host_mobile/src/modules/host_list/views/pages/host_list_page.dart'
    as _i6;

/// generated route for
/// [_i1.CurrentHostPage]
class CurrentHostRoute extends _i9.PageRouteInfo<void> {
  const CurrentHostRoute({List<_i9.PageRouteInfo>? children})
    : super(CurrentHostRoute.name, initialChildren: children);

  static const String name = 'CurrentHostRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.CurrentHostPage();
    },
  );
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i9.PageRouteInfo<void> {
  const DashboardRoute({List<_i9.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.DashboardPage();
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomePage();
    },
  );
}

/// generated route for
/// [_i4.HostConfigPage]
class HostConfigRoute extends _i9.PageRouteInfo<void> {
  const HostConfigRoute({List<_i9.PageRouteInfo>? children})
    : super(HostConfigRoute.name, initialChildren: children);

  static const String name = 'HostConfigRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.HostConfigPage();
    },
  );
}

/// generated route for
/// [_i5.HostDetailsPage]
class HostDetailsRoute extends _i9.PageRouteInfo<HostDetailsRouteArgs> {
  HostDetailsRoute({
    required _i10.HostInfoModel host,
    _i11.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         HostDetailsRoute.name,
         args: HostDetailsRouteArgs(host: host, key: key),
         initialChildren: children,
       );

  static const String name = 'HostDetailsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostDetailsRouteArgs>();
      return _i5.HostDetailsPage(host: args.host, key: args.key);
    },
  );
}

class HostDetailsRouteArgs {
  const HostDetailsRouteArgs({required this.host, this.key});

  final _i10.HostInfoModel host;

  final _i11.Key? key;

  @override
  String toString() {
    return 'HostDetailsRouteArgs{host: $host, key: $key}';
  }
}

/// generated route for
/// [_i6.HostListPage]
class HostListRoute extends _i9.PageRouteInfo<void> {
  const HostListRoute({List<_i9.PageRouteInfo>? children})
    : super(HostListRoute.name, initialChildren: children);

  static const String name = 'HostListRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.HostListPage();
    },
  );
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage();
    },
  );
}

/// generated route for
/// [_i8.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnboardingPage();
    },
  );
}
