import 'dart:developer';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';

class HostHelper {
  HostHelper._();
  // These weights are used to calculate the final score of a host.
  // They are used to determine the importance of each factor in the final score.
  static const _weightAge = 0.1;
  static const _weightCollateral = 0.15;
  static const _weightInteractions = 0.2;
  static const _weightStorageRemaining = 0.25;
  static const _weightUptime = 0.15;
  static const _weightVersion = 0.05;
  static const _weightPrices = 0.1;

  /// Converts a DNS address to an IP address.
  ///
  static Future<String> convertDnsToIp({required String dnsAddress}) async {
    var ipAddress = '';
    try {
      var newDnsAddress = '';
      var oldDnsAddress = dnsAddress.split(':')[0];
      if (oldDnsAddress.contains('[')) {
        oldDnsAddress = oldDnsAddress.replaceAll('[', '');
        oldDnsAddress = oldDnsAddress.replaceAll(']', '');
        newDnsAddress = oldDnsAddress;
      }
      newDnsAddress = oldDnsAddress;
      final internetAddressValue = await InternetAddress.lookup(newDnsAddress);
      ipAddress = internetAddressValue.first.address;
    } catch (e) {
      log(e.toString());
    }
    return ipAddress;
  }

  /// Calculates the final score of a host based on various parameters.
  ///
  static double getFinalScore(Map<String, dynamic> hostData) {
    var finalScore = 0.0;
    // final settings = hostData['v2Settings'] as Map<String, dynamic>?;

    try {
      // final score = hostData['checks']['score'] as num?;

      // // round the score to 2 decimal places
      // if (score != null) {
      //   finalScore = double.parse(score.toStringAsFixed(2));
      // } else {
      //   finalScore = 0.0;
      // }
      // return finalScore;

      final scores = hostData['score'] as Map<String, dynamic>?;

      if (scores == null) return finalScore;

      finalScore += (scores['age'] as num) * _weightAge;
      finalScore += (scores['collateral'] as num) * _weightCollateral;
      finalScore += (scores['interactions'] as num) * _weightInteractions;
      finalScore += (scores['storage'] as num) * _weightStorageRemaining;
      finalScore += (scores['uptime'] as num) * _weightUptime;
      finalScore += (scores['version'] as num) * _weightVersion;
      finalScore += (scores['prices'] as num) * _weightPrices;

      return finalScore;
    } catch (e) {
      return finalScore;
    }
  }

  /// Convert storage
  ///
  static double convertStorage(num storage) => storage / 1e6; //1e6 in v2

  /// Format storage value
  static String formatStorage(BuildContext context, num storage) {
    var translation = context.l10n.teraByte;
    var realData = storage;

    if (storage >= 1000.0) {
      realData = storage / 1000;
      translation = context.l10n.petaByte;
    }

    final formattedValue = NumberFormat.decimalPatternDigits(
      decimalDigits: 2,
    ).format(
      realData,
    );

    return '$formattedValue $translation';
  }

  /// Format pricing amount
  ///
  static String formatPricing(
    num amount, {
    bool lowerCase = false,
    String suffix = '',
    String prefix = '',
    bool withCurrency = true,
  }) {
    var currency = 'SC';
    var finalAmount = amount;
    var finalPrefix = prefix;
    var finalSuffix = suffix;

    if (amount >= 1e3 && amount < 1e6) {
      currency = 'KS';
      finalAmount /= 1e3;
    } else if (amount >= 1e6 && amount < 1e9) {
      currency = 'MS';
      finalAmount /= 1e6;
    } else if (amount >= 1e9) {
      currency = 'GS';
      finalAmount /= 1e9;
    }

    currency = !withCurrency
        ? ''
        : lowerCase
            ? currency.toLowerCase()
            : currency;
    final formattedValue = NumberFormat.decimalPatternDigits(
      decimalDigits: 2,
    ).format(
      finalAmount,
    );

    finalSuffix = lowerCase ? suffix.toLowerCase() : suffix;
    finalPrefix = lowerCase ? prefix.toLowerCase() : prefix;

    return '$finalPrefix$formattedValue $currency$finalSuffix';
  }

  /// 💰 Convert pricing Hastings To SC
  ///
  static num convertPricing(
    dynamic amount, {
    double divideBy = 1e12,
    bool perBlock = false, // If true, times 144 * 30
  }) {
    assert(amount is String || amount is num, 'Amount should be String or num');

    var finalAmount = 0.0;
    if (amount is num) {
      finalAmount = amount.toDouble();
    } else if (amount is String) {
      finalAmount = BigInt.parse(amount).toDouble();
    }

    finalAmount = perBlock
        ? finalAmount * 144 * 30 // 144 blocks per day, 30 days per month
        : finalAmount;

    return (finalAmount as num).toDouble() / divideBy;
  }

  /// 💰 Revert pricing SC To Hastings
  ///
  static double revertPricingConvertion(
    String amount, {
    double multiplyBy = 1e12,
  }) {
    return num.parse(amount).toDouble() * multiplyBy;
  }

  /// Calculate used storage
  ///
  static double calculateUsedStorage(num total, num remaining) {
    return (total - remaining) / 1e6; // 1e6 for v2
  }

  /// Get active host list mapped
  ///
  static List<dynamic> filterActiveHosts(
    List<dynamic> dataList,
  ) {
    return dataList
        .where((h) {
          try {
            final isOnline =
                h['checks']['autopilot']['usability']['gouging'] as bool?;
            return isOnline ?? false;
          } catch (e) {
            return false;
          }
        })
        .map((e) => e)
        .toList();
  }
}
