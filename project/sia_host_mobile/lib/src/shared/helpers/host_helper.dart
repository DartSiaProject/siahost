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

    if (hostData.containsKey('checks') &&
        (hostData['checks'] as Map).containsKey('autopilot') &&
        (hostData['checks']['autopilot'] as Map).containsKey('score')) {
      final scores =
          hostData['checks']['autopilot']['score'] as Map<String, dynamic>;

      finalScore += (scores['age'] as num) * _weightAge;
      finalScore += (scores['collateral'] as num) * _weightCollateral;
      finalScore += (scores['interactions'] as num) * _weightInteractions;
      finalScore +=
          (scores['storageRemaining'] as num) * _weightStorageRemaining;
      finalScore += (scores['uptime'] as num) * _weightUptime;
      finalScore += (scores['version'] as num) * _weightVersion;
      finalScore += (scores['prices'] as num) * _weightPrices;
    }

    return finalScore;
  }

  /// Convert storage
  ///
  static double convertStorage(num storage) => storage / 1e12;

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
  static String formatPricing(num amount) {
    // return amount.toStringAsExponential(1);
    final formattedValue = NumberFormat.decimalPatternDigits(
      decimalDigits: 2,
    ).format(
      amount,
    );

    return formattedValue;
  }

  /// 💰 Convert pricing Hastings To SC
  ///
  static num convertPricing(
    String amount, {
    double divideBy = 1e12,
  }) {
    return BigInt.parse(amount).toDouble() / divideBy;
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
    return (total - remaining) / 1e12;
  }
}
