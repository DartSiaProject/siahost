import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/host_list/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';
import 'package:sia_host_mobile/src/shared/services/api_client.dart';

@LazySingleton()
class HostListRepository {
  // HostListRepository(this._storage);

  // final StorageService _storage;

  // Future<List<HostInfoModel>> getHostList() async {
  //   final userInfo = _storage.currentUserDecrypted!;

  //   try {
  //     // Get the host list from renterd
  //     final result = await Hoster.getHosts(
  //       serverAddress: userInfo.serverAddress,
  //       key: userInfo.key,
  //       iv: userInfo.iv,
  //     );

  //     if (result['status'] == true && result.containsKey('response')) {
  //       final response =
  //           (result['response'] as Response<dynamic>).data as String;
  //       final data = json.decode(response) as Map<String, dynamic>;

  //       // decode the network list
  //       final dataList = json.decode(
  //         DataDecrypter.decryptStringWithAES256CBC(
  //           chipherText: data['data'] as String,
  //           key: userInfo.key,
  //           iv: userInfo.iv,
  //         ),
  //       ) as List;

  //       final listWithInfo = await Future.wait(
  //         dataList.map(
  //           (host) => _hostDetails(
  //             host['publicKey'] as String,
  //             serverAddress: userInfo.serverAddress,
  //             key: userInfo.key,
  //             iv: userInfo.iv,
  //           ),
  //         ),
  //       );

  //       // Filter the hosts that are gouging
  //       // and map them to HostInfoModel
  //       // final hosts = HostHelper.filterActiveHosts(dataList).map((e) {
  //       final hosts = listWithInfo.whereType<Map<String, dynamic>>().map((e) {
  //         final map = e;
  //         final settings = map['settings'] as Map<String, dynamic>;

  //         return HostInfoModel(
  //           publicKey: map['publicKey'] as String,
  //           finalScore: HostHelper.getFinalScore(map),
  //           netAddress: map['netAddress'] as String,
  //           addressLocation: '',
  //           uploadPrice: HostHelper.convertPricing(
  //             settings['uploadbandwidthprice'] as String,
  //           ).toDouble(),
  //           downloadPrice: HostHelper.convertPricing(
  //             settings['downloadbandwidthprice'] as String,
  //           ).toDouble(),
  //           storagePrice: HostHelper.convertPricing(
  //             settings['storageprice'] as String,
  //           ).toDouble(),
  //           acceptingContracts: settings['acceptingcontracts'] as bool,
  //           totalStorage: HostHelper.convertStorage(
  //             settings['totalstorage'] as num,
  //           ),
  //           remainingStorage: HostHelper.convertStorage(
  //             settings['remainingstorage'] as num,
  //           ),
  //           usedStorage: HostHelper.calculateUsedStorage(
  //             settings['totalstorage'] as num,
  //             settings['remainingstorage'] as num,
  //           ),
  //         );
  //       }).toList();

  //       return hosts;
  //     } else {
  //       throw DartSiaException.handleError(result['error']);
  //     }
  //   } catch (e) {
  //     throw DartSiaException.handleError(e);
  //   }
  // }

  // Future<Map<String, dynamic>?> _hostDetails(
  //   String publicKey, {
  //   required String serverAddress,
  //   required String key,
  //   required String iv,
  // }) async {
  //   try {
  //     // Get the host list from renterd
  //     final result = await Hoster.getHostInfoByPublicKey(
  //       serverAddress: serverAddress,
  //       key: key,
  //       iv: iv,
  //       publicKey: publicKey,
  //     );

  //     if (result['status'] == true && result.containsKey('response')) {
  //       final response =
  //           (result['response'] as Response<dynamic>).data as String;
  //       final data = json.decode(response) as Map<String, dynamic>;

  //       // decode the network list
  //       final decoded = DataDecrypter.decryptStringWithAES256CBC(
  //         chipherText: data['data'] as String,
  //         key: key,
  //         iv: iv,
  //       );
  //       return json.decode(decoded) as Map<String, dynamic>;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     log('Error fetching host details: $e');
  //     return null;
  //   }
  // }

  HostListRepository(this._apiClient);

  final ApiClient _apiClient;

  Future<(List<HostInfoModel>, bool)> getHostList({int page = 0}) async {
    const limit = 10;
    final offset = page * limit;
    final hostUrl =
        'https://api.hostscore.info/v1/hosts?network=mainnet&all=false&sort=rank&order=asc&offset=$offset&limit=$limit';

    try {
      // Get the host list from renterd
      final result = await _apiClient.get(hostUrl);
      final resData = result.data as Map;
      final hostMapped = resData['hosts'] as List? ?? [];

      // Filter the hosts that are gouging
      // and map them to HostInfoModel
      final hosts = hostMapped
          .whereType<Map<String, dynamic>>()
          .map((e) => e['v2'] as bool == true ? e : null)
          .map(_mapToValue)
          .whereType<HostInfoModel>()
          .toList();

      return (hosts, resData['more'] as bool);
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }

  Future<HostInfoModel?> getHost({required String publicKey}) async {
    final hostUrl =
        'https://api.hostscore.info/v1/host?network=mainnet&host=$publicKey';

    try {
      final result = await _apiClient.get(hostUrl);
      final hostMapped = (result.data as Map)['host'];

      return _mapToValue(hostMapped as Map<String, dynamic>);
    } catch (e) {
      throw DartSiaException.handleError(e);
    }
  }

  /// convert a map from api response to a HostInfoModel
  ///
  HostInfoModel? _mapToValue(
    Map<String, dynamic>? map,
  ) {
    if (map == null) return null;

    final settings = map['v2Settings'] as Map<String, dynamic>?;
    if (settings == null || !settings.containsKey('prices')) {
      return null;
    }

    final prices = settings['prices'] as Map<String, dynamic>;

    return HostInfoModel(
      publicKey: map['publicKey'] as String,
      finalScore: HostHelper.getFinalScore(map),
      netAddress: map['netaddress'] as String,
      addressLocation: '',
      uploadPrice: HostHelper.convertPricing(
        prices['ingressPrice'] as String,
      ).toDouble(),
      downloadPrice: HostHelper.convertPricing(
        prices['egressPrice'] as String,
      ).toDouble(),
      storagePrice: HostHelper.convertPricing(
        prices['storagePrice'] as String,
        perBlock: true,
      ).toDouble(),
      acceptingContracts: settings['acceptingContracts'] as bool,
      totalStorage: HostHelper.convertStorage(
        settings['totalStorage'] as num,
      ),
      remainingStorage: HostHelper.convertStorage(
        settings['remainingStorage'] as num,
      ),
      usedStorage: HostHelper.calculateUsedStorage(
        settings['totalStorage'] as num,
        settings['remainingStorage'] as num,
      ),
    );
  }
}
