// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../modules/account_mod/features/fetch_the_user_credentials/data/local_source/absts/fech_user_credential_abst.dart'
    as _i419;
import '../../../modules/account_mod/features/fetch_the_user_credentials/data/local_source/impls/fetch_user_credential_impl.dart'
    as _i629;
import '../../../modules/account_mod/features/fetch_the_user_credentials/data/reposit_impls/fetch_user_credential_reposit_impl.dart'
    as _i619;
import '../../../modules/account_mod/features/fetch_the_user_credentials/domain/reposit_absts/fetch_user_credential_reposit_abst.dart'
    as _i1073;
import '../../../modules/account_mod/features/fetch_the_user_credentials/domain/usecases/fetch_user_credential_usecase.dart'
    as _i605;
import '../../../modules/account_mod/features/fetch_the_user_credentials/states_holder/fetch_user_credential_bloc/fetch_user_credential_bloc.dart'
    as _i826;
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
import '../../../modules/account_mod/features/user_login/data/remote_source/absts/user_verify_his_data_abst.dart'
    as _i329;
import '../../../modules/account_mod/features/user_login/data/remote_source/impls/user_make_his_login_impl.dart'
    as _i624;
import '../../../modules/account_mod/features/user_login/data/remote_source/impls/user_verify_his_data_impl.dart'
    as _i855;
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
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/domain/usecases/fetch_files_from_folder_usecase.dart'
    as _i830;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/states_holder/fetch_all_bucket_bloc/fetch_all_bucket_bloc.dart'
    as _i891;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/states_holder/fetch_all_file_bloc/fetch_all_files_bloc.dart'
    as _i385;
import '../../../modules/files_mod/features/fetch_all_buckets_and_files/states_holder/files_bloc/files_bloc.dart'
    as _i154;
import '../../../modules/files_mod/features/file_editor/data/local_source/absts/pick_the_file_from_phone_abst.dart'
    as _i1006;
import '../../../modules/files_mod/features/file_editor/data/local_source/absts/save_the_file_downloaded_abst.dart'
    as _i238;
import '../../../modules/files_mod/features/file_editor/data/local_source/impls/pick_the_file_from_phone_impl.dart'
    as _i259;
import '../../../modules/files_mod/features/file_editor/data/local_source/impls/save_the_file_downloaded_impl.dart'
    as _i109;
import '../../../modules/files_mod/features/file_editor/data/remote_source/absts/copy_the_file_abst.dart'
    as _i247;
import '../../../modules/files_mod/features/file_editor/data/remote_source/absts/delete_the_file_abst.dart'
    as _i113;
import '../../../modules/files_mod/features/file_editor/data/remote_source/absts/download_the_file_abst.dart'
    as _i755;
import '../../../modules/files_mod/features/file_editor/data/remote_source/absts/rename_the_file_abst.dart'
    as _i814;
import '../../../modules/files_mod/features/file_editor/data/remote_source/absts/upload_file_on_server_abst.dart'
    as _i866;
import '../../../modules/files_mod/features/file_editor/data/remote_source/impls/copy_the_file_impl.dart'
    as _i405;
import '../../../modules/files_mod/features/file_editor/data/remote_source/impls/delete_the_file_impl.dart'
    as _i279;
import '../../../modules/files_mod/features/file_editor/data/remote_source/impls/download_the_file_impl.dart'
    as _i998;
import '../../../modules/files_mod/features/file_editor/data/remote_source/impls/rename_the_file_impl.dart'
    as _i157;
import '../../../modules/files_mod/features/file_editor/data/remote_source/impls/upload_file_on_server_impl.dart'
    as _i868;
import '../../../modules/files_mod/features/file_editor/data/reposit_impls/copy_and_paste_reposit_impl.dart'
    as _i799;
import '../../../modules/files_mod/features/file_editor/data/reposit_impls/delete_the_file_reposit_impl.dart'
    as _i664;
import '../../../modules/files_mod/features/file_editor/data/reposit_impls/rename_the_file_reposit_impl.dart'
    as _i728;
import '../../../modules/files_mod/features/file_editor/data/reposit_impls/upload_a_file_reposit_impl.dart'
    as _i546;
import '../../../modules/files_mod/features/file_editor/data/reposit_impls/user_download_the_file_reposit_impl.dart'
    as _i104;
import '../../../modules/files_mod/features/file_editor/domain/reposit_absts/copy_and_paste_reposit_abst.dart'
    as _i315;
import '../../../modules/files_mod/features/file_editor/domain/reposit_absts/delete_the_file_reposit_abst.dart'
    as _i349;
import '../../../modules/files_mod/features/file_editor/domain/reposit_absts/rename_the_file_reposit_abst.dart'
    as _i286;
import '../../../modules/files_mod/features/file_editor/domain/reposit_absts/upload_a_file_reposit_abst.dart'
    as _i1018;
import '../../../modules/files_mod/features/file_editor/domain/reposit_absts/user_download_the_file_reposit_abst.dart'
    as _i135;
import '../../../modules/files_mod/features/file_editor/domain/usecases/copy_and_paste_usecase.dart'
    as _i167;
import '../../../modules/files_mod/features/file_editor/domain/usecases/delete_the_file_usecase.dart'
    as _i62;
import '../../../modules/files_mod/features/file_editor/domain/usecases/user_dowload_a_file_usecase.dart'
    as _i28;
import '../../../modules/files_mod/features/file_editor/domain/usecases/user_rename_the_file_usecase.dart'
    as _i834;
import '../../../modules/files_mod/features/file_editor/domain/usecases/user_upload_the_file_usecase.dart'
    as _i828;
import '../../../modules/files_mod/features/file_editor/states_holder/file_editor_bloc/file_editor_bloc.dart'
    as _i73;
import '../../../modules/files_mod/features/view_a_file_details/data/remote_source/absts/view_the_file_details_abst.dart'
    as _i112;
import '../../../modules/files_mod/features/view_a_file_details/data/remote_source/impls/view_the_file_details_impl.dart'
    as _i114;
import '../../../modules/files_mod/features/view_a_file_details/data/reposit_impls/user_view_the_file_details_reposit_impl.dart'
    as _i411;
import '../../../modules/files_mod/features/view_a_file_details/domain/reposit_absts/user_view_the_file_details_reposit_abst.dart'
    as _i1044;
import '../../../modules/files_mod/features/view_a_file_details/domain/usecases/view_the_file_details_usecase.dart'
    as _i983;
import '../../../modules/files_mod/features/view_a_file_details/states_holder/view_the_file_content_bloc/view_the_file_details_bloc.dart'
    as _i279;
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
import '../../../shared/features/fetch_user_credentials/data/local_source/absts/fetch_the_user_credential_abst.dart'
    as _i760;
import '../../../shared/features/fetch_user_credentials/data/local_source/impls/fetch_the_user_credential_impl.dart'
    as _i1035;

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
    gh.lazySingleton<_i760.FetchTheUserCredentialAbst>(
        () => _i1035.FetchTheUserCredentialImpl());
    gh.lazySingleton<_i814.RenameTheFileAbst>(() => _i157.RenameTheFileImpl());
    gh.lazySingleton<_i419.FetchUserCredentialAbst>(
        () => _i629.FetchUserCredentialImpl());
    gh.lazySingleton<_i113.DeleteTheFileAbst>(() => _i279.DeleteTheFileImpl());
    gh.lazySingleton<_i112.ViewTheFileDetailsAbst>(
        () => _i114.ViewTheFileDetailsImpl());
    gh.lazySingleton<_i927.FetchHosterFromRenterForConfigAbst>(
        () => _i208.FetchHosterFromRenterForConfigImpl());
    gh.lazySingleton<_i1048.FetchHosterFromRenterAbst>(
        () => _i429.FetchHosterFromRenterImpl());
    gh.lazySingleton<_i238.SaveTheFileDownloadedAbst>(
        () => _i109.SaveTheFileDownloadedImpl());
    gh.lazySingleton<_i83.FetchConsensusFromRenterAbst>(
        () => _i334.FetchConsensusFromRenterImpl());
    gh.lazySingleton<_i1006.PickTheFileFromPhoneAbst>(
        () => _i259.PickTheFileFromPhoneImpl());
    gh.lazySingleton<_i159.FetchAllHostDataAbst>(
        () => _i850.FetchAllHostDataImpl());
    gh.lazySingleton<_i371.UpdateTheHosterWithNewDataAbst>(
        () => _i812.UpdateTheHosterWithNewDataImpl());
    gh.lazySingleton<_i582.FetchTheHostDataFromRenterForConfigRepositAbst>(() =>
        _i737.FetchTheHostDataFromRenterForConfigRepositImpl(
          fetchTheUserCredentialAbst: gh<_i760.FetchTheUserCredentialAbst>(),
          fetchHosterFromRenterAbst: gh<_i1048.FetchHosterFromRenterAbst>(),
        ));
    gh.lazySingleton<_i56.FetchAllCurrentsHostPresentAbst>(
        () => _i67.FetchAllCurrentsHostPresentImpl());
    gh.lazySingleton<_i744.FetchAllBucketsAbst>(
        () => _i875.FetchAllBucketsImpl());
    gh.lazySingleton<_i605.SecureTheUserCredentialAbst>(
        () => _i610.SecureTheUserCredentialImpl());
    gh.lazySingleton<_i329.UserVerifyHisDataAbst>(
        () => _i855.UserVerifyHisDataImpl());
    gh.lazySingleton<_i11.CacheTheUserCredentialAfterLoginAbst>(
        () => _i41.CacheTheUserCredentialsAfterLoginImpl());
    gh.lazySingleton<_i600.FetchFilesFromBucketAbst>(
        () => _i652.FetchFilesFromBucketImpl());
    gh.lazySingleton<_i269.UserMakeHisLoginAbst>(
        () => _i624.UserMakeHisLoginImpl());
    gh.lazySingleton<_i866.UploadFileOnServerAbst>(
        () => _i868.UploadFileOnServerImpl());
    gh.lazySingleton<_i17.FetchActiveContractCountAbst>(
        () => _i603.FetchActiveContractCountImpl());
    gh.lazySingleton<_i755.DownloadTheFileAbst>(
        () => _i998.DownloadTheFileImpl());
    gh.lazySingleton<_i247.CopyTheFileAbst>(() => _i405.CopyTheFileImpl());
    gh.lazySingleton<_i1044.UserViewTheFileDetailsRepositAbst>(() =>
        _i411.UserViewTheFileDetailsRepositImpl(
            viewTheFileDetailsAbst: gh<_i112.ViewTheFileDetailsAbst>()));
    gh.lazySingleton<_i1027.FetchOneHostDataRepositAbst>(
        () => _i191.FetchOneHostDataRepositImpl(
              fetchAllExistantHostsAbst: gh<_i639.FetchAllExistantHostsAbst>(),
              fetchTheHostAddressCountryAbst:
                  gh<_i106.FetchTheHostAddressCountryAbst>(),
            ));
    gh.lazySingleton<_i135.UserDownloadTheFileRepositAbst>(
        () => _i104.UserDownloadTheFileRepositImpl(
              downloadTheFileAbst: gh<_i755.DownloadTheFileAbst>(),
              saveTheFileDownloadedAbst: gh<_i238.SaveTheFileDownloadedAbst>(),
            ));
    gh.lazySingleton<_i743.FetchMyHostDataFromRenterRepositAbst>(() =>
        _i502.FetchMyHostDataFromRenterRepositImpl(
          fetchTheUserCredentialAbst: gh<_i760.FetchTheUserCredentialAbst>(),
          fetchHosterFromRenterAbst: gh<_i1048.FetchHosterFromRenterAbst>(),
          fetchConsensusFromRenterAbst: gh<_i83.FetchConsensusFromRenterAbst>(),
        ));
    gh.lazySingleton<_i282.UserMakeTheLoginRepositAbst>(() =>
        _i403.UserMakeTheLoginRepositImpl(
          userVerifyHisDataAbst: gh<_i329.UserVerifyHisDataAbst>(),
          userMakeHisLoginAbst: gh<_i269.UserMakeHisLoginAbst>(),
          secureTheUserCredentialAbst: gh<_i605.SecureTheUserCredentialAbst>(),
          cacheTheUserCredentialAfterLoginAbst:
              gh<_i11.CacheTheUserCredentialAfterLoginAbst>(),
        ));
    gh.lazySingleton<_i145.FetchOneHostInfoDataUsecase>(() =>
        _i145.FetchOneHostInfoDataUsecase(
            fetchOneHostDataRepositAbst:
                gh<_i1027.FetchOneHostDataRepositAbst>()));
    gh.lazySingleton<_i383.FetchTheHosterForConfigUsecase>(() =>
        _i383.FetchTheHosterForConfigUsecase(
            fetchTheHostDataFromRenterForConfigRepositAbst:
                gh<_i582.FetchTheHostDataFromRenterForConfigRepositAbst>()));
    gh.lazySingleton<_i286.RenameTheFileRepositAbst>(() =>
        _i728.RenameTheFileRepositImpl(
            renameTheFileAbst: gh<_i814.RenameTheFileAbst>()));
    gh.lazySingleton<_i315.CopyAndPasteRepositAbst>(() =>
        _i799.CopyAndPasteRepositImpl(
            copyTheFileAbst: gh<_i247.CopyTheFileAbst>()));
    gh.lazySingleton<_i1073.FetchUserCredentialRepositAbst>(() =>
        _i619.FetchUserCredentialRepositImpl(
            fetchUserCredentialAbst: gh<_i419.FetchUserCredentialAbst>()));
    gh.factory<_i660.FetchTheHosterForConfigBloc>(() =>
        _i660.FetchTheHosterForConfigBloc(
            fetchTheHosterForConfigUsecase:
                gh<_i383.FetchTheHosterForConfigUsecase>()));
    gh.lazySingleton<_i349.DeleteTheFileRepositAbst>(() =>
        _i664.DeleteTheFileRepositImpl(
            deleteTheFileAbst: gh<_i113.DeleteTheFileAbst>()));
    gh.lazySingleton<_i62.DeleteTheFileUsecase>(() => _i62.DeleteTheFileUsecase(
        deleteTheFileRepositAbst: gh<_i349.DeleteTheFileRepositAbst>()));
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
    gh.lazySingleton<_i28.UserDowloadAFileUsecase>(() =>
        _i28.UserDowloadAFileUsecase(
            userDownloadTheFileRepositAbst:
                gh<_i135.UserDownloadTheFileRepositAbst>()));
    gh.lazySingleton<_i1018.UploadAFileRepositAbst>(
        () => _i546.UploadAFileRepositImpl(
              uploadFileOnServerAbst: gh<_i866.UploadFileOnServerAbst>(),
              pickTheFileFromPhoneAbst: gh<_i1006.PickTheFileFromPhoneAbst>(),
            ));
    gh.lazySingleton<_i605.FetchUserCredentialUsecase>(() =>
        _i605.FetchUserCredentialUsecase(
            fetchUserCredentialRepositAbst:
                gh<_i1073.FetchUserCredentialRepositAbst>()));
    gh.lazySingleton<_i87.FetchAllBucketsAndFilesRepositAbst>(() =>
        _i198.FetchAllBucketsAndFilesRepositImpl(
          fetchTheUserCredentialAbst: gh<_i760.FetchTheUserCredentialAbst>(),
          fetchAllBucketsAbst: gh<_i744.FetchAllBucketsAbst>(),
          fetchFilesFromBucketAbst: gh<_i600.FetchFilesFromBucketAbst>(),
        ));
    gh.factory<_i826.FetchUserCredentialBloc>(() =>
        _i826.FetchUserCredentialBloc(
            fetchUserCredentialUsecase:
                gh<_i605.FetchUserCredentialUsecase>()));
    gh.factory<_i73.FetchOneHostDataAndShowItBloc>(() =>
        _i73.FetchOneHostDataAndShowItBloc(
            fetchOneHostInfoDataUsecase:
                gh<_i145.FetchOneHostInfoDataUsecase>()));
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
    gh.lazySingleton<_i983.ViewTheFileDetailsUsecase>(() =>
        _i983.ViewTheFileDetailsUsecase(
            userViewTheFileDetailsRepositAbst:
                gh<_i1044.UserViewTheFileDetailsRepositAbst>()));
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
    gh.lazySingleton<_i834.UserRenameTheFileUsecase>(() =>
        _i834.UserRenameTheFileUsecase(
            renameTheFileRepositAbst: gh<_i286.RenameTheFileRepositAbst>()));
    gh.lazySingleton<_i167.CopyAndPasteUsecase>(() => _i167.CopyAndPasteUsecase(
        copyAndPasteRepositAbst: gh<_i315.CopyAndPasteRepositAbst>()));
    gh.lazySingleton<_i828.UserUploadTheFileUsecase>(() =>
        _i828.UserUploadTheFileUsecase(
            uploadAFileRepositAbst: gh<_i1018.UploadAFileRepositAbst>()));
    gh.lazySingleton<_i395.ReconfigTheHostUsecase>(() =>
        _i395.ReconfigTheHostUsecase(
            updateTheHosterWithNewDataRepositAbst:
                gh<_i163.UpdateTheHosterWithNewDataRepositAbst>()));
    gh.factory<_i73.FileEditorBloc>(() => _i73.FileEditorBloc(
          userUploadTheFileUsecase: gh<_i828.UserUploadTheFileUsecase>(),
          userDowloadAFileUsecase: gh<_i28.UserDowloadAFileUsecase>(),
          deleteTheFileUsecase: gh<_i62.DeleteTheFileUsecase>(),
          copyAndPasteUsecase: gh<_i167.CopyAndPasteUsecase>(),
          userRenameTheFileUsecase: gh<_i834.UserRenameTheFileUsecase>(),
        ));
    gh.lazySingleton<_i830.FetchFilesFromFolderUsecase>(() =>
        _i830.FetchFilesFromFolderUsecase(
            fetchAllBucketsAndFilesRepositAbst:
                gh<_i87.FetchAllBucketsAndFilesRepositAbst>()));
    gh.lazySingleton<_i529.FetchFilesFromBucketUsecase>(() =>
        _i529.FetchFilesFromBucketUsecase(
            fetchAllBucketsAndFilesRepositAbst:
                gh<_i87.FetchAllBucketsAndFilesRepositAbst>()));
    gh.lazySingleton<_i413.FetchAllBucketsUsecase>(() =>
        _i413.FetchAllBucketsUsecase(
            fetchAllBucketsAndFilesRepositAbst:
                gh<_i87.FetchAllBucketsAndFilesRepositAbst>()));
    gh.factory<_i318.NetworkDataFetchingBloc>(() =>
        _i318.NetworkDataFetchingBloc(
            userFetchTheNetworkDataUsecase:
                gh<_i595.UserFetchTheNetworkDataUsecase>()));
    gh.factory<_i279.ViewTheFileDetailsBloc>(() => _i279.ViewTheFileDetailsBloc(
        viewTheFileDetailsUsecase: gh<_i983.ViewTheFileDetailsUsecase>()));
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
    gh.factory<_i385.FetchAllFilesBloc>(() => _i385.FetchAllFilesBloc(
          fetchFilesFromBucketUsecase: gh<_i529.FetchFilesFromBucketUsecase>(),
          fetchFilesFromFolderUsecase: gh<_i830.FetchFilesFromFolderUsecase>(),
        ));
    gh.factory<_i891.FetchAllBucketBloc>(() => _i891.FetchAllBucketBloc(
        fetchAllBucketsUsecase: gh<_i413.FetchAllBucketsUsecase>()));
    return this;
  }
}
