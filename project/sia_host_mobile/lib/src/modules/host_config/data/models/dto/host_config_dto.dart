import 'package:equatable/equatable.dart';

class HostConfigDto extends Equatable {
  const HostConfigDto({
    this.maxDownloadPrice = '',
    this.maxUploadPrice = '',
    this.maxStoragePrice = '',
    this.maxContractPrice = '',
    this.minAccountExpiry = '',
    this.maxRPCPrice = '',
    this.hostBlockHeightLeeway = 0,
    this.minMaxEphemeralAccountBalance = '',
    this.minPriceTableValidity = 0,
  });

  final String maxDownloadPrice;
  final String maxUploadPrice;
  final String maxStoragePrice;
  final String maxContractPrice;
  final String minAccountExpiry;
  final String maxRPCPrice;
  final int hostBlockHeightLeeway;
  final String minMaxEphemeralAccountBalance;
  final int minPriceTableValidity;

  Map<String, dynamic> toJson() {
    return {
      'maxDownloadPrice': maxDownloadPrice,
      'maxUploadPrice': maxUploadPrice,
      'maxStoragePrice': maxStoragePrice,
      'maxContractPrice': maxContractPrice,
      'minAccountExpiry': minAccountExpiry,
      'maxRPCPrice': maxRPCPrice,
      'hostBlockHeightLeeway': hostBlockHeightLeeway,
      'minMaxEphemeralAccountBalance': minMaxEphemeralAccountBalance,
      'minPriceTableValidity': minPriceTableValidity,
    };
  }

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
