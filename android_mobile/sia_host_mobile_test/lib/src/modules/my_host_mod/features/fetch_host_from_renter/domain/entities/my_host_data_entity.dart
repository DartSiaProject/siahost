import 'package:equatable/equatable.dart';

class MyHostDataEntity extends Equatable {
  final String blockHeight;
  final String maxDownloadPrice;
  final String maxUploadPrice;
  final String maxStoragePrice;
  final String maxContractPrice;
  final String minAccountExpiry;
  final String maxRPCPrice;

  const MyHostDataEntity({
    this.blockHeight = "",
    this.maxDownloadPrice = "",
    this.maxUploadPrice = "",
    this.maxStoragePrice = "",
    this.maxContractPrice = "",
    this.minAccountExpiry = "",
    this.maxRPCPrice = "",
  });

  @override
  List<Object> get props {
    return [
      blockHeight,
      maxDownloadPrice,
      maxUploadPrice,
      maxStoragePrice,
      maxContractPrice,
      minAccountExpiry,
      maxRPCPrice,
    ];
  }
}
