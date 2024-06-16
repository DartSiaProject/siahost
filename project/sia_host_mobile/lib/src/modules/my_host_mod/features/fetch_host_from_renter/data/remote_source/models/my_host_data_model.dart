import '../../../domain/entities/my_host_data_entity.dart';

class MyHostDataModel extends MyHostDataEntity {
  const MyHostDataModel({
    super.blockHeight,
    super.maxDownloadPrice,
    super.maxUploadPrice,
    super.maxStoragePrice,
    super.maxContractPrice,
    super.minAccountExpiry,
    super.maxRPCPrice,
  });

  static MyHostDataModel fromHosterMap(Map<String, dynamic> data) =>
      MyHostDataModel(
        maxDownloadPrice: data["maxDownloadPrice"],
        maxUploadPrice: data["maxUploadPrice"],
        maxStoragePrice: data["maxStoragePrice"],
        maxContractPrice: data["maxContractPrice"],
        minAccountExpiry: data["minAccountExpiry"].toString(),
        maxRPCPrice: data["maxRPCPrice"],
      );

  static MyHostDataModel fromConsensusMap(Map<String, dynamic> data) =>
      MyHostDataModel(
        blockHeight: data["blockHeight"],
      );
}
