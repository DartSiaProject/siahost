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

import '../../core/routes/app_router.dart' as _i798;
import '../../modules/app/logic/cubit/onboarding_cubit.dart' as _i725;
import '../../modules/auth/data/repositories/auth_repository.dart' as _i135;
import '../../modules/auth/logic/cubit/auth_cubit.dart' as _i653;
import '../../modules/current_host/data/repositories/current_host_repository.dart'
    as _i987;
import '../../modules/current_host/logic/cubit/current_host_cubit.dart' as _i12;
import '../../modules/home/data/repositories/network_overview_repository.dart'
    as _i251;
import '../../modules/home/logic/cubit/network_overview_cubit.dart' as _i731;
import '../../modules/host_config/data/repositories/host_config_repository.dart'
    as _i362;
import '../../modules/host_list/data/repositories/host_list_repository.dart'
    as _i686;
import '../../modules/host_list/data/repositories/location_repository.dart'
    as _i198;
import '../../modules/host_list/logic/bloc/host_list_bloc.dart' as _i134;
import '../../modules/notifications/data/repositories/notification_repository.dart'
    as _i350;
import '../../modules/notifications/logic/bloc/notification_bloc.dart' as _i955;
import '../../modules/notifications/notifications.dart' as _i859;
import '../services/api_client.dart' as _i933;
import '../services/storage_service.dart' as _i306;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i933.ApiClient>(() => _i933.ApiClient()..init());
    gh.singleton<_i306.StorageService>(() => _i306.StorageService()..init());
    gh.lazySingleton<_i798.AppRouter>(() => _i798.AppRouter());
    gh.lazySingleton<_i725.OnboardingCubit>(
        () => _i725.OnboardingCubit(gh<_i306.StorageService>()));
    gh.lazySingleton<_i251.NetworkOverviewRepository>(
        () => _i251.NetworkOverviewRepository(gh<_i306.StorageService>()));
    gh.lazySingleton<_i686.HostListRepository>(
        () => _i686.HostListRepository(gh<_i306.StorageService>()));
    gh.lazySingleton<_i987.CurrentHostRepository>(
        () => _i987.CurrentHostRepository(gh<_i306.StorageService>()));
    gh.lazySingleton<_i350.NotificationRepository>(
        () => _i350.NotificationRepository(gh<_i306.StorageService>()));
    gh.factory<_i362.HostConfigRepository>(
        () => _i362.HostConfigRepository(gh<_i306.StorageService>()));
    gh.lazySingleton<_i955.NotificationBloc>(
        () => _i955.NotificationBloc(gh<_i859.NotificationRepository>()));
    gh.lazySingleton<_i731.NetworkOverviewCubit>(() =>
        _i731.NetworkOverviewCubit(gh<_i251.NetworkOverviewRepository>()));
    gh.lazySingleton<_i134.HostListBloc>(
        () => _i134.HostListBloc(gh<_i686.HostListRepository>()));
    gh.lazySingleton<_i135.AuthRepository>(() => _i135.AuthRepository(
          gh<_i933.ApiClient>(),
          gh<_i306.StorageService>(),
        ));
    gh.lazySingleton<_i198.LocationRepository>(
        () => _i198.LocationRepository(gh<_i933.ApiClient>()));
    gh.lazySingleton<_i12.CurrentHostCubit>(
        () => _i12.CurrentHostCubit(gh<_i987.CurrentHostRepository>()));
    gh.lazySingleton<_i653.AuthCubit>(
        () => _i653.AuthCubit(gh<_i135.AuthRepository>()));
    return this;
  }
}
