import 'package:equatable/equatable.dart';

class NetworkDataModel extends Equatable {
  final int totalCurrentHosts;
  final double totalNetworkStorage;
  final double totalUsedStorage;
  final double pricePerTb;
  final List<int> activeContractCount;

  const NetworkDataModel({
    this.totalCurrentHosts = 0,
    this.totalNetworkStorage = 0.0,
    this.totalUsedStorage = 0.0,
    this.pricePerTb = 0.0,
    this.activeContractCount = const <int>[],
  });

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
