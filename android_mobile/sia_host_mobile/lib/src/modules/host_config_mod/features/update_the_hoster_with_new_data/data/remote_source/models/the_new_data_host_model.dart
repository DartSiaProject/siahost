import '../../../domain/entities/the_new_data_host_entity.dart';

class TheNewDataHostModel extends TheNewDataHostEntity {
  const TheNewDataHostModel({
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

  Map<String, dynamic> toMap() => {
        "hostBlockHeightLeeway": hostBlockHeightLeeway,
        "minMaxEphemeralAccountBalance": minMaxEphemeralAccountBalance,
        "minPriceTableValidity": minPriceTableValidity,
        "maxDownloadPrice": maxDownloadPrice,
        "maxUploadPrice": maxUploadPrice,
        "maxStoragePrice": maxStoragePrice,
        "maxContractPrice": maxContractPrice,
        "minAccountExpiry": int.parse(minAccountExpiry),
        "maxRPCPrice": maxRPCPrice,
      };
}
