// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/cupertino.dart' as _i16;
import 'package:flutter/material.dart' as _i18;
import 'package:sia_host_mobile/src/modules/app/views/pages/dashboard_page.dart'
    as _i3;
import 'package:sia_host_mobile/src/modules/app/views/pages/onboarding_page.dart'
    as _i13;
import 'package:sia_host_mobile/src/modules/auth/views/pages/login_page.dart'
    as _i10;
import 'package:sia_host_mobile/src/modules/current_host/views/pages/current_host_page.dart'
    as _i2;
import 'package:sia_host_mobile/src/modules/file_manager/data/models/models.dart'
    as _i17;
import 'package:sia_host_mobile/src/modules/file_manager/views/pages/bucket_details_page.dart'
    as _i1;
import 'package:sia_host_mobile/src/modules/file_manager/views/pages/file_manager_page.dart'
    as _i4;
import 'package:sia_host_mobile/src/modules/file_manager/views/pages/file_viewer.dart'
    as _i5;
import 'package:sia_host_mobile/src/modules/home/views/pages/home_page.dart'
    as _i6;
import 'package:sia_host_mobile/src/modules/host_config/views/pages/host_config_page.dart'
    as _i7;
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart'
    as _i19;
import 'package:sia_host_mobile/src/modules/host_list/views/pages/host_details_page.dart'
    as _i8;
import 'package:sia_host_mobile/src/modules/host_list/views/pages/host_list_page.dart'
    as _i9;
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart'
    as _i20;
import 'package:sia_host_mobile/src/modules/notifications/views/screens/notification_details_page.dart'
    as _i11;
import 'package:sia_host_mobile/src/modules/notifications/views/screens/notification_list_page.dart'
    as _i12;
import 'package:sia_host_mobile/src/modules/preference/views/pages/preference_page.dart'
    as _i14;

/// generated route for
/// [_i1.BucketDetailsPage]
class BucketDetailsRoute extends _i15.PageRouteInfo<BucketDetailsRouteArgs> {
  BucketDetailsRoute({
    required String bucket,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         BucketDetailsRoute.name,
         args: BucketDetailsRouteArgs(bucket: bucket, key: key),
         rawPathParams: {'bucket': bucket},
         initialChildren: children,
       );

  static const String name = 'BucketDetailsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BucketDetailsRouteArgs>(
        orElse:
            () =>
                BucketDetailsRouteArgs(bucket: pathParams.getString('bucket')),
      );
      return _i1.BucketDetailsPage(bucket: args.bucket, key: args.key);
    },
  );
}

class BucketDetailsRouteArgs {
  const BucketDetailsRouteArgs({required this.bucket, this.key});

  final String bucket;

  final _i16.Key? key;

  @override
  String toString() {
    return 'BucketDetailsRouteArgs{bucket: $bucket, key: $key}';
  }
}

/// generated route for
/// [_i2.CurrentHostPage]
class CurrentHostRoute extends _i15.PageRouteInfo<void> {
  const CurrentHostRoute({List<_i15.PageRouteInfo>? children})
    : super(CurrentHostRoute.name, initialChildren: children);

  static const String name = 'CurrentHostRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i2.CurrentHostPage();
    },
  );
}

/// generated route for
/// [_i3.DashboardPage]
class DashboardRoute extends _i15.PageRouteInfo<void> {
  const DashboardRoute({List<_i15.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardPage();
    },
  );
}

/// generated route for
/// [_i4.FileManagerPage]
class FileManagerRoute extends _i15.PageRouteInfo<void> {
  const FileManagerRoute({List<_i15.PageRouteInfo>? children})
    : super(FileManagerRoute.name, initialChildren: children);

  static const String name = 'FileManagerRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i4.FileManagerPage();
    },
  );
}

/// generated route for
/// [_i5.FileViewerPage]
class FileViewerRoute extends _i15.PageRouteInfo<FileViewerRouteArgs> {
  FileViewerRoute({
    required _i17.BucketObjectModel fileObject,
    _i18.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         FileViewerRoute.name,
         args: FileViewerRouteArgs(fileObject: fileObject, key: key),
         initialChildren: children,
       );

  static const String name = 'FileViewerRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FileViewerRouteArgs>();
      return _i5.FileViewerPage(fileObject: args.fileObject, key: args.key);
    },
  );
}

class FileViewerRouteArgs {
  const FileViewerRouteArgs({required this.fileObject, this.key});

  final _i17.BucketObjectModel fileObject;

  final _i18.Key? key;

  @override
  String toString() {
    return 'FileViewerRouteArgs{fileObject: $fileObject, key: $key}';
  }
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomePage();
    },
  );
}

/// generated route for
/// [_i7.HostConfigPage]
class HostConfigRoute extends _i15.PageRouteInfo<void> {
  const HostConfigRoute({List<_i15.PageRouteInfo>? children})
    : super(HostConfigRoute.name, initialChildren: children);

  static const String name = 'HostConfigRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.HostConfigPage();
    },
  );
}

/// generated route for
/// [_i8.HostDetailsPage]
class HostDetailsRoute extends _i15.PageRouteInfo<HostDetailsRouteArgs> {
  HostDetailsRoute({
    required _i19.HostInfoModel host,
    _i18.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         HostDetailsRoute.name,
         args: HostDetailsRouteArgs(host: host, key: key),
         initialChildren: children,
       );

  static const String name = 'HostDetailsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HostDetailsRouteArgs>();
      return _i8.HostDetailsPage(host: args.host, key: args.key);
    },
  );
}

class HostDetailsRouteArgs {
  const HostDetailsRouteArgs({required this.host, this.key});

  final _i19.HostInfoModel host;

  final _i18.Key? key;

  @override
  String toString() {
    return 'HostDetailsRouteArgs{host: $host, key: $key}';
  }
}

/// generated route for
/// [_i9.HostListPage]
class HostListRoute extends _i15.PageRouteInfo<void> {
  const HostListRoute({List<_i15.PageRouteInfo>? children})
    : super(HostListRoute.name, initialChildren: children);

  static const String name = 'HostListRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i9.HostListPage();
    },
  );
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<void> {
  const LoginRoute({List<_i15.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginPage();
    },
  );
}

/// generated route for
/// [_i11.NotificationDetailsPage]
class NotificationDetailsRoute
    extends _i15.PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    required _i20.NotificationModel notification,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         NotificationDetailsRoute.name,
         args: NotificationDetailsRouteArgs(
           notification: notification,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return _i11.NotificationDetailsPage(
        notification: args.notification,
        key: args.key,
      );
    },
  );
}

class NotificationDetailsRouteArgs {
  const NotificationDetailsRouteArgs({required this.notification, this.key});

  final _i20.NotificationModel notification;

  final _i16.Key? key;

  @override
  String toString() {
    return 'NotificationDetailsRouteArgs{notification: $notification, key: $key}';
  }
}

/// generated route for
/// [_i12.NotificationListPage]
class NotificationListRoute extends _i15.PageRouteInfo<void> {
  const NotificationListRoute({List<_i15.PageRouteInfo>? children})
    : super(NotificationListRoute.name, initialChildren: children);

  static const String name = 'NotificationListRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i12.NotificationListPage();
    },
  );
}

/// generated route for
/// [_i13.OnboardingPage]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i13.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i14.PreferencePage]
class PreferenceRoute extends _i15.PageRouteInfo<void> {
  const PreferenceRoute({List<_i15.PageRouteInfo>? children})
    : super(PreferenceRoute.name, initialChildren: children);

  static const String name = 'PreferenceRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i14.PreferencePage();
    },
  );
}
