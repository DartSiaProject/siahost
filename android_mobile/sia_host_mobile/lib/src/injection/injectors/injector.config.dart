// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/account_mod/features/fetch_user_account_present/data/local_source/absts/fech_user_credential_abst.dart'
    as _i29;
import '../../modules/account_mod/features/fetch_user_account_present/data/local_source/impls/fetch_user_credential_impl.dart'
    as _i30;
import '../../modules/account_mod/features/fetch_user_account_present/data/reposit_impls/fetch_user_credential_reposit_impl.dart'
    as _i32;
import '../../modules/account_mod/features/fetch_user_account_present/domain/reposit_absts/fetch_user_credential_reposit_abst.dart'
    as _i31;
import '../../modules/account_mod/features/fetch_user_account_present/domain/usecases/fetch_user_credential_usecase.dart'
    as _i33;
import '../../modules/account_mod/features/fetch_user_account_present/states_holder/fetch_user_credential_bloc/fetch_user_credential_bloc.dart'
    as _i58;
import '../../modules/account_mod/features/user_login/data/local_source/absts/cache_the_user_credential_after_login_abst.dart'
    as _i3;
import '../../modules/account_mod/features/user_login/data/local_source/absts/secure_the_user_credential_abst.dart'
    as _i35;
import '../../modules/account_mod/features/user_login/data/local_source/impls/cache_the_user_credential_after_login_impl.dart'
    as _i4;
import '../../modules/account_mod/features/user_login/data/local_source/impls/secure_the_user_credential_impl.dart'
    as _i36;
import '../../modules/account_mod/features/user_login/data/remote_source/absts/user_make_his_login_abst.dart'
    as _i42;
import '../../modules/account_mod/features/user_login/data/remote_source/impls/user_make_his_login_impl.dart'
    as _i43;
import '../../modules/account_mod/features/user_login/data/reposit_impls/user_make_the_login_reposit_impl.dart'
    as _i45;
import '../../modules/account_mod/features/user_login/domain/reposit_absts/user_make_the_login_reposit_abst.dart'
    as _i44;
import '../../modules/account_mod/features/user_login/domain/usecases/user_make_the_login_usecase.dart'
    as _i46;
import '../../modules/account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart'
    as _i59;
import '../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_active_contract_count_abst.dart'
    as _i5;
import '../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_all_currents_host_present_abst.dart'
    as _i7;
import '../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_active_contract_count_impl.dart'
    as _i6;
import '../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_all_currents_host_present_impl.dart'
    as _i8;
import '../../modules/home_mod/features/fetch_the_network_data/data/reposit_impls/fetch_the_network_data_by_host_reposit_impl.dart'
    as _i24;
import '../../modules/home_mod/features/fetch_the_network_data/domain/reposit_absts/fetch_the_network_data_by_host_reposit_abst.dart'
    as _i23;
import '../../modules/home_mod/features/fetch_the_network_data/domain/usecases/user_fetch_the_network_data_usecase.dart'
    as _i41;
import '../../modules/home_mod/features/fetch_the_network_data/states_holder/network_data_fetching_bloc/network_data_fetching_bloc.dart'
    as _i60;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/absts/fetch_the_user_credential_for_config_abst.dart'
    as _i27;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/impls/fetch_the_user_credential_for_config_impl.dart'
    as _i28;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/absts/fetch_hoster_from_renter_for_config_abst.dart'
    as _i17;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/impls/fetch_hoster_from_renter_for_config_impl.dart'
    as _i18;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/reposit_impls/fetch_the_host_data_from_renter_for_config_reposit_impl.dart'
    as _i56;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/reposit_absts/fetch_the_host_data_from_renter_for_config_reposit_abst.dart'
    as _i55;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/usecases/fetch_the_hoster_for_config_usecase.dart'
    as _i57;
import '../../modules/host_config_mod/features/fetch_the_hoster_for_config/states_holder/fetch_the_hoster_for_config_bloc/fetch_the_hoster_for_config_bloc.dart'
    as _i64;
import '../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/absts/update_the_hoster_with_new_data_abst.dart'
    as _i37;
import '../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/impls/update_the_hoster_with_new_data_impl.dart'
    as _i38;
import '../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/reposit_impls/update_the_hoster_with_new_data_reposit_impl.dart'
    as _i40;
import '../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/reposit_absts/update_the_hoster_with_new_data_reposit_abst.dart'
    as _i39;
import '../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/usecases/reconfig_the_host_usecase.dart'
    as _i61;
import '../../modules/host_config_mod/features/update_the_hoster_with_new_data/states_holder/reconfig_the_host_data_bloc/reconfig_the_host_data_bloc.dart'
    as _i65;
import '../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/absts/fetch_the_user_credential_abst.dart'
    as _i25;
import '../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/impls/fetch_the_user_credential_impl.dart'
    as _i26;
import '../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_consensus_from_renter_abst.dart'
    as _i13;
import '../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_hoster_from_renter_abst.dart'
    as _i15;
import '../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_consensus_from_renter_impl.dart'
    as _i14;
import '../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_hoster_from_renter_impl.dart'
    as _i16;
import '../../modules/my_host_mod/features/fetch_host_from_renter/data/reposit_impls/fetch_my_host_data_from_renter_reposit_impl.dart'
    as _i49;
import '../../modules/my_host_mod/features/fetch_host_from_renter/domain/reposit_absts/fetch_my_host_data_from_renter_reposit_abst.dart'
    as _i48;
import '../../modules/my_host_mod/features/fetch_host_from_renter/domain/usecases/fetch_my_host_from_renter_usecase.dart'
    as _i50;
import '../../modules/my_host_mod/features/fetch_host_from_renter/states_holder/fetch_my_hoster_bloc/fetch_my_hoster_bloc.dart'
    as _i51;
import '../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_all_existant_hosts_abst.dart'
    as _i9;
import '../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_the_host_address_country_abst.dart'
    as _i19;
import '../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_all_existant_hosts_impl.dart'
    as _i10;
import '../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_the_host_address_country_imp.dart'
    as _i20;
import '../../modules/search_mod/features/fetch_and_show_one_host/data/reposit_impls/fetch_one_host_data_reposit_impl.dart'
    as _i53;
import '../../modules/search_mod/features/fetch_and_show_one_host/domain/reposit_absts/fetch_one_host_data_reposit_abst.dart'
    as _i52;
import '../../modules/search_mod/features/fetch_and_show_one_host/domain/usecases/fetch_one_host_info_data_usecase.dart'
    as _i54;
import '../../modules/search_mod/features/fetch_and_show_one_host/states_holder/fetch_one_host_data_and_show_it_bloc/fetch_one_host_data_and_show_it_bloc.dart'
    as _i63;
import '../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/absts/fetch_all_host_data_abst.dart'
    as _i11;
import '../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/impls/fetch_all_hosts_data_impl.dart'
    as _i12;
import '../../modules/search_mod/features/fetch_the_hosts_data/data/reposit_impls/fetch_the_list_for_all_host_data_reposit_impl.dart'
    as _i22;
import '../../modules/search_mod/features/fetch_the_hosts_data/domain/reposit_absts/fetch_the_list_for_all_host_data_reposit_abst.dart'
    as _i21;
import '../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/fetch_all_the_host_usecase.dart'
    as _i47;
import '../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/search_the_host_by_pub_key_usecase.dart'
    as _i34;
import '../../modules/search_mod/features/fetch_the_hosts_data/states_holder/fetch_all_hosts_data_bloc/fetch_all_hosts_data_bloc.dart'
    as _i62;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.CacheTheUserCredentialAfterLoginAbst>(
        () => _i4.CacheTheUserCredentialsAfterLoginImpl());
    gh.lazySingleton<_i5.FetchActiveContractCountAbst>(
        () => _i6.FetchActiveContractCountImpl());
    gh.lazySingleton<_i7.FetchAllCurrentsHostPresentAbst>(
        () => _i8.FetchAllCurrentsHostPresentImpl());
    gh.lazySingleton<_i9.FetchAllExistantHostsAbst>(
        () => _i10.FetchAllExistantHostsImpl());
    gh.lazySingleton<_i11.FetchAllHostDataAbst>(
        () => _i12.FetchAllHostDataImpl());
    gh.lazySingleton<_i13.FetchConsensusFromRenterAbst>(
        () => _i14.FetchConsensusFromRenterImpl());
    gh.lazySingleton<_i15.FetchHosterFromRenterAbst>(
        () => _i16.FetchHosterFromRenterImpl());
    gh.lazySingleton<_i17.FetchHosterFromRenterForConfigAbst>(
        () => _i18.FetchHosterFromRenterForConfigImpl());
    gh.lazySingleton<_i19.FetchTheHostAddressCountryAbst>(
        () => _i20.FetchTheHostAddressCountryImpl());
    gh.lazySingleton<_i21.FetchTheListForAllHostDataRepositAbst>(() =>
        _i22.FetchTheListForAllHostDataRepositImpl(
            fetchAllHostDataAbst: gh<_i11.FetchAllHostDataAbst>()));
    gh.lazySingleton<_i23.FetchTheNetworkDataByHostRepositAbst>(() =>
        _i24.FetchTheNetworkDataByHostRepositImpl(
          fetchActiveContractCountAbst: gh<_i5.FetchActiveContractCountAbst>(),
          fetchAllCurrentsHostPresentAbst:
              gh<_i7.FetchAllCurrentsHostPresentAbst>(),
        ));
    gh.lazySingleton<_i25.FetchTheUserCredentialAbst>(
        () => _i26.FetchTheUserCredentialImpl());
    gh.lazySingleton<_i27.FetchTheUserCredentialForConfigAbst>(
        () => _i28.FetchTheUserCredentialForConfigImpl());
    gh.lazySingleton<_i29.FetchUserCredentialAbst>(
        () => _i30.FetchUserCredentialImpl());
    gh.lazySingleton<_i31.FetchUserCredentialRepositAbst>(() =>
        _i32.FetchUserCredentialRepositImpl(
            fetchUserCredentialAbst: gh<_i29.FetchUserCredentialAbst>()));
    gh.lazySingleton<_i33.FetchUserCredentialUsecase>(() =>
        _i33.FetchUserCredentialUsecase(
            fetchUserCredentialRepositAbst:
                gh<_i31.FetchUserCredentialRepositAbst>()));
    gh.lazySingleton<_i34.SearchTheHostByPubKeyUsecase>(() =>
        _i34.SearchTheHostByPubKeyUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i21.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i35.SecureTheUserCredentialAbst>(
        () => _i36.SecureTheUserCredentialImpl());
    gh.lazySingleton<_i37.UpdateTheHosterWithNewDataAbst>(
        () => _i38.UpdateTheHosterWithNewDataImpl());
    gh.lazySingleton<_i39.UpdateTheHosterWithNewDataRepositAbst>(() =>
        _i40.UpdateTheHosterWithNewDataRepositImpl(
            updateTheHosterWithNewDataAbst:
                gh<_i37.UpdateTheHosterWithNewDataAbst>()));
    gh.lazySingleton<_i41.UserFetchTheNetworkDataUsecase>(() =>
        _i41.UserFetchTheNetworkDataUsecase(
            fetchTheNetworkDataByHostRepositAbst:
                gh<_i23.FetchTheNetworkDataByHostRepositAbst>()));
    gh.lazySingleton<_i42.UserMakeHisLoginAbst>(
        () => _i43.UserMakeHisLoginImpl());
    gh.lazySingleton<_i44.UserMakeTheLoginRepositAbst>(() =>
        _i45.UserMakeTheLoginRepositImpl(
          userMakeHisLoginAbst: gh<_i42.UserMakeHisLoginAbst>(),
          secureTheUserCredentialAbst: gh<_i35.SecureTheUserCredentialAbst>(),
          cacheTheUserCredentialAfterLoginAbst:
              gh<_i3.CacheTheUserCredentialAfterLoginAbst>(),
        ));
    gh.lazySingleton<_i46.UserMakeTheLoginUsecase>(() =>
        _i46.UserMakeTheLoginUsecase(
            userMakeTheLoginRepositAbst:
                gh<_i44.UserMakeTheLoginRepositAbst>()));
    gh.lazySingleton<_i47.FetchAllTheHostUsecase>(() =>
        _i47.FetchAllTheHostUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i21.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i48.FetchMyHostDataFromRenterRepositAbst>(() =>
        _i49.FetchMyHostDataFromRenterRepositImpl(
          fetchTheUserCredentialAbst: gh<_i25.FetchTheUserCredentialAbst>(),
          fetchHosterFromRenterAbst: gh<_i15.FetchHosterFromRenterAbst>(),
          fetchConsensusFromRenterAbst: gh<_i13.FetchConsensusFromRenterAbst>(),
        ));
    gh.lazySingleton<_i50.FetchMyHostFromRenterUsecase>(() =>
        _i50.FetchMyHostFromRenterUsecase(
            fetchMyHostDataFromRenterRepositAbst:
                gh<_i48.FetchMyHostDataFromRenterRepositAbst>()));
    gh.factory<_i51.FetchMyHosterBloc>(() => _i51.FetchMyHosterBloc(
        fetchMyHostFromRenterUsecase: gh<_i50.FetchMyHostFromRenterUsecase>()));
    gh.lazySingleton<_i52.FetchOneHostDataRepositAbst>(
        () => _i53.FetchOneHostDataRepositImpl(
              fetchAllExistantHostsAbst: gh<_i9.FetchAllExistantHostsAbst>(),
              fetchTheHostAddressCountryAbst:
                  gh<_i19.FetchTheHostAddressCountryAbst>(),
            ));
    gh.lazySingleton<_i54.FetchOneHostInfoDataUsecase>(() =>
        _i54.FetchOneHostInfoDataUsecase(
            fetchOneHostDataRepositAbst:
                gh<_i52.FetchOneHostDataRepositAbst>()));
    gh.lazySingleton<_i55.FetchTheHostDataFromRenterForConfigRepositAbst>(
        () => _i56.FetchTheHostDataFromRenterForConfigRepositImpl(
              fetchTheUserCredentialForConfigAbst:
                  gh<_i27.FetchTheUserCredentialForConfigAbst>(),
              fetchHosterFromRenterAbst: gh<_i15.FetchHosterFromRenterAbst>(),
            ));
    gh.lazySingleton<_i57.FetchTheHosterForConfigUsecase>(() =>
        _i57.FetchTheHosterForConfigUsecase(
            fetchTheHostDataFromRenterForConfigRepositAbst:
                gh<_i55.FetchTheHostDataFromRenterForConfigRepositAbst>()));
    gh.factory<_i58.FetchUserCredentialBloc>(() => _i58.FetchUserCredentialBloc(
        fetchUserCredentialUsecase: gh<_i33.FetchUserCredentialUsecase>()));
    gh.factory<_i59.LoginAccountBloc>(() => _i59.LoginAccountBloc(
        userMakeTheLoginUsecase: gh<_i46.UserMakeTheLoginUsecase>()));
    gh.factory<_i60.NetworkDataFetchingBloc>(() => _i60.NetworkDataFetchingBloc(
        userFetchTheNetworkDataUsecase:
            gh<_i41.UserFetchTheNetworkDataUsecase>()));
    gh.lazySingleton<_i61.ReconfigTheHostUsecase>(() =>
        _i61.ReconfigTheHostUsecase(
            updateTheHosterWithNewDataRepositAbst:
                gh<_i39.UpdateTheHosterWithNewDataRepositAbst>()));
    gh.factory<_i62.FetchAllHostsDataBloc>(() => _i62.FetchAllHostsDataBloc(
          searchTheHostByPubKeyUsecase: gh<_i34.SearchTheHostByPubKeyUsecase>(),
          fetchAllTheHostUsecase: gh<_i47.FetchAllTheHostUsecase>(),
        ));
    gh.factory<_i63.FetchOneHostDataAndShowItBloc>(() =>
        _i63.FetchOneHostDataAndShowItBloc(
            fetchOneHostInfoDataUsecase:
                gh<_i54.FetchOneHostInfoDataUsecase>()));
    gh.factory<_i64.FetchTheHosterForConfigBloc>(() =>
        _i64.FetchTheHosterForConfigBloc(
            fetchTheHosterForConfigUsecase:
                gh<_i57.FetchTheHosterForConfigUsecase>()));
    gh.factory<_i65.ReconfigTheHostDataBloc>(() => _i65.ReconfigTheHostDataBloc(
        reconfigTheHostUsecase: gh<_i61.ReconfigTheHostUsecase>()));
    return this;
  }
}
