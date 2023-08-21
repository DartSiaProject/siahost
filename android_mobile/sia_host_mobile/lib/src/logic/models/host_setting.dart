import 'package:equatable/equatable.dart';

class HostSetting extends Equatable {
  final int hostBlockHeightLeeway;
  final String maxContractPrice;
  final String maxDownloadPrice;
  final String maxRPCPrice;
  final String maxStoragePrice;
  final String maxUploadPrice;
  final String minMaxCollateral;
  final String minAccountExpiry;
  final String blockHeight;

  const HostSetting({
    this.hostBlockHeightLeeway = 0,
    this.maxContractPrice = "",
    this.maxDownloadPrice = "",
    this.maxRPCPrice = "",
    this.maxStoragePrice = "",
    this.maxUploadPrice = "",
    this.minMaxCollateral = "",
    this.minAccountExpiry = "",
    this.blockHeight = "",
  });

  HostSetting copyWith({
    int? hostBlockHeightLeeway,
    String? maxContractPrice,
    String? maxDownloadPrice,
    String? maxRPCPrice,
    String? maxStoragePrice,
    String? maxUploadPrice,
    String? minMaxCollateral,
    String? minAccountExpiry,
    String? blockHeight,
  }) {
    return HostSetting(
      hostBlockHeightLeeway:
          hostBlockHeightLeeway ?? this.hostBlockHeightLeeway,
      maxContractPrice: maxContractPrice ?? this.maxContractPrice,
      maxDownloadPrice: maxDownloadPrice ?? this.maxDownloadPrice,
      maxRPCPrice: maxRPCPrice ?? this.maxRPCPrice,
      maxStoragePrice: maxStoragePrice ?? this.maxStoragePrice,
      maxUploadPrice: maxUploadPrice ?? this.maxUploadPrice,
      minMaxCollateral: minMaxCollateral ?? this.minMaxCollateral,
      minAccountExpiry: minAccountExpiry ?? this.minAccountExpiry,
      blockHeight: blockHeight ?? this.blockHeight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hostBlockHeightLeeway': hostBlockHeightLeeway,
      'maxContractPrice': maxContractPrice,
      'maxDownloadPrice': maxDownloadPrice,
      'maxRPCPrice': maxRPCPrice,
      'maxStoragePrice': maxStoragePrice,
      'maxUploadPrice': maxUploadPrice,
      'minMaxCollateral': minMaxCollateral,
      'minAccountExpiry': minAccountExpiry
    };
  }

  factory HostSetting.fromMap(Map<String, dynamic> map) {
    return HostSetting(
      hostBlockHeightLeeway: map['hostBlockHeightLeeway']?.toInt() ?? 0,
      maxContractPrice: map['maxContractPrice'] ?? '',
      maxDownloadPrice: map['maxDownloadPrice'] ?? '',
      maxRPCPrice: map['maxRPCPrice'] ?? '',
      maxStoragePrice: map['maxStoragePrice'] ?? '',
      maxUploadPrice: map['maxUploadPrice'] ?? '',
      minMaxCollateral: map['minMaxCollateral'] ?? '',
      minAccountExpiry: map['minAccountExpiry']?.toString() ?? "",
    );
  }

  @override
  List<Object> get props {
    return [
      hostBlockHeightLeeway,
      maxContractPrice,
      maxDownloadPrice,
      maxRPCPrice,
      maxStoragePrice,
      maxUploadPrice,
      minMaxCollateral,
      minAccountExpiry,
      blockHeight,
    ];
  }
}
