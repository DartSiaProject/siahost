import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sia_host_mobile/src/core/l10n/l10n.dart';

class NetworkDataModel extends Equatable {
  const NetworkDataModel({
    this.totalCurrentHosts = 0,
    this.totalNetworkStorage = 0.0,
    this.totalUsedStorage = 0.0,
    this.pricePerTb = 0.0,
    this.activeContractCount = const <int>[],
  });

  final int totalCurrentHosts;
  final double totalNetworkStorage;
  final double totalUsedStorage;
  final double pricePerTb;
  final List<int> activeContractCount;

  NetworkDataModel copyWith({
    int? totalCurrentHosts,
    double? totalNetworkStorage,
    double? totalUsedStorage,
    double? pricePerTb,
    List<int>? activeContractCount,
  }) {
    return NetworkDataModel(
      totalCurrentHosts: totalCurrentHosts ?? this.totalCurrentHosts,
      totalNetworkStorage: totalNetworkStorage ?? this.totalNetworkStorage,
      totalUsedStorage: totalUsedStorage ?? this.totalUsedStorage,
      pricePerTb: pricePerTb ?? this.pricePerTb,
      activeContractCount: activeContractCount ?? this.activeContractCount,
    );
  }

  @override
  List<Object> get props {
    return [
      totalCurrentHosts,
      totalNetworkStorage,
      totalUsedStorage,
      pricePerTb,
      activeContractCount,
    ];
  }
}

extension NetworkDataX on NetworkDataModel {
  String networkStorageFormatted(BuildContext context) {
    var translation = context.l10n.teraByte;
    var realData = totalNetworkStorage;

    if (totalNetworkStorage >= 1000.0) {
      realData = totalNetworkStorage / 1000;
      translation = context.l10n.petaByte;
    }
    final formattedValue = NumberFormat.decimalPatternDigits(
      decimalDigits: 2,
    ).format(
      realData,
    );

    return '$formattedValue $translation';
  }

  String usedStorageFormatted(BuildContext context) {
    var translation = context.l10n.teraByte;
    var realData = totalUsedStorage;

    if (totalUsedStorage >= 1000.0) {
      realData = totalUsedStorage / 1000;
      translation = context.l10n.petaByte;
    }
    final formattedValue = NumberFormat.decimalPatternDigits(
      decimalDigits: 2,
    ).format(
      realData,
    );

    return '$formattedValue $translation';
  }

  String pricePerTBFormatted(BuildContext context) {
    final formattedValue = NumberFormat.simpleCurrency(
      name: r'$ ',
      decimalDigits: 3,
    ).format(
      pricePerTb,
    );

    return formattedValue;
  }
}
