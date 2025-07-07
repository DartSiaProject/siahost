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

  // NetworkDataModel copyWith({
  //   int? totalCurrentHosts,
  //   double? totalNetworkStorage,
  //   double? totalUsedStorage,
  //   double? pricePerTb,
  //   List<int>? activeContractCount,
  // }) {
  //   return NetworkDataModel(
  //     totalCurrentHosts: totalCurrentHosts ?? this.totalCurrentHosts,
  //     totalNetworkStorage: totalNetworkStorage ?? this.totalNetworkStorage,
  //     totalUsedStorage: totalUsedStorage ?? this.totalUsedStorage,
  //     pricePerTb: pricePerTb ?? this.pricePerTb,
  //     activeContractCount: activeContractCount ?? this.activeContractCount,
  //   );
  // }

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

class NetworkOverviewData extends Equatable {
  const NetworkOverviewData({
    required this.hostCount,
    required this.allHostCount,
    required this.storagePrice,
    required this.collateral,
    required this.uploadPrice,
    required this.downloadPrice,
    this.siaUsdQuote,
  });

  final int hostCount;
  final int allHostCount;
  final num storagePrice;
  final num collateral;
  final num uploadPrice;
  final num downloadPrice;

  final SiaUsdQuote? siaUsdQuote;

  @override
  List<Object?> get props {
    return [
      hostCount,
      allHostCount,
      storagePrice,
      collateral,
      uploadPrice,
      downloadPrice,
      siaUsdQuote,
    ];
  }
}

// This model is used to represent the quote data for Sia USD.
//
// "price": 0.003290123030139198,
// "volume_24h": 7331870.19859608,
// "volume_change_24h": -3.0121,
// "percent_change_1h": 0.25882613,
// "percent_change_24h": -3.9146223,
// "percent_change_7d": -0.01893911,
// "percent_change_30d": -9.41167673,
// "percent_change_60d": 8.30479118,
// "percent_change_90d": 2.80749696,
// "market_cap": 184331236.99948734,
// "market_cap_dominance": 0.0055,
// "fully_diluted_market_cap": 199557199.77,
// "tvl": null,
// "last_updated": "2025-06-12T14:08:00.000Z"
class SiaUsdQuote extends Equatable {
  const SiaUsdQuote({
    required this.price,
    this.volume24h,
    this.volumeChange24h,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.percentChange30d,
    this.percentChange60d,
    this.percentChange90d,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.tvl,
    this.lastUpdated,
  });

  // fromJson(Map<String, dynamic> json)
  SiaUsdQuote.fromJson(Map<String, dynamic> json)
      : price = json['price'] as num,
        volume24h = json['volume_24h'] as num?,
        volumeChange24h = json['volume_change_24h'] as num?,
        percentChange1h = json['percent_change_1h'] as num?,
        percentChange24h = json['percent_change_24h'] as num?,
        percentChange7d = json['percent_change_7d'] as num?,
        percentChange30d = json['percent_change_30d'] as num?,
        percentChange60d = json['percent_change_60d'] as num?,
        percentChange90d = json['percent_change_90d'] as num?,
        marketCap = json['market_cap'] as num?,
        marketCapDominance = json['market_cap_dominance'] as num?,
        fullyDilutedMarketCap = json['fully_diluted_market_cap'] as num?,
        tvl = json['tvl'] as num?,
        lastUpdated = DateTime.tryParse(json['last_updated'] as String? ?? '');

  final num price;
  final num? volume24h;
  final num? volumeChange24h;
  final num? percentChange1h;
  final num? percentChange24h;
  final num? percentChange7d;
  final num? percentChange30d;
  final num? percentChange60d;
  final num? percentChange90d;
  final num? marketCap;
  final num? marketCapDominance;
  final num? fullyDilutedMarketCap;
  final num? tvl;
  final DateTime? lastUpdated;

  @override
  List<Object?> get props => [
        price,
        volume24h,
        volumeChange24h,
        percentChange1h,
        percentChange24h,
        percentChange7d,
        percentChange30d,
        percentChange60d,
        percentChange90d,
        marketCap,
        marketCapDominance,
        fullyDilutedMarketCap,
        tvl,
        lastUpdated,
      ];
}

extension NetworkOverviewDataX on NetworkOverviewData {
  double? get storagePriceUSD => siaUsdQuote == null
      ? null
      : (storagePrice * siaUsdQuote!.price).toDouble();
  double? get collateralUSD =>
      siaUsdQuote == null ? null : (collateral * siaUsdQuote!.price).toDouble();
  double? get uploadPriceUSD => siaUsdQuote == null
      ? null
      : (uploadPrice * siaUsdQuote!.price).toDouble();
  double? get downloadPriceUSD => siaUsdQuote == null
      ? null
      : (downloadPrice * siaUsdQuote!.price).toDouble();
}
