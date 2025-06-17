import 'package:equatable/equatable.dart';

class CurrentHostInfoModel extends Equatable {
  const CurrentHostInfoModel({
    required this.blockHeight,
    required this.maxDownloadPrice,
    required this.maxUploadPrice,
    required this.maxStoragePrice,
    required this.maxContractPrice,
    required this.minAccountExpiry,
    required this.maxRPCPrice,
    required this.hostBlockHeightLeeway,
    required this.minMaxEphemeralAccountBalance,
    required this.minPriceTableValidity,
  });

  factory CurrentHostInfoModel.fromJson(Map<String, dynamic> json) {
    return CurrentHostInfoModel(
      blockHeight: json['blockHeight'] as String? ?? '',
      maxDownloadPrice: json['maxDownloadPrice'] as String,
      maxUploadPrice: json['maxUploadPrice'] as String,
      maxStoragePrice: json['maxStoragePrice'] as String,
      maxContractPrice: json['maxContractPrice'] as String,
      minAccountExpiry: (json['minAccountExpiry'] as num).toString(),
      maxRPCPrice: json['maxRPCPrice'] as String,
      hostBlockHeightLeeway: (json['hostBlockHeightLeeway'] as num).toInt(),
      minMaxEphemeralAccountBalance:
          json['minMaxEphemeralAccountBalance'] as String,
      minPriceTableValidity: (json['minPriceTableValidity'] as num).toInt(),
    );
  }

  final String blockHeight;
  final String maxDownloadPrice;
  final String maxUploadPrice;
  final String maxStoragePrice;
  final String maxContractPrice;
  final String minAccountExpiry;
  final String maxRPCPrice;
  final int hostBlockHeightLeeway;
  final String minMaxEphemeralAccountBalance;
  final int minPriceTableValidity;

  CurrentHostInfoModel copyWith({
    String? blockHeight,
    String? maxDownloadPrice,
    String? maxUploadPrice,
    String? maxStoragePrice,
    String? maxContractPrice,
    String? minAccountExpiry,
    String? maxRPCPrice,
    int? hostBlockHeightLeeway,
    String? minMaxEphemeralAccountBalance,
    int? minPriceTableValidity,
  }) {
    return CurrentHostInfoModel(
      blockHeight: blockHeight ?? this.blockHeight,
      maxDownloadPrice: maxDownloadPrice ?? this.maxDownloadPrice,
      maxUploadPrice: maxUploadPrice ?? this.maxUploadPrice,
      maxStoragePrice: maxStoragePrice ?? this.maxStoragePrice,
      maxContractPrice: maxContractPrice ?? this.maxContractPrice,
      minAccountExpiry: minAccountExpiry ?? this.minAccountExpiry,
      maxRPCPrice: maxRPCPrice ?? this.maxRPCPrice,
      hostBlockHeightLeeway:
          hostBlockHeightLeeway ?? this.hostBlockHeightLeeway,
      minMaxEphemeralAccountBalance:
          minMaxEphemeralAccountBalance ?? this.minMaxEphemeralAccountBalance,
      minPriceTableValidity:
          minPriceTableValidity ?? this.minPriceTableValidity,
    );
  }

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
