import '../../../domain/entities/network_data_entity.dart';

class NetworkDataModel extends NetworkDataEntity {
  const NetworkDataModel({
    super.totalCurrentHosts,
    super.totalNetworkStorage,
    super.totalUsedStorage,
    super.pricePerTb,
    super.activeContractCount,
  });

  static NetworkDataModel fromMap(Map<String, dynamic> data) =>
      NetworkDataModel(
        totalCurrentHosts: data["totalCurrentHosts"],
        totalNetworkStorage: data["totalNetworkStorage"],
        totalUsedStorage: data["totalUsedStorage"],
        pricePerTb: data["pricePerTb"],
        activeContractCount: data["activeContractCount"],
      );
}
