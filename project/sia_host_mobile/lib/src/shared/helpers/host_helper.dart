import 'dart:io';
import 'dart:math' as math;

class HostHelper {
  static Future<String> convertDnsToIp({required String dnsAddress}) async {
    var _ipAddress = "";
    try {
      var newDnsAddress = "";
      var oldDnsAddress = dnsAddress.split(":")[0].toString();
      if (oldDnsAddress.contains("[")) {
        oldDnsAddress = oldDnsAddress.replaceAll("[", "");
        oldDnsAddress = oldDnsAddress.replaceAll("]", "");
        newDnsAddress = oldDnsAddress;
      }
      newDnsAddress = oldDnsAddress;
      var internetAddressValue = await InternetAddress.lookup(newDnsAddress);
      _ipAddress = internetAddressValue.first.address;
    } catch (e) {
      print(e);
    }
    return _ipAddress;
  }

  static double getFinalScore(Map<String, dynamic> data) {
    var score = _scoreResult(
      uptime: data['estimated_uptime'],
      uploadPrice: BigInt.parse(data['settings']['upload_price']),
      downloadPrice: BigInt.parse(data['settings']['download_price']),
      storagePrice: BigInt.parse(data['settings']['storage_price']),
      collateral: BigInt.parse(data['settings']['collateral']),
      contractTime: data['benchmark'] == null
          ? 0
          : (data['benchmark']['contract_time'] ?? 0),
      maxUptime: 100.0,
      maxUploadPrice: BigInt.from(1500 * (math.pow(10, 12))),
      maxDownloadPrice: BigInt.from(400 * (math.pow(10, 12))),
      maxStoragePrice: BigInt.from(1000 * (math.pow(10, 12))),
      maxCollateral: BigInt.parse(data['settings']['max_collateral']),
      maxContractTime: 1000,
      uptimeWeight: 0.3,
      transfertWeight: 0.2,
      storageWeight: 0.15,
      collateralWeight: 0.25,
      contractWeight: 0.1,
    );

    if (score > 1 || score == double.infinity) score = 1;

    return 10 * (1 - score);
  }

  static double _scoreResult({
    required num uptime,
    required BigInt uploadPrice,
    required BigInt downloadPrice,
    required BigInt storagePrice,
    required BigInt collateral,
    required num contractTime,

    // max values
    required num maxUptime,
    required BigInt maxUploadPrice,
    required BigInt maxDownloadPrice,
    required BigInt maxStoragePrice,
    required BigInt maxCollateral,
    required num maxContractTime,

    // weights
    required num uptimeWeight,
    required num transfertWeight,
    required num storageWeight,
    required num collateralWeight,
    required num contractWeight,
  }) {
    double normalizedUptime = uptime / maxUptime;
    double normalizedUploadPrice = uploadPrice / maxUploadPrice;
    double normalizedDownloadPrice = downloadPrice / maxDownloadPrice;
    double normalizedStoragePrice = storagePrice / maxStoragePrice;
    double normalizedCollateral = collateral / maxCollateral;
    double normalizedContractTime = contractTime / maxContractTime;

    if (normalizedContractTime > 1) normalizedContractTime = 0;

    final score = (normalizedUptime * uptimeWeight) +
        (normalizedDownloadPrice * transfertWeight / 2) +
        (normalizedUploadPrice * transfertWeight / 2) +
        ((1 - normalizedStoragePrice) * storageWeight) +
        (normalizedCollateral * collateralWeight) +
        (normalizedContractTime * contractWeight);

    // debugPrint(
    //   'Final score: ${score.toStringAsFixed(2)} | normalizedUptime: $normalizedUptime | normalizedUploadPrice: $normalizedUploadPrice | normalizedDownloadPrice: $normalizedDownloadPrice | normalizedStoragePrice: $normalizedStoragePrice | normalizedCollateral: $normalizedCollateral | normalizedContractTime: $normalizedContractTime \n\n',
    // );

    return score;
  }
}
