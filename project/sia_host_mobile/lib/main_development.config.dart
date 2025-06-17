// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sia_host_mobile/src/core/routes/app_router.dart' as _i948;
import 'package:sia_host_mobile/src/modules/app/logic/cubit/onboarding_cubit.dart'
    as _i479;
import 'package:sia_host_mobile/src/modules/auth/data/repositories/auth_repository.dart'
    as _i230;
import 'package:sia_host_mobile/src/modules/auth/logic/cubit/auth_cubit.dart'
    as _i873;
import 'package:sia_host_mobile/src/modules/current_host/data/repositories/current_host_repository.dart'
    as _i144;
import 'package:sia_host_mobile/src/modules/current_host/logic/cubit/current_host_cubit.dart'
    as _i443;
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/bucket_repository.dart'
    as _i344;
import 'package:sia_host_mobile/src/modules/file_manager/data/repositories/file_action_repository.dart'
    as _i971;
import 'package:sia_host_mobile/src/modules/file_manager/logic/buckets/bucket_list_cubit.dart'
    as _i886;
import 'package:sia_host_mobile/src/modules/home/data/repositories/network_overview_repository.dart'
    as _i399;
import 'package:sia_host_mobile/src/modules/home/logic/cubit/network_overview_cubit.dart'
    as _i574;
import 'package:sia_host_mobile/src/modules/host_config/data/repositories/host_config_repository.dart'
    as _i425;
import 'package:sia_host_mobile/src/modules/host_list/data/repositories/host_list_repository.dart'
    as _i493;
import 'package:sia_host_mobile/src/modules/host_list/data/repositories/location_repository.dart'
    as _i946;
import 'package:sia_host_mobile/src/modules/host_list/logic/bloc/host_list_bloc.dart'
    as _i478;
import 'package:sia_host_mobile/src/modules/notifications/data/repositories/notification_repository.dart'
    as _i615;
import 'package:sia_host_mobile/src/modules/notifications/logic/bloc/notification_bloc.dart'
    as _i965;
import 'package:sia_host_mobile/src/modules/notifications/notifications.dart'
    as _i553;
import 'package:sia_host_mobile/src/shared/handler/audio_player_handler.dart'
    as _i736;
import 'package:sia_host_mobile/src/shared/services/api_client.dart' as _i824;
import 'package:sia_host_mobile/src/shared/services/file_storage_service.dart'
    as _i515;
import 'package:sia_host_mobile/src/shared/services/storage_service.dart'
    as _i226;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final audioModule = _$AudioModule();
    gh.singleton<_i824.ApiClient>(() => _i824.ApiClient()..init());
    gh.singleton<_i515.FileStorageService>(() => _i515.FileStorageService());
    await gh.singletonAsync<_i226.StorageService>(
      () {
        final i = _i226.StorageService();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    await gh.singletonAsync<_i736.AudioPlayerHandler>(
      () => audioModule.audioHandler,
      preResolve: true,
    );
    gh.lazySingleton<_i948.AppRouter>(() => _i948.AppRouter());
    gh.lazySingleton<_i344.BucketRepository>(
        () => _i344.BucketRepository(gh<_i226.StorageService>()));
    gh.lazySingleton<_i493.HostListRepository>(
        () => _i493.HostListRepository(gh<_i226.StorageService>()));
    gh.lazySingleton<_i479.OnboardingCubit>(
        () => _i479.OnboardingCubit(gh<_i226.StorageService>()));
    gh.lazySingleton<_i144.CurrentHostRepository>(
        () => _i144.CurrentHostRepository(gh<_i226.StorageService>()));
    gh.lazySingleton<_i615.NotificationRepository>(
        () => _i615.NotificationRepository(gh<_i226.StorageService>()));
    gh.lazySingleton<_i399.NetworkOverviewRepository>(
        () => _i399.NetworkOverviewRepository(gh<_i226.StorageService>()));
    gh.factory<_i425.HostConfigRepository>(
        () => _i425.HostConfigRepository(gh<_i226.StorageService>()));
    gh.lazySingleton<_i965.NotificationBloc>(
        () => _i965.NotificationBloc(gh<_i553.NotificationRepository>()));
    gh.lazySingleton<_i886.BucketListCubit>(
        () => _i886.BucketListCubit(gh<_i344.BucketRepository>()));
    gh.lazySingleton<_i574.NetworkOverviewCubit>(() =>
        _i574.NetworkOverviewCubit(gh<_i399.NetworkOverviewRepository>()));
    gh.lazySingleton<_i478.HostListBloc>(
        () => _i478.HostListBloc(gh<_i493.HostListRepository>()));
    gh.lazySingleton<_i971.FileActionRepository>(
        () => _i971.FileActionRepository(
              gh<_i226.StorageService>(),
              gh<_i515.FileStorageService>(),
            ));
    gh.lazySingleton<_i230.AuthRepository>(() => _i230.AuthRepository(
          gh<_i824.ApiClient>(),
          gh<_i226.StorageService>(),
        ));
    gh.lazySingleton<_i946.LocationRepository>(
        () => _i946.LocationRepository(gh<_i824.ApiClient>()));
    gh.lazySingleton<_i443.CurrentHostCubit>(
        () => _i443.CurrentHostCubit(gh<_i144.CurrentHostRepository>()));
    gh.lazySingleton<_i873.AuthCubit>(
        () => _i873.AuthCubit(gh<_i230.AuthRepository>()));
    return this;
  }
}

class _$AudioModule extends _i736.AudioModule {}
