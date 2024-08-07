// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_routes.dart';

abstract class _$AutoRoutes extends RootStackRouter {
  // ignore: unused_element
  _$AutoRoutes({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FilesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilesScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    HostConfigRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HostConfigScreen(),
      );
    },
    HostInfoRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<HostInfoRouteArgs>(
          orElse: () =>
              HostInfoRouteArgs(pubKey: pathParams.getString('hostPubKey')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HostInfoScreen(
          key: args.key,
          pubKey: args.pubKey,
        ),
      );
    },
    HostRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HostScreen(),
      );
    },
    ListOfBucketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListOfBucketScreen(),
      );
    },
    ListOfFileFetchedFromBucketRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ListOfFileFetchedFromBucketRouteArgs>(
          orElse: () => ListOfFileFetchedFromBucketRouteArgs(
              bucketName: pathParams.getString('bucketName')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ListOfFileFetchedFromBucketScreen(
          key: args.key,
          bucketName: args.bucketName,
        ),
      );
    },
    ListOfHostRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListOfHostScreen(),
      );
    },
    LoginAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginAccountScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
      );
    },
    SiaMainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SiaMainScreen(),
      );
    },
  };
}

/// generated route for
/// [FilesScreen]
class FilesRoute extends PageRouteInfo<void> {
  const FilesRoute({List<PageRouteInfo>? children})
      : super(
          FilesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HostConfigScreen]
class HostConfigRoute extends PageRouteInfo<void> {
  const HostConfigRoute({List<PageRouteInfo>? children})
      : super(
          HostConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'HostConfigRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
          args: HostInfoRouteArgs(
            key: key,
            pubKey: pubKey,
          ),
          rawPathParams: {'hostPubKey': pubKey},
          initialChildren: children,
        );

  static const String name = 'HostInfoRoute';

  static const PageInfo<HostInfoRouteArgs> page =
      PageInfo<HostInfoRouteArgs>(name);
}

class HostInfoRouteArgs {
  const HostInfoRouteArgs({
    this.key,
    required this.pubKey,
  });

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
      : super(
          HostRoute.name,
          initialChildren: children,
        );

  static const String name = 'HostRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ListOfBucketScreen]
class ListOfBucketRoute extends PageRouteInfo<void> {
  const ListOfBucketRoute({List<PageRouteInfo>? children})
      : super(
          ListOfBucketRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListOfBucketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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

  static const PageInfo<ListOfFileFetchedFromBucketRouteArgs> page =
      PageInfo<ListOfFileFetchedFromBucketRouteArgs>(name);
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
      : super(
          ListOfHostRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListOfHostRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginAccountScreen]
class LoginAccountRoute extends PageRouteInfo<void> {
  const LoginAccountRoute({List<PageRouteInfo>? children})
      : super(
          LoginAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SiaMainScreen]
class SiaMainRoute extends PageRouteInfo<void> {
  const SiaMainRoute({List<PageRouteInfo>? children})
      : super(
          SiaMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'SiaMainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
