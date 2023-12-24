import 'package:equatable/equatable.dart';

class Network extends Equatable {
  final int blockHeight;
  final int blockTimestamp;
  final int hashrate;
  final int difficulty;
  final int coinSupply;
  final double coinPriceUSD;
  final int marketCapUSD;
  final int usedStorageTB;
  final double networkCapacityTB;
  final int onlineHosts;
  final int countriesWithHosts;
  final int activeContracts;
  final int storageProofCount;
  final int skynetFiles;
  final double skynetSize;
  final int skynetPortalsNumber;
  final double pricePerTbSc;
  final double pricePerTbUsd;
  final int revenue30d;
  final int revenue30dChange;

  const Network({
    this.blockHeight = 0,
    this.blockTimestamp = 0,
    this.hashrate = 0,
    this.difficulty = 0,
    this.coinSupply = 0,
    this.coinPriceUSD = 0.0,
    this.marketCapUSD = 0,
    this.usedStorageTB = 0,
    this.networkCapacityTB = 0.0,
    this.onlineHosts = 0,
    this.countriesWithHosts = 0,
    this.activeContracts = 0,
    this.storageProofCount = 0,
    this.skynetFiles = 0,
    this.skynetSize = 0.0,
    this.skynetPortalsNumber = 0,
    this.pricePerTbSc = 0.0,
    this.pricePerTbUsd = 0.0,
    this.revenue30d = 0,
    this.revenue30dChange = 0,
  });

  Network copyWith({
    int? blockHeight,
    int? blockTimestamp,
    int? hashrate,
    int? difficulty,
    int? coinSupply,
    double? coinPriceUSD,
    int? marketCapUSD,
    int? usedStorageTB,
    double? networkCapacityTB,
    int? onlineHosts,
    int? countriesWithHosts,
    int? activeContracts,
    int? storageProofCount,
    int? skynetFiles,
    double? skynetSize,
    int? skynetPortalsNumber,
    double? pricePerTbSc,
    double? pricePerTbUsd,
    int? revenue30d,
    int? revenue30dChange,
  }) {
    return Network(
      blockHeight: blockHeight ?? this.blockHeight,
      blockTimestamp: blockTimestamp ?? this.blockTimestamp,
      hashrate: hashrate ?? this.hashrate,
      difficulty: difficulty ?? this.difficulty,
      coinSupply: coinSupply ?? this.coinSupply,
      coinPriceUSD: coinPriceUSD ?? this.coinPriceUSD,
      marketCapUSD: marketCapUSD ?? this.marketCapUSD,
      usedStorageTB: usedStorageTB ?? this.usedStorageTB,
      networkCapacityTB: networkCapacityTB ?? this.networkCapacityTB,
      onlineHosts: onlineHosts ?? this.onlineHosts,
      countriesWithHosts: countriesWithHosts ?? this.countriesWithHosts,
      activeContracts: activeContracts ?? this.activeContracts,
      storageProofCount: storageProofCount ?? this.storageProofCount,
      skynetFiles: skynetFiles ?? this.skynetFiles,
      skynetSize: skynetSize ?? this.skynetSize,
      skynetPortalsNumber: skynetPortalsNumber ?? this.skynetPortalsNumber,
      pricePerTbSc: pricePerTbSc ?? this.pricePerTbSc,
      pricePerTbUsd: pricePerTbUsd ?? this.pricePerTbUsd,
      revenue30d: revenue30d ?? this.revenue30d,
      revenue30dChange: revenue30dChange ?? this.revenue30dChange,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'block_height': blockHeight,
      'block_timestamp': blockTimestamp,
      'hashrate': hashrate,
      'difficulty': difficulty,
      'coin_supply': coinSupply,
      'coin_price_USD': coinPriceUSD,
      'market_cap_USD': marketCapUSD,
      'used_storage_TB': usedStorageTB,
      'network_capacity_TB': networkCapacityTB,
      'online_hosts': onlineHosts,
      'countries_with_hosts': countriesWithHosts,
      'active_contracts': activeContracts,
      'storage_proof_count': storageProofCount,
      'skynet_files': skynetFiles,
      'skynet_size': skynetSize,
      'skynet_portals_number': skynetPortalsNumber,
      'price_per_tb_sc': pricePerTbSc,
      'price_per_tb_usd': pricePerTbUsd,
      'revenue_30d': revenue30d,
      'revenue_30d_change': revenue30dChange,
    };
  }

  factory Network.fromMap(Map<String, dynamic> map) {
    return Network(
      blockHeight: map['block_height']?.toInt() ?? 0,
      blockTimestamp: map['block_timestamp']?.toInt() ?? 0,
      hashrate: map['hashrate']?.toInt() ?? 0,
      difficulty: map['difficulty']?.toInt() ?? 0,
      coinSupply: map['coin_supply']?.toInt() ?? 0,
      coinPriceUSD: map['coin_price_USD']?.toDouble() ?? 0.0,
      marketCapUSD: map['market_cap_USD']?.toInt() ?? 0,
      usedStorageTB: map['used_storage_TB']?.toInt() ?? 0,
      networkCapacityTB: map['network_capacity_TB']?.toDouble() ?? 0.0,
      onlineHosts: map['online_hosts']?.toInt() ?? 0,
      countriesWithHosts: map['countries_with_hosts']?.toInt() ?? 0,
      activeContracts: map['active_contracts']?.toInt() ?? 0,
      storageProofCount: map['storage_proof_count']?.toInt() ?? 0,
      skynetFiles: map['skynet_files']?.toInt() ?? 0,
      skynetSize: map['skynet_size']?.toDouble() ?? 0.0,
      skynetPortalsNumber: map['skynet_portals_number']?.toInt() ?? 0,
      pricePerTbSc: map['price_per_tb_sc']?.toDouble() ?? 0.0,
      pricePerTbUsd: map['price_per_tb_usd']?.toDouble() ?? 0.0,
      revenue30d: map['revenue_30d']?.toInt() ?? 0,
      revenue30dChange: map['revenue_30d_change']?.toInt() ?? 0,
    );
  }

  @override
  List<Object> get props {
    return [
      blockHeight,
      blockTimestamp,
      hashrate,
      difficulty,
      coinSupply,
      coinPriceUSD,
      marketCapUSD,
      usedStorageTB,
      networkCapacityTB,
      onlineHosts,
      countriesWithHosts,
      activeContracts,
      storageProofCount,
      skynetFiles,
      skynetSize,
      skynetPortalsNumber,
      pricePerTbSc,
      pricePerTbUsd,
      revenue30d,
      revenue30dChange,
    ];
  }
}
