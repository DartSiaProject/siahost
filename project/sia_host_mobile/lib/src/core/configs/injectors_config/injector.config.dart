// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../modules/account_mod/features/fetch_user_account_present/data/local_source/absts/fech_user_credential_abst.dart'
    as _i965;
import '../../../modules/account_mod/features/fetch_user_account_present/data/local_source/impls/fetch_user_credential_impl.dart'
    as _i83;
import '../../../modules/account_mod/features/fetch_user_account_present/data/reposit_impls/fetch_user_credential_reposit_impl.dart'
    as _i382;
import '../../../modules/account_mod/features/fetch_user_account_present/domain/reposit_absts/fetch_user_credential_reposit_abst.dart'
    as _i281;
import '../../../modules/account_mod/features/fetch_user_account_present/domain/usecases/fetch_user_credential_usecase.dart'
    as _i392;
import '../../../modules/account_mod/features/fetch_user_account_present/states_holder/fetch_user_credential_bloc/fetch_user_credential_bloc.dart'
    as _i1057;
import '../../../modules/account_mod/features/user_login/data/local_source/absts/cache_the_user_credential_after_login_abst.dart'
    as _i11;
import '../../../modules/account_mod/features/user_login/data/local_source/absts/secure_the_user_credential_abst.dart'
    as _i605;
import '../../../modules/account_mod/features/user_login/data/local_source/impls/cache_the_user_credential_after_login_impl.dart'
    as _i41;
import '../../../modules/account_mod/features/user_login/data/local_source/impls/secure_the_user_credential_impl.dart'
    as _i610;
import '../../../modules/account_mod/features/user_login/data/remote_source/absts/user_make_his_login_abst.dart'
    as _i269;
import '../../../modules/account_mod/features/user_login/data/remote_source/impls/user_make_his_login_impl.dart'
    as _i624;
import '../../../modules/account_mod/features/user_login/data/reposit_impls/user_make_the_login_reposit_impl.dart'
    as _i403;
import '../../../modules/account_mod/features/user_login/domain/reposit_absts/user_make_the_login_reposit_abst.dart'
    as _i282;
import '../../../modules/account_mod/features/user_login/domain/usecases/user_make_the_login_usecase.dart'
    as _i473;
import '../../../modules/account_mod/features/user_login/states_holder/login_account_bloc/login_account_bloc.dart'
    as _i301;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/data/remote_source/absts/fetch_all_buckets_abst.dart'
    as _i744;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/data/remote_source/absts/fetch_files_from_bucket_abst.dart'
    as _i600;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/data/remote_source/impls/fetch_all_buckets_impl.dart'
    as _i875;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/data/remote_source/impls/fetch_files_from_bucket_impl.dart'
    as _i652;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/data/reposit_impls/fetch_all_buckets_and_files_reposit_impl.dart'
    as _i198;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/domain/reposit_absts/fetch_all_buckets_and_files_reposit_abst.dart'
    as _i87;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/domain/usecases/fetch_all_buckets_usecase.dart'
    as _i413;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/domain/usecases/fetch_files_from_bucket_usecase.dart'
    as _i529;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/states_holder/fetch_all_bucket_bloc/fetch_all_bucket_bloc.dart'
    as _i891;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/states_holder/fetch_all_file_bloc/fetch_all_files_bloc.dart'
    as _i385;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/states_holder/files_bloc/files_bloc.dart'
    as _i154;
import '../../../modules/files_mod/features/file_editor/data/remote_source/absts/delete_the_file_abst.dart'
    as _i113;
import '../../../modules/files_mod/features/file_editor/data/remote_source/impls/delete_the_file_impl.dart'
    as _i279;
import '../../../modules/files_mod/features/file_editor/data/reposit_impls/the_file_editor_reposit_impl.dart'
    as _i391;
import '../../../modules/files_mod/features/file_editor/domain/reposit_absts/the_file_editor_reposit_abst.dart'
    as _i506;
import '../../../modules/files_mod/features/file_editor/domain/usecases/delete_the_file_usecase.dart'
    as _i62;
import '../../../modules/files_mod/features/file_editor/states_holder/file_editor_bloc/file_editor_bloc.dart'
    as _i73;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_active_contract_count_abst.dart'
    as _i17;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/absts/fetch_all_currents_host_present_abst.dart'
    as _i56;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_active_contract_count_impl.dart'
    as _i603;
import '../../../modules/home_mod/features/fetch_the_network_data/data/remote_source/impls/fetch_all_currents_host_present_impl.dart'
    as _i67;
import '../../../modules/home_mod/features/fetch_the_network_data/data/reposit_impls/fetch_the_network_data_by_host_reposit_impl.dart'
    as _i691;
import '../../../modules/home_mod/features/fetch_the_network_data/domain/reposit_absts/fetch_the_network_data_by_host_reposit_abst.dart'
    as _i413;
import '../../../modules/home_mod/features/fetch_the_network_data/domain/usecases/user_fetch_the_network_data_usecase.dart'
    as _i595;
import '../../../modules/home_mod/features/fetch_the_network_data/states_holder/network_data_fetching_bloc/network_data_fetching_bloc.dart'
    as _i318;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/absts/fetch_the_user_credential_for_config_abst.dart'
    as _i941;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/local_source/impls/fetch_the_user_credential_for_config_impl.dart'
    as _i918;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/absts/fetch_hoster_from_renter_for_config_abst.dart'
    as _i927;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/remote_source/impls/fetch_hoster_from_renter_for_config_impl.dart'
    as _i208;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/data/reposit_impls/fetch_the_host_data_from_renter_for_config_reposit_impl.dart'
    as _i737;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/reposit_absts/fetch_the_host_data_from_renter_for_config_reposit_abst.dart'
    as _i582;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/domain/usecases/fetch_the_hoster_for_config_usecase.dart'
    as _i383;
import '../../../modules/host_config_mod/features/fetch_the_hoster_for_config/states_holder/fetch_the_hoster_for_config_bloc/fetch_the_hoster_for_config_bloc.dart'
    as _i660;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/absts/update_the_hoster_with_new_data_abst.dart'
    as _i371;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/remote_source/impls/update_the_hoster_with_new_data_impl.dart'
    as _i812;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/data/reposit_impls/update_the_hoster_with_new_data_reposit_impl.dart'
    as _i38;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/reposit_absts/update_the_hoster_with_new_data_reposit_abst.dart'
    as _i163;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/domain/usecases/reconfig_the_host_usecase.dart'
    as _i395;
import '../../../modules/host_config_mod/features/update_the_hoster_with_new_data/states_holder/reconfig_the_host_data_bloc/reconfig_the_host_data_bloc.dart'
    as _i940;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/absts/fetch_the_user_credential_abst.dart'
    as _i46;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/local_source/impls/fetch_the_user_credential_impl.dart'
    as _i961;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_consensus_from_renter_abst.dart'
    as _i83;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/absts/fetch_hoster_from_renter_abst.dart'
    as _i1048;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_consensus_from_renter_impl.dart'
    as _i334;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/remote_source/impls/fetch_hoster_from_renter_impl.dart'
    as _i429;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/data/reposit_impls/fetch_my_host_data_from_renter_reposit_impl.dart'
    as _i502;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/domain/reposit_absts/fetch_my_host_data_from_renter_reposit_abst.dart'
    as _i743;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/domain/usecases/fetch_my_host_from_renter_usecase.dart'
    as _i345;
import '../../../modules/my_host_mod/features/fetch_host_from_renter/states_holder/fetch_my_hoster_bloc/fetch_my_hoster_bloc.dart'
    as _i655;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_all_existant_hosts_abst.dart'
    as _i639;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/absts/fetch_the_host_address_country_abst.dart'
    as _i106;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_all_existant_hosts_impl.dart'
    as _i936;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/remote_source/impls/fetch_the_host_address_country_imp.dart'
    as _i825;
import '../../../modules/search_mod/features/fetch_and_show_one_host/data/reposit_impls/fetch_one_host_data_reposit_impl.dart'
    as _i191;
import '../../../modules/search_mod/features/fetch_and_show_one_host/domain/reposit_absts/fetch_one_host_data_reposit_abst.dart'
    as _i1027;
import '../../../modules/search_mod/features/fetch_and_show_one_host/domain/usecases/fetch_one_host_info_data_usecase.dart'
    as _i145;
import '../../../modules/search_mod/features/fetch_and_show_one_host/states_holder/fetch_one_host_data_and_show_it_bloc/fetch_one_host_data_and_show_it_bloc.dart'
    as _i73;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/absts/fetch_all_host_data_abst.dart'
    as _i159;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/remote_source/impls/fetch_all_hosts_data_impl.dart'
    as _i850;
import '../../../modules/search_mod/features/fetch_the_hosts_data/data/reposit_impls/fetch_the_list_for_all_host_data_reposit_impl.dart'
    as _i821;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/reposit_absts/fetch_the_list_for_all_host_data_reposit_abst.dart'
    as _i797;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/fetch_all_the_host_usecase.dart'
    as _i921;
import '../../../modules/search_mod/features/fetch_the_hosts_data/domain/usecases/search_the_host_by_pub_key_usecase.dart'
    as _i781;
import '../../../modules/search_mod/features/fetch_the_hosts_data/states_holder/fetch_all_hosts_data_bloc/fetch_all_hosts_data_bloc.dart'
    as _i144;

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
    gh.factory<_i154.FilesBloc>(() => _i154.FilesBloc());
    gh.lazySingleton<_i106.FetchTheHostAddressCountryAbst>(
        () => _i825.FetchTheHostAddressCountryImpl());
    gh.lazySingleton<_i639.FetchAllExistantHostsAbst>(
        () => _i936.FetchAllExistantHostsImpl());
    gh.lazySingleton<_i113.DeleteTheFileAbst>(() => _i279.DeleteTheFileImpl());
    gh.lazySingleton<_i927.FetchHosterFromRenterForConfigAbst>(
        () => _i208.FetchHosterFromRenterForConfigImpl());
    gh.lazySingleton<_i1048.FetchHosterFromRenterAbst>(
        () => _i429.FetchHosterFromRenterImpl());
    gh.lazySingleton<_i83.FetchConsensusFromRenterAbst>(
        () => _i334.FetchConsensusFromRenterImpl());
    gh.lazySingleton<_i941.FetchTheUserCredentialForConfigAbst>(
        () => _i918.FetchTheUserCredentialForConfigImpl());
    gh.lazySingleton<_i159.FetchAllHostDataAbst>(
        () => _i850.FetchAllHostDataImpl());
    gh.lazySingleton<_i371.UpdateTheHosterWithNewDataAbst>(
        () => _i812.UpdateTheHosterWithNewDataImpl());
    gh.lazySingleton<_i56.FetchAllCurrentsHostPresentAbst>(
        () => _i67.FetchAllCurrentsHostPresentImpl());
    gh.lazySingleton<_i744.FetchAllBucketsAbst>(
        () => _i875.FetchAllBucketsImpl());
    gh.lazySingleton<_i605.SecureTheUserCredentialAbst>(
        () => _i610.SecureTheUserCredentialImpl());
    gh.lazySingleton<_i11.CacheTheUserCredentialAfterLoginAbst>(
        () => _i41.CacheTheUserCredentialsAfterLoginImpl());
    gh.lazySingleton<_i600.FetchFilesFromBucketAbst>(
        () => _i652.FetchFilesFromBucketImpl());
    gh.lazySingleton<_i46.FetchTheUserCredentialAbst>(
        () => _i961.FetchTheUserCredentialImpl());
    gh.lazySingleton<_i269.UserMakeHisLoginAbst>(
        () => _i624.UserMakeHisLoginImpl());
    gh.lazySingleton<_i17.FetchActiveContractCountAbst>(
        () => _i603.FetchActiveContractCountImpl());
    gh.lazySingleton<_i582.FetchTheHostDataFromRenterForConfigRepositAbst>(
        () => _i737.FetchTheHostDataFromRenterForConfigRepositImpl(
              fetchTheUserCredentialForConfigAbst:
                  gh<_i941.FetchTheUserCredentialForConfigAbst>(),
              fetchHosterFromRenterAbst: gh<_i1048.FetchHosterFromRenterAbst>(),
            ));
    gh.lazySingleton<_i965.FetchUserCredentialAbst>(
        () => _i83.FetchUserCredentialImpl());
    gh.lazySingleton<_i281.FetchUserCredentialRepositAbst>(() =>
        _i382.FetchUserCredentialRepositImpl(
            fetchUserCredentialAbst: gh<_i965.FetchUserCredentialAbst>()));
    gh.lazySingleton<_i743.FetchMyHostDataFromRenterRepositAbst>(() =>
        _i502.FetchMyHostDataFromRenterRepositImpl(
          fetchTheUserCredentialAbst: gh<_i46.FetchTheUserCredentialAbst>(),
          fetchHosterFromRenterAbst: gh<_i1048.FetchHosterFromRenterAbst>(),
          fetchConsensusFromRenterAbst: gh<_i83.FetchConsensusFromRenterAbst>(),
        ));
    gh.lazySingleton<_i392.FetchUserCredentialUsecase>(() =>
        _i392.FetchUserCredentialUsecase(
            fetchUserCredentialRepositAbst:
                gh<_i281.FetchUserCredentialRepositAbst>()));
    gh.lazySingleton<_i1027.FetchOneHostDataRepositAbst>(
        () => _i191.FetchOneHostDataRepositImpl(
              fetchAllExistantHostsAbst: gh<_i639.FetchAllExistantHostsAbst>(),
              fetchTheHostAddressCountryAbst:
                  gh<_i106.FetchTheHostAddressCountryAbst>(),
            ));
    gh.lazySingleton<_i145.FetchOneHostInfoDataUsecase>(() =>
        _i145.FetchOneHostInfoDataUsecase(
            fetchOneHostDataRepositAbst:
                gh<_i1027.FetchOneHostDataRepositAbst>()));
    gh.lazySingleton<_i383.FetchTheHosterForConfigUsecase>(() =>
        _i383.FetchTheHosterForConfigUsecase(
            fetchTheHostDataFromRenterForConfigRepositAbst:
                gh<_i582.FetchTheHostDataFromRenterForConfigRepositAbst>()));
    gh.lazySingleton<_i506.TheFileEditorRepositAbst>(() =>
        _i391.TheFileEditorRepositImpl(
            deleteTheFileAbst: gh<_i113.DeleteTheFileAbst>()));
    gh.lazySingleton<_i87.FetchAllBucketsAndFilesRepositAbst>(
        () => _i198.FetchAllBucketsAndFilesRepositImpl(
              fetchAllBucketsAbst: gh<_i744.FetchAllBucketsAbst>(),
              fetchFilesFromBucketAbst: gh<_i600.FetchFilesFromBucketAbst>(),
            ));
    gh.factory<_i660.FetchTheHosterForConfigBloc>(() =>
        _i660.FetchTheHosterForConfigBloc(
            fetchTheHosterForConfigUsecase:
                gh<_i383.FetchTheHosterForConfigUsecase>()));
    gh.lazySingleton<_i413.FetchAllBucketsUsecase>(() =>
        _i413.FetchAllBucketsUsecase(
            fetchAllBucketsAndFilesRepositAbst:
                gh<_i87.FetchAllBucketsAndFilesRepositAbst>()));
    gh.lazySingleton<_i529.FetchFilesFromBucketUsecase>(() =>
        _i529.FetchFilesFromBucketUsecase(
            fetchAllBucketsAndFilesRepositAbst:
                gh<_i87.FetchAllBucketsAndFilesRepositAbst>()));
    gh.lazySingleton<_i797.FetchTheListForAllHostDataRepositAbst>(() =>
        _i821.FetchTheListForAllHostDataRepositImpl(
            fetchAllHostDataAbst: gh<_i159.FetchAllHostDataAbst>()));
    gh.lazySingleton<_i413.FetchTheNetworkDataByHostRepositAbst>(() =>
        _i691.FetchTheNetworkDataByHostRepositImpl(
          fetchActiveContractCountAbst: gh<_i17.FetchActiveContractCountAbst>(),
          fetchAllCurrentsHostPresentAbst:
              gh<_i56.FetchAllCurrentsHostPresentAbst>(),
        ));
    gh.lazySingleton<_i163.UpdateTheHosterWithNewDataRepositAbst>(() =>
        _i38.UpdateTheHosterWithNewDataRepositImpl(
            updateTheHosterWithNewDataAbst:
                gh<_i371.UpdateTheHosterWithNewDataAbst>()));
    gh.lazySingleton<_i282.UserMakeTheLoginRepositAbst>(() =>
        _i403.UserMakeTheLoginRepositImpl(
          userMakeHisLoginAbst: gh<_i269.UserMakeHisLoginAbst>(),
          secureTheUserCredentialAbst: gh<_i605.SecureTheUserCredentialAbst>(),
          cacheTheUserCredentialAfterLoginAbst:
              gh<_i11.CacheTheUserCredentialAfterLoginAbst>(),
        ));
    gh.factory<_i73.FetchOneHostDataAndShowItBloc>(() =>
        _i73.FetchOneHostDataAndShowItBloc(
            fetchOneHostInfoDataUsecase:
                gh<_i145.FetchOneHostInfoDataUsecase>()));
    gh.factory<_i1057.FetchUserCredentialBloc>(() =>
        _i1057.FetchUserCredentialBloc(
            fetchUserCredentialUsecase:
                gh<_i392.FetchUserCredentialUsecase>()));
    gh.lazySingleton<_i921.FetchAllTheHostUsecase>(() =>
        _i921.FetchAllTheHostUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i797.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i781.SearchTheHostByPubKeyUsecase>(() =>
        _i781.SearchTheHostByPubKeyUsecase(
            fetchTheListForAllHostDataRepositAbst:
                gh<_i797.FetchTheListForAllHostDataRepositAbst>()));
    gh.lazySingleton<_i345.FetchMyHostFromRenterUsecase>(() =>
        _i345.FetchMyHostFromRenterUsecase(
            fetchMyHostDataFromRenterRepositAbst:
                gh<_i743.FetchMyHostDataFromRenterRepositAbst>()));
    gh.lazySingleton<_i595.UserFetchTheNetworkDataUsecase>(() =>
        _i595.UserFetchTheNetworkDataUsecase(
            fetchTheNetworkDataByHostRepositAbst:
                gh<_i413.FetchTheNetworkDataByHostRepositAbst>()));
    gh.lazySingleton<_i473.UserMakeTheLoginUsecase>(() =>
        _i473.UserMakeTheLoginUsecase(
            userMakeTheLoginRepositAbst:
                gh<_i282.UserMakeTheLoginRepositAbst>()));
    gh.factory<_i655.FetchMyHosterBloc>(() => _i655.FetchMyHosterBloc(
        fetchMyHostFromRenterUsecase:
            gh<_i345.FetchMyHostFromRenterUsecase>()));
    gh.factory<_i385.FetchAllFilesBloc>(() => _i385.FetchAllFilesBloc(
        fetchFilesFromBucketUsecase: gh<_i529.FetchFilesFromBucketUsecase>()));
    gh.lazySingleton<_i395.ReconfigTheHostUsecase>(() =>
        _i395.ReconfigTheHostUsecase(
            updateTheHosterWithNewDataRepositAbst:
                gh<_i163.UpdateTheHosterWithNewDataRepositAbst>()));
    gh.lazySingleton<_i62.DeleteTheFileUsecase>(() => _i62.DeleteTheFileUsecase(
        theFileEditorRepositAbst: gh<_i506.TheFileEditorRepositAbst>()));
    gh.factory<_i73.FileEditorBloc>(() => _i73.FileEditorBloc(
        deleteTheFileUsecase: gh<_i62.DeleteTheFileUsecase>()));
    gh.factory<_i891.FetchAllBucketBloc>(() => _i891.FetchAllBucketBloc(
        fetchAllBucketsUsecase: gh<_i413.FetchAllBucketsUsecase>()));
    gh.factory<_i318.NetworkDataFetchingBloc>(() =>
        _i318.NetworkDataFetchingBloc(
            userFetchTheNetworkDataUsecase:
                gh<_i595.UserFetchTheNetworkDataUsecase>()));
    gh.factory<_i940.ReconfigTheHostDataBloc>(() =>
        _i940.ReconfigTheHostDataBloc(
            reconfigTheHostUsecase: gh<_i395.ReconfigTheHostUsecase>()));
    gh.factory<_i144.FetchAllHostsDataBloc>(() => _i144.FetchAllHostsDataBloc(
          searchTheHostByPubKeyUsecase:
              gh<_i781.SearchTheHostByPubKeyUsecase>(),
          fetchAllTheHostUsecase: gh<_i921.FetchAllTheHostUsecase>(),
        ));
    gh.factory<_i301.LoginAccountBloc>(() => _i301.LoginAccountBloc(
        userMakeTheLoginUsecase: gh<_i473.UserMakeTheLoginUsecase>()));
    return this;
  }
}
