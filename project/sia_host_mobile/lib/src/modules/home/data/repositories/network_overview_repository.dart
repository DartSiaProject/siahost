import 'package:injectable/injectable.dart';
import 'package:sia_host_mobile/src/modules/home/data/models/models.dart';
import 'package:sia_host_mobile/src/shared/exceptions/exceptions.dart';
import 'package:sia_host_mobile/src/shared/helpers/host_helper.dart';
import 'package:sia_host_mobile/src/shared/services/api_client.dart';
import 'package:sia_host_mobile/src/shared/utils/utils.dart';

@LazySingleton()
class NetworkOverviewRepository {
  NetworkOverviewRepository(this._apiClient);

  // final StorageService _storage;
  final ApiClient _apiClient;

  /// Get all host and establish the statistic
  /// of the actual network
  ///
  Future<NetworkOverviewData> getData() async {
    const overviewUrl =
        'https://api.hostscore.info/v1/network/averages?network=mainnet';
    const hostCountUrl =
        'https://api.hostscore.info/v1/network/hosts?network=mainnet';
    const siaPriceUrl =
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=SC&convert=USD';

    try {
      final result = await Future.wait([
        _apiClient.get(overviewUrl),
        _apiClient.get(hostCountUrl),
        _apiClient.get(
          siaPriceUrl,
          headers: {
            'X-$coinMarketCapApiVar': coinMarketCapApiKey,
          },
        ),
      ]);

      final overviewRes = (result[0].data as Map<String, dynamic>)['averages'];
      final hostRes = (result[1].data as Map<String, dynamic>)['hosts'];
      final siaPriceRes = (result[2].data as Map<String, dynamic>)['data']['SC']
          as Map<String, dynamic>;

      // Check if the Sia price is available
      SiaUsdQuote? siaUsdQuote;

      if (siaPriceRes['quote'] == null ||
          siaPriceRes['quote']['USD'] == null ||
          siaPriceRes['quote']['USD']['price'] == null) {
        siaUsdQuote = null;
      } else {
        siaUsdQuote = SiaUsdQuote.fromJson(
          siaPriceRes['quote']['USD'] as Map<String, dynamic>,
        );
      }

      final tier1 = (overviewRes as Map)['tier1'] as Map<String, dynamic>;
      final tier2 = overviewRes['tier2'] as Map<String, dynamic>;
      // final tier = (overviewRes as Map)['tier2'] as Map<String, dynamic>;

      // prices
      // final storagePrice = int.parse(tier1['storagePrice'] as String) +
      //     int.parse(tier2['storagePrice'] as String);

      // final collateral = int.parse(tier1['collateral'] as String) +
      //     int.parse(tier2['collateral'] as String);

      // final uploadPrice = int.parse(tier1['uploadPrice'] as String) +
      //     int.parse(tier2['uploadPrice'] as String);

      // final downloadPrice = int.parse(tier1['downloadPrice'] as String) +
      //     int.parse(tier2['downloadPrice'] as String);
      final storagePrice = int.parse(tier1['storagePrice'] as String) +
          int.parse(tier2['storagePrice'] as String);

      final collateral = int.parse(tier1['collateral'] as String) +
          int.parse(tier2['collateral'] as String);

      final uploadPrice = int.parse(tier1['uploadPrice'] as String) +
          int.parse(tier2['uploadPrice'] as String);

      final downloadPrice = int.parse(tier1['downloadPrice'] as String) +
          int.parse(tier2['downloadPrice'] as String);

      // each price calculation
      return NetworkOverviewData(
        hostCount: (hostRes as Map<String, dynamic>)['online'] as int,
        allHostCount: (hostRes['total'] as int?) ?? 0,
        storagePrice: HostHelper.convertPricing(
          storagePrice / 2,
          perBlock: true,
        ),
        collateral: HostHelper.convertPricing(
          collateral / 2,
          perBlock: true,
        ),
        uploadPrice: HostHelper.convertPricing(
          uploadPrice / 2,
        ),
        downloadPrice: HostHelper.convertPricing(
          downloadPrice / 2,
        ),
        siaUsdQuote: siaUsdQuote,
      );
    } catch (e) {
      throw DartSiaException.handleError(e);
    }

    // final userInfo = _storage.currentUserDecrypted!;

    // try {
    //   // Get the host list from renterd
    //   final result = await Hoster.getHosts(
    //     serverAddress: userInfo.serverAddress,
    //     key: userInfo.key,
    //     iv: userInfo.iv,
    //   );

    //   if (result['status'] == true && result.containsKey('response')) {
    //     final response =
    //         (result['response'] as Response<dynamic>).data as String;
    //     final data = json.decode(response) as Map<String, dynamic>;

    //     // decode the network list
    //     final dataList = json.decode(
    //       DataDecrypter.decryptStringWithAES256CBC(
    //         chipherText: data['data'] as String,
    //         key: userInfo.key,
    //         iv: userInfo.iv,
    //       ),
    //     );

    //     // detailled list of hosts
    //     final listWithInfo = await Future.wait(
    //       (dataList as List<dynamic>).map(
    //         (host) => _hostDetails(
    //           host['publicKey'] as String,
    //           serverAddress: userInfo.serverAddress,
    //           key: userInfo.key,
    //           iv: userInfo.iv,
    //         ),
    //       ),
    //     );

    //     // Return the network data overview
    //     return _calculateResult(
    //       listWithInfo.whereType<Map<String, dynamic>>().toList(),
    //     );
    //   } else {
    //     throw DartSiaException.handleError(result['error']);
    //   }
    // } catch (e) {
    //   throw DartSiaException.handleError(e);
    // }
  }

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

  /// Make all operations
  /// to get the detailled overview of the network
  ///
  // NetworkDataModel _calculateResult(List<dynamic> dataList) {
  //   // final activeHosts = HostHelper.filterActiveHosts(dataList);
  //   final activeHosts = dataList;

  //   // 1. Count hosts
  //   final hostCount = activeHosts.length;

  //   // 2. Total storage (TB)
  //   final totalStorage = activeHosts
  //       .map((h) => h['settings']['totalstorage'] as int)
  //       .fold(0, (a, b) => a + b);

  //   final totalTB = totalStorage / 1e12;

  //   // 3. Used storage (TB)
  //   final usedStorage = activeHosts
  //       .map(
  //         (h) =>
  //             (h['settings']['totalstorage'] as int) -
  //             (h['settings']['remainingstorage'] as int),
  //       )
  //       .fold(0, (a, b) => a + b);

  //   final usedTB = usedStorage / 1e12;

  //   // 4. Avg storage price (SC/TB/month)
  //   final prices = activeHosts
  //       .map(
  //         (h) =>
  //             BigInt.parse(
  //               h['settings']['storageprice'] as String,
  //             ).toDouble() /
  //             1e12,
  //       )
  //       .toList();

  //   final avgPrice = prices.isNotEmpty
  //       ? prices.reduce((a, b) => a + b) / prices.length
  //       : 0.0;

  //   return NetworkDataModel(
  //     totalCurrentHosts: hostCount,
  //     totalNetworkStorage: totalTB,
  //     totalUsedStorage: usedTB,
  //     pricePerTb: avgPrice,
  //     activeContractCount: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  //   );
  // }
}
