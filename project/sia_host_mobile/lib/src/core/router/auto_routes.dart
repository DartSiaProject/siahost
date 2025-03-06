import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sia_host_mobile/src/modules/files_mod/features/fetch_all_buckets_and_files/domain/entities/file_entity.dart';
import 'package:sia_host_mobile/src/modules/files_mod/ui/screens/file_preview_screen.dart';

import '../../modules/account_mod/ui/screens/login_account_screen.dart';
import '../../modules/account_mod/ui/screens/main_screen.dart';
import '../../modules/files_mod/ui/screens/files_screen.dart';
import '../../modules/files_mod/ui/screens/list_of_bucket_screen.dart';
import '../../modules/files_mod/ui/screens/list_of_file_fetched_from_bucket_screen.dart';
import '../../modules/home_mod/ui/screens/home_screen.dart';
import '../../modules/host_config_mod/ui/screens/host_config_screen.dart';
import '../../modules/my_host_mod/ui/screens/host_screen.dart';
import '../../modules/search_mod/ui/screens/search_screen.dart';
import '../../modules/search_mod/ui/sub_screens/host_infos_sub_screen.dart';
import '../../modules/search_mod/ui/sub_screens/list_of_host_sub_screen.dart';
import '../../shared/constants/routes_const.dart';
import '../../shared/ui/screens/onboarding_screen.dart';
import '../../shared/ui/screens/sia_main_screen.dart';

part "auto_routes.gr.dart";

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AutoRoutes extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RoutePath.mainPath,
          page: MainRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: RoutePath.onboardingPath,
          page: OnboardingRoute.page,
        ),
        AutoRoute(
          path: RoutePath.loginAccountPath,
          page: LoginAccountRoute.page,
        ),
        AutoRoute(
            path: RoutePath.siaMainPath,
            page: SiaMainRoute.page,
            children: <AutoRoute>[
              AutoRoute(
                page: HomeRoute.page,
                initial: true,
              ),
              AutoRoute(
                page: SearchRoute.page,
                children: <AutoRoute>[
                  AutoRoute(
                    page: ListOfHostRoute.page,
                    initial: true,
                  ),
                  AutoRoute(
                    path: "${RoutePath.hostInfoSubPath}/:hostPubKey",
                    page: HostInfoRoute.page,
                  ),
                ],
              ),
              AutoRoute(
                page: HostRoute.page,
              ),
              AutoRoute(
                page: HostConfigRoute.page,
              ),
              AutoRoute(
                page: FilesRoute.page,
                children: <AutoRoute>[
                  AutoRoute(
                    page: ListOfBucketRoute.page,
                    initial: true,
                  ),
                  AutoRoute(
                    path:
                        "${RoutePath.listOfFileFetchedFromBucketSubPath}/:bucketName",
                    page: ListOfFileFetchedFromBucketRoute.page,
                  ),
                  AutoRoute(
                    path: RoutePath.filePreviewPath,
                    page: FilePreviewRoute.page,
                  ),
                  // AutoRoute(
                  //   path: "${RoutePath.previewTheFileContentSubPath}/:fileName",
                  //   page: PreviewTheFileContentRoute.page,
                  // ),
                ],
              ),
            ]),
      ];
}
