import 'package:equatable/equatable.dart';

class HostInfoModel extends Equatable {
  const HostInfoModel({
    required this.publicKey,
    required this.finalScore,
    required this.netAddress,
    required this.addressLocation,
    required this.uploadPrice,
    required this.downloadPrice,
    required this.storagePrice,
    required this.acceptingContracts,
    required this.totalStorage,
    required this.remainingStorage,
    required this.usedStorage,
    this.online = true,
  });

  // factory HostInfoModel.fromJson(Map<String, dynamic> json) {
  //   return HostInfoModel(
  //     publicKey: json['publicKey'] as String? ?? '',
  //     finalScore: (json['finalScore'] as num?)?.toDouble() ?? .0,
  //     networkAddress: ,

  //     netAddress: json['current_ip'] as String? ?? '',
  //     addressLocation: json['address_location_ip'] as String? ?? '',
  //     uploadPrice: json['upload_price'] as int? ?? 0,
  //     downloadPrice: json['download_price'] as int? ?? 0,
  //     storagePrice: json['storage_price'] as int? ?? 0,
  //     online: json['online'] as bool? ?? false,
  //     acceptingContracts: json['accepting_contracts'] as bool? ?? false,
  //     contractPrice: (json['contract_price'] as num?)?.toDouble() ?? 0.0,
  //     totalStorage: (json['total_storage'] as num?)?.toDouble() ?? 0.0,
  //     usedStorage: (json['used_storage'] as num?)?.toDouble() ?? 0.0,
  //     remainingStorage: (json['remaining_storage'] as num?)?.toDouble() ?? 0.0,
  //   );
  // }

  final String publicKey;
  final double finalScore;
  final String netAddress;
  final String addressLocation;
  final double uploadPrice;
  final double downloadPrice;
  final double storagePrice;
  final bool online;
  final bool acceptingContracts;
  final double totalStorage;
  final double usedStorage;
  final double remainingStorage;

  @override
  List<Object> get props {
    return [
      publicKey,
      finalScore,
      netAddress,
      addressLocation,
      uploadPrice,
      downloadPrice,
      storagePrice,
      online,
      acceptingContracts,
      totalStorage,
      usedStorage,
      remainingStorage,
    ];
  }
}
