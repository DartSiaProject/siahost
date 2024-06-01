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
    as _i34;
import '../../../modules/account_mod/features/fetch_user_account_present/data/local_source/impls/fetch_user_credential_impl.dart'
    as _i35;
import '../../../modules/account_mod/features/fetch_user_account_present/data/reposit_impls/fetch_user_credential_reposit_impl.dart'
    as _i37;
import '../../../modules/account_mod/features/fetch_user_account_present/domain/reposit_absts/fetch_user_credential_reposit_abst.dart'
    as _i36;
import '../../../modules/account_mod/features/fetch_user_account_present/domain/usecases/fetch_user_credential_usecase.dart'
    as _i40;
import '../../../modules/account_mod/features/fetch_user_account_present/states_holder/fetch_user_credential_bloc/fetch_user_credential_bloc.dart'
    as _i55;
import '../../../modules/account_mod/features/user_login/data/local_source/absts/cache_the_user_credential_after_login_abst.dart'
    as _i24;
import '../../../modules/account_mod/features/user_login/data/local_source/absts/secure_the_user_credential_abst.dart'
    as _i22;
import '../../../modules/account_mod/features/user_login/data/local_source/impls/cache_the_user_credential_after_login_impl.dart'
    as _i25;
import '../../../modules/account_mod/features/user_login/data/local_source/impls/secure_the_user_credential_impl.dart'
    as _i23;
import '../../../modules/account_mod/features/user_login/data/remote_source/absts/user_make_his_login_abst.dart'
    as _i28;
import '../../../modules/account_mod/features/user_login/data/remote_source/impls/user_make_his_login_impl.dart'
    as _i29;
import '../../../modules/account_mod/features/user_login/data/reposit_impls/user_make_the_login_reposit_impl.dart'
    as _i53;
import '../../../modules/account_mod/features/user_login/domain/reposit_absts/user_make_the_login_reposit_abst.dart'
    as _i52;
import '../../../modules/account_mod/features/user_login/domain/usecases/user_make_the_login_usecase.dart'
    as _i60;
import '../../../modules/account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart'
    as _i66;
import '../../../modules/files_mod/features/fetch_all_files/states_holder/files_bloc/files_bloc.dart'
    as _i3;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_active_contract_count_abst.dart'
    as _i30;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_all_currents_host_present_abst.dart'
    as _i20;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_active_contract_count_impl.dart'
    as _i31;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_all_currents_host_present_impl.dart'
    as _i21;
import '../../../modules/home_mod/features/fetch_the_network_data/data/reposit_impls/fetch_the_network_data_by_host_reposit_impl.dart'
    as _i49;
import '../../../modules/home_mod/features/fetch_the_network_data/domain/reposit_absts/fetch_the_network_data_by_host_reposit_abst.dart'
    as _i48;
import '../../../modules/home_mod/features/fetch_the_network_data/domain/usecases/user_fetch_the_network_data_usecase.dart'
    as _i59;
import '../../../modules/home_mod/features/fetch_the_network_data/states_holder/network_data_fetching_bloc/network_data_fetching_bloc.dart'
    as _i63;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/absts/fetch_the_user_credential_for_config_abst.dart'
    as _i14;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/impls/fetch_the_user_credential_for_config_impl.dart'
    as _i15;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/absts/fetch_hoster_from_renter_for_config_abst.dart'
    as _i8;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/impls/fetch_hoster_from_renter_for_config_impl.dart'
    as _i9;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/reposit_impls/fetch_the_host_data_from_renter_for_config_reposit_impl.dart'
    as _i33;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/reposit_absts/fetch_the_host_data_from_renter_for_config_reposit_abst.dart'
    as _i32;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/usecases/fetch_the_hoster_for_config_usecase.dart'
    as _i44;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/states_holder/fetch_the_hoster_for_config_bloc/fetch_the_hoster_for_config_bloc.dart'
    as _i45;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/absts/update_the_hoster_with_new_data_abst.dart'
    as _i18;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/impls/update_the_hoster_with_new_data_impl.dart'
    as _i19;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/reposit_impls/update_the_hoster_with_new_data_reposit_impl.dart'
    as _i51;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/reposit_absts/update_the_hoster_with_new_data_reposit_abst.dart'
    as _i50;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/usecases/reconfig_the_host_usecase.dart'
    as _i62;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/states_holder/reconfig_the_host_data_bloc/reconfig_the_host_data_bloc.dart'
    as _i64;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/absts/fetch_the_user_credential_abst.dart'
    as _i26;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/impls/fetch_the_user_credential_impl.dart'
    as _i27;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_consensus_from_renter_abst.dart'
    as _i12;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_hoster_from_renter_abst.dart'
    as _i10;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_consensus_from_renter_impl.dart'
    as _i13;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_hoster_from_renter_impl.dart'
    as _i11;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/reposit_impls/fetch_my_host_data_from_renter_reposit_impl.dart'
    as _i39;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/domain/reposit_absts/fetch_my_host_data_from_renter_reposit_abst.dart'
    as _i38;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/domain/usecases/fetch_my_host_from_renter_usecase.dart'
    as _i58;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/states_holder/fetch_my_hoster_bloc/fetch_my_hoster_bloc.dart'
    as _i61;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_all_existant_hosts_abst.dart'
    as _i6;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_the_host_address_country_abst.dart'
    as _i4;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_all_existant_hosts_impl.dart'
    as _i7;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_the_host_address_country_imp.dart'
    as _i5;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/reposit_impls/fetch_one_host_data_reposit_impl.dart'
    as _i42;
import '../../../modules/search_mod/features/fetch_and_show_one_host/domain/reposit_absts/fetch_one_host_data_reposit_abst.dart'
    as _i41;
import '../../../modules/search_mod/features/fetch_and_show_one_host/domain/usecases/fetch_one_host_info_data_usecase.dart'
    as _i43;
import '../../../modules/search_mod/features/fetch_and_show_one_host/states_holder/fetch_one_host_data_and_show_it_bloc/fetch_one_host_data_and_show_it_bloc.dart'
    as _i54;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/absts/fetch_all_host_data_abst.dart'
    as _i16;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/impls/fetch_all_hosts_data_impl.dart'
    as _i17;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/reposit_impls/fetch_the_list_for_all_host_data_reposit_impl.dart'
    as _i47;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/reposit_absts/fetch_the_list_for_all_host_data_reposit_abst.dart'
    as _i46;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/fetch_all_the_host_usecase.dart'
    as _i56;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/search_the_host_by_pub_key_usecase.dart'
    as _i57;
import '../../../modules/search_mod/features/fetch_the_hosts_data/states_holder/fetch_all_hosts_data_bloc/fetch_all_hosts_data_bloc.dart'
    as _i65;

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
    gh.factory<_i3.FilesBloc>(() => _i3.FilesBloc());
    gh.lazySingleton<_i4.FetchTheHostAddressCountryAbst>(
        () => _i5.FetchTheHostAddressCountryImpl());
    gh.lazySingleton<_i6.FetchAllExistantHostsAbst>(
        () => _i7.FetchAllExistantHostsImpl());
    gh.lazySingleton<_i8.FetchHosterFromRenterForConfigAbst>(
        () => _i9.FetchHosterFromRenterForConfigImpl());
    gh.lazySingleton<_i10.FetchHosterFromRenterAbst>(
        () => _i11.FetchHosterFromRenterImpl());
    gh.lazySingleton<_i12.FetchConsensusFromRenterAbst>(
        () => _i13.FetchConsensusFromRenterImpl());
    gh.lazySingleton<_i14.FetchTheUserCredentialForConfigAbst>(
        () => _i15.FetchTheUserCredentialForConfigImpl());
    gh.lazySingleton<_i16.FetchAllHostDataAbst>(
        () => _i17.FetchAllHostDataImpl());
    gh.lazySingleton<_i18.UpdateTheHosterWithNewDataAbst>(
        () => _i19.UpdateTheHosterWithNewDataImpl());
    gh.lazySingleton<_i20.FetchAllCurrentsHostPresentAbst>(
        () => _i21.FetchAllCurrentsHostPresentImpl());
    gh.lazySingleton<_i22.SecureTheUserCredentialAbst>(
        () => _i23.SecureTheUserCredentialImpl());
    gh.lazySingleton<_i24.CacheTheUserCredentialAfterLoginAbst>(
        () => _i25.CacheTheUserCredentialsAfterLoginImpl());
    gh.lazySingleton<_i26.FetchTheUserCredentialAbst>(
        () => _i27.FetchTheUserCredentialImpl());
    gh.lazySingleton<_i28.UserMakeHisLoginAbst>(
        () => _i29.UserMakeHisLoginImpl());
    gh.lazySingleton<_i30.FetchActiveContractCountAbst>(
        () => _i31.FetchActiveContractCountImpl());
    gh.lazySingleton<_i32.FetchTheHostDataFromRenterForConfigRepositAbst>(
        () => _i33.FetchTheHostDataFromRenterForConfigRepositImpl(
              fetchTheUserCredentialForConfigAbst:
                  gh<_i14.FetchTheUserCredentialForConfigAbst>(),
              fetchHosterFromRenterAbst: gh<_i10.FetchHosterFromRenterAbst>(),
            ));
    gh.lazySingleton<_i34.FetchUserCredentialAbst>(
        () => _i35.FetchUserCredentialImpl());
    gh.lazySingleton<_i36.FetchUserCredentialRepositAbst>(() =>
        _i37.FetchUserCredentialRepositImpl(
            fetchUserCredentialAbst: gh<_i34.FetchUserCredentialAbst>()));
    gh.lazySingleton<_i38.FetchMyHostDataFromRenterRepositAbst>(() =>
        _i39.FetchMyHostDataFromRenterRepositImpl(
          fetchTheUserCredentialAbst: gh<_i26.FetchTheUserCredentialAbst>(),
          fetchHosterFromRenterAbst: gh<_i10.FetchHosterFromRenterAbst>(),
          fetchConsensusFromRenterAbst: gh<_i12.FetchConsensusFromRenterAbst>(),
        ));
    gh.lazySingleton<_i40.FetchUserCredentialUsecase>(() =>
        _i40.FetchUserCredentialUsecase(
            fetchUserCredentialRepositAbst:
                gh<_i36.FetchUserCredentialRepositAbst>()));
    gh.lazySingleton<_i41.FetchOneHostDataRepositAbst>(
        () => _i42.FetchOneHostDataRepositImpl(
              fetchAllExistantHostsAbst: gh<_i6.FetchAllExistantHostsAbst>(),
              fetchTheHostAddressCountryAbst:
                  gh<_i4.FetchTheHostAddressCountryAbst>(),
            ));
    gh.lazySingleton<_i43.FetchOneHostInfoDataUsecase>(() =>
        _i43.FetchOneHostInfoDataUsecase(
            fetchOneHostDataRepositAbst:
                gh<_i41.FetchOneHostDataRepositAbst>()));
    gh.lazySingleton<_i44.FetchTheHosterForConfigUsecase>(() =>
        _i44.FetchTheHosterForConfigUsecase(
            fetchTheHostDataFromRenterForConfigRepositAbst:
                gh<_i32.FetchTheHostDataFromRenterForConfigRepositAbst>()));
    gh.factory<_i45.FetchTheHosterForConfigBloc>(() =>
        _i45.FetchTheHosterForConfigBloc(
            fetchTheHosterForConfigUsecase:
                gh<_i44.FetchTheHosterForConfigUsecase>()));
    gh.lazySingleton<_i46.FetchTheListForAllHostDataRepositAbst>(() =>
        _i47.FetchTheListForAllHostDataRepositImpl(
            fetchAllHostDataAbst: gh<_i16.FetchAllHostDataAbst>()));
    gh.lazySingleton<_i48.FetchTheNetworkDataByHostRepositAbst>(() =>
        _i49.FetchTheNetworkDataByHostRepositImpl(
          fetchActiveContractCountAbst: gh<_i30.FetchActiveContractCountAbst>(),
          fetchAllCurrentsHostPresentAbst:
              gh<_i20.FetchAllCurrentsHostPresentAbst>(),
        ));
    gh.lazySingleton<_i50.UpdateTheHosterWithNewDataRepositAbst>(() =>
        _i51.UpdateTheHosterWithNewDataRepositImpl(
            updateTheHosterWithNewDataAbst:
                gh<_i18.UpdateTheHosterWithNewDataAbst>()));
    gh.lazySingleton<_i52.UserMakeTheLoginRepositAbst>(() =>
        _i53.UserMakeTheLoginRepositImpl(
          userMakeHisLoginAbst: gh<_i28.UserMakeHisLoginAbst>(),
          secureTheUserCredentialAbst: gh<_i22.SecureTheUserCredentialAbst>(),
          cacheTheUserCredentialAfterLoginAbst:
              gh<_i24.CacheTheUserCredentialAfterLoginAbst>(),
        ));
    gh.factory<_i54.FetchOneHostDataAndShowItBloc>(() =>
        _i54.FetchOneHostDataAndShowItBloc(
            fetchOneHostInfoDataUsecase:
                gh<_i43.FetchOneHostInfoDataUsecase>()));
    gh.factory<_i55.FetchUserCredentialBloc>(() => _i55.FetchUserCredentialBloc(
        fetchUserCredentialUsecase: gh<_i40.FetchUserCredentialUsecase>()));
    gh.lazySingleton<_i56.FetchAllTheHostUsecase>(() =>
        _i56.FetchAllTheHostUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i46.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i57.SearchTheHostByPubKeyUsecase>(() =>
        _i57.SearchTheHostByPubKeyUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i46.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i58.FetchMyHostFromRenterUsecase>(() =>
        _i58.FetchMyHostFromRenterUsecase(
            fetchMyHostDataFromRenterRepositAbst:
                gh<_i38.FetchMyHostDataFromRenterRepositAbst>()));
    gh.lazySingleton<_i59.UserFetchTheNetworkDataUsecase>(() =>
        _i59.UserFetchTheNetworkDataUsecase(
            fetchTheNetworkDataByHostRepositAbst:
                gh<_i48.FetchTheNetworkDataByHostRepositAbst>()));
    gh.lazySingleton<_i60.UserMakeTheLoginUsecase>(() =>
        _i60.UserMakeTheLoginUsecase(
            userMakeTheLoginRepositAbst:
                gh<_i52.UserMakeTheLoginRepositAbst>()));
    gh.factory<_i61.FetchMyHosterBloc>(() => _i61.FetchMyHosterBloc(
        fetchMyHostFromRenterUsecase: gh<_i58.FetchMyHostFromRenterUsecase>()));
    gh.lazySingleton<_i62.ReconfigTheHostUsecase>(() =>
        _i62.ReconfigTheHostUsecase(
            updateTheHosterWithNewDataRepositAbst:
                gh<_i50.UpdateTheHosterWithNewDataRepositAbst>()));
    gh.factory<_i63.NetworkDataFetchingBloc>(() => _i63.NetworkDataFetchingBloc(
        userFetchTheNetworkDataUsecase:
            gh<_i59.UserFetchTheNetworkDataUsecase>()));
    gh.factory<_i64.ReconfigTheHostDataBloc>(() => _i64.ReconfigTheHostDataBloc(
        reconfigTheHostUsecase: gh<_i62.ReconfigTheHostUsecase>()));
    gh.factory<_i65.FetchAllHostsDataBloc>(() => _i65.FetchAllHostsDataBloc(
          searchTheHostByPubKeyUsecase: gh<_i57.SearchTheHostByPubKeyUsecase>(),
          fetchAllTheHostUsecase: gh<_i56.FetchAllTheHostUsecase>(),
        ));
    gh.factory<_i66.LoginAccountBloc>(() => _i66.LoginAccountBloc(
        userMakeTheLoginUsecase: gh<_i60.UserMakeTheLoginUsecase>()));
    return this;
  }
}
