import '../../../domain/entities/the_host_data_entity.dart';

class TheHostDataModel extends TheHostDataEntity {
  const TheHostDataModel({
    super.maxDownloadPrice,
    super.maxUploadPrice,
    super.maxStoragePrice,
    super.maxContractPrice,
    super.minAccountExpiry,
    super.maxRPCPrice,
    super.hostBlockHeightLeeway,
    super.minMaxEphemeralAccountBalance,
    super.minPriceTableValidity,
  });

  static TheHostDataModel fromMap(Map<String, dynamic> data) =>
      TheHostDataModel(
        maxDownloadPrice: data["maxDownloadPrice"],
        maxUploadPrice: data["maxUploadPrice"],
        maxStoragePrice: data["maxStoragePrice"],
        maxContractPrice: data["maxContractPrice"],
        minAccountExpiry: data["minAccountExpiry"].toString(),
        maxRPCPrice: data["maxRPCPrice"],
        hostBlockHeightLeeway: data["hostBlockHeightLeeway"],
        minMaxEphemeralAccountBalance: data["minMaxEphemeralAccountBalance"],
        minPriceTableValidity: data["minPriceTableValidity"],
      );
}
