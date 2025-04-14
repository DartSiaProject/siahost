// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_routes.dart';

/// generated route for
/// [FilePreviewScreen]
class FilePreviewRoute extends PageRouteInfo<FilePreviewRouteArgs> {
  FilePreviewRoute({
    Key? key,
    required FileEntity file,
    List<PageRouteInfo>? children,
  }) : super(
         FilePreviewRoute.name,
         args: FilePreviewRouteArgs(key: key, file: file),
         initialChildren: children,
       );

  static const String name = 'FilePreviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FilePreviewRouteArgs>();
      return FilePreviewScreen(key: args.key, file: args.file);
    },
  );
}

class FilePreviewRouteArgs {
  const FilePreviewRouteArgs({this.key, required this.file});

  final Key? key;

  final FileEntity file;

  @override
  String toString() {
    return 'FilePreviewRouteArgs{key: $key, file: $file}';
  }
}

/// generated route for
/// [FilesScreen]
class FilesRoute extends PageRouteInfo<void> {
  const FilesRoute({List<PageRouteInfo>? children})
    : super(FilesRoute.name, initialChildren: children);

  static const String name = 'FilesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FilesScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [HostConfigScreen]
class HostConfigRoute extends PageRouteInfo<void> {
  const HostConfigRoute({List<PageRouteInfo>? children})
    : super(HostConfigRoute.name, initialChildren: children);

  static const String name = 'HostConfigRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HostConfigScreen();
    },
  );
}

/// generated route for
/// [HostInfoScreen]
class HostInfoRoute extends PageRouteInfo<HostInfoRouteArgs> {
  HostInfoRoute({
    Key? key,
    required String pubKey,
    List<PageRouteInfo>? children,
  }) : super(
         HostInfoRoute.name,
         args: HostInfoRouteArgs(key: key, pubKey: pubKey),
         rawPathParams: {'hostPubKey': pubKey},
         initialChildren: children,
       );

  static const String name = 'HostInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<HostInfoRouteArgs>(
        orElse:
            () => HostInfoRouteArgs(pubKey: pathParams.getString('hostPubKey')),
      );
      return HostInfoScreen(key: args.key, pubKey: args.pubKey);
    },
  );
}

class HostInfoRouteArgs {
  const HostInfoRouteArgs({this.key, required this.pubKey});

  final Key? key;

  final String pubKey;

  @override
  String toString() {
    return 'HostInfoRouteArgs{key: $key, pubKey: $pubKey}';
  }
}

/// generated route for
/// [HostScreen]
class HostRoute extends PageRouteInfo<void> {
  const HostRoute({List<PageRouteInfo>? children})
    : super(HostRoute.name, initialChildren: children);

  static const String name = 'HostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HostScreen();
    },
  );
}

/// generated route for
/// [ListOfBucketScreen]
class ListOfBucketRoute extends PageRouteInfo<void> {
  const ListOfBucketRoute({List<PageRouteInfo>? children})
    : super(ListOfBucketRoute.name, initialChildren: children);

  static const String name = 'ListOfBucketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListOfBucketScreen();
    },
  );
}

/// generated route for
/// [ListOfFileFetchedFromBucketScreen]
class ListOfFileFetchedFromBucketRoute
    extends PageRouteInfo<ListOfFileFetchedFromBucketRouteArgs> {
  ListOfFileFetchedFromBucketRoute({
    Key? key,
    required String bucketName,
    List<PageRouteInfo>? children,
  }) : super(
         ListOfFileFetchedFromBucketRoute.name,
         args: ListOfFileFetchedFromBucketRouteArgs(
           key: key,
           bucketName: bucketName,
         ),
         rawPathParams: {'bucketName': bucketName},
         initialChildren: children,
       );

  static const String name = 'ListOfFileFetchedFromBucketRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ListOfFileFetchedFromBucketRouteArgs>(
        orElse:
            () => ListOfFileFetchedFromBucketRouteArgs(
              bucketName: pathParams.getString('bucketName'),
            ),
      );
      return ListOfFileFetchedFromBucketScreen(
        key: args.key,
        bucketName: args.bucketName,
      );
    },
  );
}

class ListOfFileFetchedFromBucketRouteArgs {
  const ListOfFileFetchedFromBucketRouteArgs({
    this.key,
    required this.bucketName,
  });

  final Key? key;

  final String bucketName;

  @override
  String toString() {
    return 'ListOfFileFetchedFromBucketRouteArgs{key: $key, bucketName: $bucketName}';
  }
}

/// generated route for
/// [ListOfHostScreen]
class ListOfHostRoute extends PageRouteInfo<void> {
  const ListOfHostRoute({List<PageRouteInfo>? children})
    : super(ListOfHostRoute.name, initialChildren: children);

  static const String name = 'ListOfHostRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ListOfHostScreen();
    },
  );
}

/// generated route for
/// [LoginAccountScreen]
class LoginAccountRoute extends PageRouteInfo<void> {
  const LoginAccountRoute({List<PageRouteInfo>? children})
    : super(LoginAccountRoute.name, initialChildren: children);

  static const String name = 'LoginAccountRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginAccountScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [NotificationDetailsScreen]
class NotificationDetailsRoute
    extends PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    Key? key,
    required NotificationModel notification,
    List<PageRouteInfo>? children,
  }) : super(
         NotificationDetailsRoute.name,
         args: NotificationDetailsRouteArgs(
           key: key,
           notification: notification,
         ),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return NotificationDetailsScreen(
        key: args.key,
        notification: args.notification,
      );
    },
  );
}

class NotificationDetailsRouteArgs {
  const NotificationDetailsRouteArgs({this.key, required this.notification});

  final Key? key;

  final NotificationModel notification;

  @override
  String toString() {
    return 'NotificationDetailsRouteArgs{key: $key, notification: $notification}';
  }
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
}

/// generated route for
/// [SiaMainScreen]
class SiaMainRoute extends PageRouteInfo<void> {
  const SiaMainRoute({List<PageRouteInfo>? children})
    : super(SiaMainRoute.name, initialChildren: children);

  static const String name = 'SiaMainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SiaMainScreen();
    },
  );
}
