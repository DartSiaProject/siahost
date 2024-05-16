// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../modules/account_mod/features/fetch_user_account_present/data/local_source/absts/fech_user_credential_abst.dart'
    as _i33;
import '../../../modules/account_mod/features/fetch_user_account_present/data/local_source/impls/fetch_user_credential_impl.dart'
    as _i34;
import '../../../modules/account_mod/features/fetch_user_account_present/data/reposit_impls/fetch_user_credential_reposit_impl.dart'
    as _i36;
import '../../../modules/account_mod/features/fetch_user_account_present/domain/reposit_absts/fetch_user_credential_reposit_abst.dart'
    as _i35;
import '../../../modules/account_mod/features/fetch_user_account_present/domain/usecases/fetch_user_credential_usecase.dart'
    as _i39;
import '../../../modules/account_mod/features/fetch_user_account_present/states_holder/fetch_user_credential_bloc/fetch_user_credential_bloc.dart'
    as _i54;
import '../../../modules/account_mod/features/user_login/data/local_source/absts/cache_the_user_credential_after_login_abst.dart'
    as _i23;
import '../../../modules/account_mod/features/user_login/data/local_source/absts/secure_the_user_credential_abst.dart'
    as _i21;
import '../../../modules/account_mod/features/user_login/data/local_source/impls/cache_the_user_credential_after_login_impl.dart'
    as _i24;
import '../../../modules/account_mod/features/user_login/data/local_source/impls/secure_the_user_credential_impl.dart'
    as _i22;
import '../../../modules/account_mod/features/user_login/data/remote_source/absts/user_make_his_login_abst.dart'
    as _i27;
import '../../../modules/account_mod/features/user_login/data/remote_source/impls/user_make_his_login_impl.dart'
    as _i28;
import '../../../modules/account_mod/features/user_login/data/reposit_impls/user_make_the_login_reposit_impl.dart'
    as _i52;
import '../../../modules/account_mod/features/user_login/domain/reposit_absts/user_make_the_login_reposit_abst.dart'
    as _i51;
import '../../../modules/account_mod/features/user_login/domain/usecases/user_make_the_login_usecase.dart'
    as _i59;
import '../../../modules/account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart'
    as _i65;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_active_contract_count_abst.dart'
    as _i29;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_all_currents_host_present_abst.dart'
    as _i19;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_active_contract_count_impl.dart'
    as _i30;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_all_currents_host_present_impl.dart'
    as _i20;
import '../../../modules/home_mod/features/fetch_the_network_data/data/reposit_impls/fetch_the_network_data_by_host_reposit_impl.dart'
    as _i48;
import '../../../modules/home_mod/features/fetch_the_network_data/domain/reposit_absts/fetch_the_network_data_by_host_reposit_abst.dart'
    as _i47;
import '../../../modules/home_mod/features/fetch_the_network_data/domain/usecases/user_fetch_the_network_data_usecase.dart'
    as _i58;
import '../../../modules/home_mod/features/fetch_the_network_data/states_holder/network_data_fetching_bloc/network_data_fetching_bloc.dart'
    as _i62;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/absts/fetch_the_user_credential_for_config_abst.dart'
    as _i13;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/impls/fetch_the_user_credential_for_config_impl.dart'
    as _i14;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/absts/fetch_hoster_from_renter_for_config_abst.dart'
    as _i7;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/impls/fetch_hoster_from_renter_for_config_impl.dart'
    as _i8;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/reposit_impls/fetch_the_host_data_from_renter_for_config_reposit_impl.dart'
    as _i32;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/reposit_absts/fetch_the_host_data_from_renter_for_config_reposit_abst.dart'
    as _i31;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/usecases/fetch_the_hoster_for_config_usecase.dart'
    as _i43;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/states_holder/fetch_the_hoster_for_config_bloc/fetch_the_hoster_for_config_bloc.dart'
    as _i44;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/absts/update_the_hoster_with_new_data_abst.dart'
    as _i17;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/impls/update_the_hoster_with_new_data_impl.dart'
    as _i18;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/reposit_impls/update_the_hoster_with_new_data_reposit_impl.dart'
    as _i50;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/reposit_absts/update_the_hoster_with_new_data_reposit_abst.dart'
    as _i49;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/usecases/reconfig_the_host_usecase.dart'
    as _i61;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/states_holder/reconfig_the_host_data_bloc/reconfig_the_host_data_bloc.dart'
    as _i63;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/absts/fetch_the_user_credential_abst.dart'
    as _i25;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/impls/fetch_the_user_credential_impl.dart'
    as _i26;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_consensus_from_renter_abst.dart'
    as _i11;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_hoster_from_renter_abst.dart'
    as _i9;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_consensus_from_renter_impl.dart'
    as _i12;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_hoster_from_renter_impl.dart'
    as _i10;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/reposit_impls/fetch_my_host_data_from_renter_reposit_impl.dart'
    as _i38;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/domain/reposit_absts/fetch_my_host_data_from_renter_reposit_abst.dart'
    as _i37;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/domain/usecases/fetch_my_host_from_renter_usecase.dart'
    as _i57;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/states_holder/fetch_my_hoster_bloc/fetch_my_hoster_bloc.dart'
    as _i60;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_all_existant_hosts_abst.dart'
    as _i5;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_the_host_address_country_abst.dart'
    as _i3;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_all_existant_hosts_impl.dart'
    as _i6;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_the_host_address_country_imp.dart'
    as _i4;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/reposit_impls/fetch_one_host_data_reposit_impl.dart'
    as _i41;
import '../../../modules/search_mod/features/fetch_and_show_one_host/domain/reposit_absts/fetch_one_host_data_reposit_abst.dart'
    as _i40;
import '../../../modules/search_mod/features/fetch_and_show_one_host/domain/usecases/fetch_one_host_info_data_usecase.dart'
    as _i42;
import '../../../modules/search_mod/features/fetch_and_show_one_host/states_holder/fetch_one_host_data_and_show_it_bloc/fetch_one_host_data_and_show_it_bloc.dart'
    as _i53;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/absts/fetch_all_host_data_abst.dart'
    as _i15;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/impls/fetch_all_hosts_data_impl.dart'
    as _i16;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/reposit_impls/fetch_the_list_for_all_host_data_reposit_impl.dart'
    as _i46;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/reposit_absts/fetch_the_list_for_all_host_data_reposit_abst.dart'
    as _i45;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/fetch_all_the_host_usecase.dart'
    as _i55;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/search_the_host_by_pub_key_usecase.dart'
    as _i56;
import '../../../modules/search_mod/features/fetch_the_hosts_data/states_holder/fetch_all_hosts_data_bloc/fetch_all_hosts_data_bloc.dart'
    as _i64;

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
    gh.lazySingleton<_i3.FetchTheHostAddressCountryAbst>(
        () => _i4.FetchTheHostAddressCountryImpl());
    gh.lazySingleton<_i5.FetchAllExistantHostsAbst>(
        () => _i6.FetchAllExistantHostsImpl());
    gh.lazySingleton<_i7.FetchHosterFromRenterForConfigAbst>(
        () => _i8.FetchHosterFromRenterForConfigImpl());
    gh.lazySingleton<_i9.FetchHosterFromRenterAbst>(
        () => _i10.FetchHosterFromRenterImpl());
    gh.lazySingleton<_i11.FetchConsensusFromRenterAbst>(
        () => _i12.FetchConsensusFromRenterImpl());
    gh.lazySingleton<_i13.FetchTheUserCredentialForConfigAbst>(
        () => _i14.FetchTheUserCredentialForConfigImpl());
    gh.lazySingleton<_i15.FetchAllHostDataAbst>(
        () => _i16.FetchAllHostDataImpl());
    gh.lazySingleton<_i17.UpdateTheHosterWithNewDataAbst>(
        () => _i18.UpdateTheHosterWithNewDataImpl());
    gh.lazySingleton<_i19.FetchAllCurrentsHostPresentAbst>(
        () => _i20.FetchAllCurrentsHostPresentImpl());
    gh.lazySingleton<_i21.SecureTheUserCredentialAbst>(
        () => _i22.SecureTheUserCredentialImpl());
    gh.lazySingleton<_i23.CacheTheUserCredentialAfterLoginAbst>(
        () => _i24.CacheTheUserCredentialsAfterLoginImpl());
    gh.lazySingleton<_i25.FetchTheUserCredentialAbst>(
        () => _i26.FetchTheUserCredentialImpl());
    gh.lazySingleton<_i27.UserMakeHisLoginAbst>(
        () => _i28.UserMakeHisLoginImpl());
    gh.lazySingleton<_i29.FetchActiveContractCountAbst>(
        () => _i30.FetchActiveContractCountImpl());
    gh.lazySingleton<_i31.FetchTheHostDataFromRenterForConfigRepositAbst>(
        () => _i32.FetchTheHostDataFromRenterForConfigRepositImpl(
              fetchTheUserCredentialForConfigAbst:
                  gh<_i13.FetchTheUserCredentialForConfigAbst>(),
              fetchHosterFromRenterAbst: gh<_i9.FetchHosterFromRenterAbst>(),
            ));
    gh.lazySingleton<_i33.FetchUserCredentialAbst>(
        () => _i34.FetchUserCredentialImpl());
    gh.lazySingleton<_i35.FetchUserCredentialRepositAbst>(() =>
        _i36.FetchUserCredentialRepositImpl(
            fetchUserCredentialAbst: gh<_i33.FetchUserCredentialAbst>()));
    gh.lazySingleton<_i37.FetchMyHostDataFromRenterRepositAbst>(() =>
        _i38.FetchMyHostDataFromRenterRepositImpl(
          fetchTheUserCredentialAbst: gh<_i25.FetchTheUserCredentialAbst>(),
          fetchHosterFromRenterAbst: gh<_i9.FetchHosterFromRenterAbst>(),
          fetchConsensusFromRenterAbst: gh<_i11.FetchConsensusFromRenterAbst>(),
        ));
    gh.lazySingleton<_i39.FetchUserCredentialUsecase>(() =>
        _i39.FetchUserCredentialUsecase(
            fetchUserCredentialRepositAbst:
                gh<_i35.FetchUserCredentialRepositAbst>()));
    gh.lazySingleton<_i40.FetchOneHostDataRepositAbst>(
        () => _i41.FetchOneHostDataRepositImpl(
              fetchAllExistantHostsAbst: gh<_i5.FetchAllExistantHostsAbst>(),
              fetchTheHostAddressCountryAbst:
                  gh<_i3.FetchTheHostAddressCountryAbst>(),
            ));
    gh.lazySingleton<_i42.FetchOneHostInfoDataUsecase>(() =>
        _i42.FetchOneHostInfoDataUsecase(
            fetchOneHostDataRepositAbst:
                gh<_i40.FetchOneHostDataRepositAbst>()));
    gh.lazySingleton<_i43.FetchTheHosterForConfigUsecase>(() =>
        _i43.FetchTheHosterForConfigUsecase(
            fetchTheHostDataFromRenterForConfigRepositAbst:
                gh<_i31.FetchTheHostDataFromRenterForConfigRepositAbst>()));
    gh.factory<_i44.FetchTheHosterForConfigBloc>(() =>
        _i44.FetchTheHosterForConfigBloc(
            fetchTheHosterForConfigUsecase:
                gh<_i43.FetchTheHosterForConfigUsecase>()));
    gh.lazySingleton<_i45.FetchTheListForAllHostDataRepositAbst>(() =>
        _i46.FetchTheListForAllHostDataRepositImpl(
            fetchAllHostDataAbst: gh<_i15.FetchAllHostDataAbst>()));
    gh.lazySingleton<_i47.FetchTheNetworkDataByHostRepositAbst>(() =>
        _i48.FetchTheNetworkDataByHostRepositImpl(
          fetchActiveContractCountAbst: gh<_i29.FetchActiveContractCountAbst>(),
          fetchAllCurrentsHostPresentAbst:
              gh<_i19.FetchAllCurrentsHostPresentAbst>(),
        ));
    gh.lazySingleton<_i49.UpdateTheHosterWithNewDataRepositAbst>(() =>
        _i50.UpdateTheHosterWithNewDataRepositImpl(
            updateTheHosterWithNewDataAbst:
                gh<_i17.UpdateTheHosterWithNewDataAbst>()));
    gh.lazySingleton<_i51.UserMakeTheLoginRepositAbst>(() =>
        _i52.UserMakeTheLoginRepositImpl(
          userMakeHisLoginAbst: gh<_i27.UserMakeHisLoginAbst>(),
          secureTheUserCredentialAbst: gh<_i21.SecureTheUserCredentialAbst>(),
          cacheTheUserCredentialAfterLoginAbst:
              gh<_i23.CacheTheUserCredentialAfterLoginAbst>(),
        ));
    gh.factory<_i53.FetchOneHostDataAndShowItBloc>(() =>
        _i53.FetchOneHostDataAndShowItBloc(
            fetchOneHostInfoDataUsecase:
                gh<_i42.FetchOneHostInfoDataUsecase>()));
    gh.factory<_i54.FetchUserCredentialBloc>(() => _i54.FetchUserCredentialBloc(
        fetchUserCredentialUsecase: gh<_i39.FetchUserCredentialUsecase>()));
    gh.lazySingleton<_i55.FetchAllTheHostUsecase>(() =>
        _i55.FetchAllTheHostUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i45.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i56.SearchTheHostByPubKeyUsecase>(() =>
        _i56.SearchTheHostByPubKeyUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i45.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i57.FetchMyHostFromRenterUsecase>(() =>
        _i57.FetchMyHostFromRenterUsecase(
            fetchMyHostDataFromRenterRepositAbst:
                gh<_i37.FetchMyHostDataFromRenterRepositAbst>()));
    gh.lazySingleton<_i58.UserFetchTheNetworkDataUsecase>(() =>
        _i58.UserFetchTheNetworkDataUsecase(
            fetchTheNetworkDataByHostRepositAbst:
                gh<_i47.FetchTheNetworkDataByHostRepositAbst>()));
    gh.lazySingleton<_i59.UserMakeTheLoginUsecase>(() =>
        _i59.UserMakeTheLoginUsecase(
            userMakeTheLoginRepositAbst:
                gh<_i51.UserMakeTheLoginRepositAbst>()));
    gh.factory<_i60.FetchMyHosterBloc>(() => _i60.FetchMyHosterBloc(
        fetchMyHostFromRenterUsecase: gh<_i57.FetchMyHostFromRenterUsecase>()));
    gh.lazySingleton<_i61.ReconfigTheHostUsecase>(() =>
        _i61.ReconfigTheHostUsecase(
            updateTheHosterWithNewDataRepositAbst:
                gh<_i49.UpdateTheHosterWithNewDataRepositAbst>()));
    gh.factory<_i62.NetworkDataFetchingBloc>(() => _i62.NetworkDataFetchingBloc(
        userFetchTheNetworkDataUsecase:
            gh<_i58.UserFetchTheNetworkDataUsecase>()));
    gh.factory<_i63.ReconfigTheHostDataBloc>(() => _i63.ReconfigTheHostDataBloc(
        reconfigTheHostUsecase: gh<_i61.ReconfigTheHostUsecase>()));
    gh.factory<_i64.FetchAllHostsDataBloc>(() => _i64.FetchAllHostsDataBloc(
          searchTheHostByPubKeyUsecase: gh<_i56.SearchTheHostByPubKeyUsecase>(),
          fetchAllTheHostUsecase: gh<_i55.FetchAllTheHostUsecase>(),
        ));
    gh.factory<_i65.LoginAccountBloc>(() => _i65.LoginAccountBloc(
        userMakeTheLoginUsecase: gh<_i59.UserMakeTheLoginUsecase>()));
    return this;
  }
}
