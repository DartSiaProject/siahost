import 'package:equatable/equatable.dart';

class TheHostDataEntity extends Equatable {
  final String maxDownloadPrice;
  final String maxUploadPrice;
  final String maxStoragePrice;
  final String maxContractPrice;
  final String minAccountExpiry;
  final String maxRPCPrice;
  final int hostBlockHeightLeeway;
  final String minMaxEphemeralAccountBalance;
  final int minPriceTableValidity;

  const TheHostDataEntity({
    this.maxDownloadPrice = "",
    this.maxUploadPrice = "",
    this.maxStoragePrice = "",
    this.maxContractPrice = "",
    this.minAccountExpiry = "",
    this.maxRPCPrice = "",
    this.hostBlockHeightLeeway = 0,
    this.minMaxEphemeralAccountBalance = "",
    this.minPriceTableValidity = 0,
  });

  @override
  List<Object> get props {
    return [
      maxDownloadPrice,
      maxUploadPrice,
      maxStoragePrice,
      maxContractPrice,
      minAccountExpiry,
      maxRPCPrice,
      hostBlockHeightLeeway,
      minMaxEphemeralAccountBalance,
      minPriceTableValidity,
    ];
  }
}
