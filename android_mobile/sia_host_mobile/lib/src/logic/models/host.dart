import 'package:equatable/equatable.dart';

class Host extends Equatable {
  final int hostId;
  final bool online;
  final String pubkey;
  final String currentIp;
  final String countryCode;
  final int totalStorage;
  final bool acceptingContracts;
  final String version;
  final int usedStorage;
  final int collateral;
  final int contractPrice;
  final int storagePrice;
  final int uploadPrice;
  final int downloadPrice;
  final int rank;
  final dynamic cheating;
  final int finalScore;
  final dynamic errorType;

  const Host({
    this.hostId = 0,
    this.online = false,
    this.pubkey = "",
    this.currentIp = "",
    this.countryCode = "",
    this.totalStorage = 0,
    this.acceptingContracts = false,
    this.version = "",
    this.usedStorage = 0,
    this.collateral = 0,
    this.contractPrice = 0,
    this.storagePrice = 0,
    this.uploadPrice = 0,
    this.downloadPrice = 0,
    this.rank = 0,
    this.cheating = Null,
    this.finalScore = 0,
    this.errorType = Null,
  });

  Host copyWith({
    int? hostId,
    bool? online,
    String? pubkey,
    String? currentIp,
    String? countryCode,
    int? totalStorage,
    bool? acceptingContracts,
    String? version,
    int? usedStorage,
    int? collateral,
    int? contractPrice,
    int? storagePrice,
    int? uploadPrice,
    int? downloadPrice,
    int? rank,
    dynamic cheating,
    int? finalScore,
    dynamic errorType,
  }) {
    return Host(
      hostId: hostId ?? this.hostId,
      online: online ?? this.online,
      pubkey: pubkey ?? this.pubkey,
      currentIp: currentIp ?? this.currentIp,
      countryCode: countryCode ?? this.countryCode,
      totalStorage: totalStorage ?? this.totalStorage,
      acceptingContracts: acceptingContracts ?? this.acceptingContracts,
      version: version ?? this.version,
      usedStorage: usedStorage ?? this.usedStorage,
      collateral: collateral ?? this.collateral,
      contractPrice: contractPrice ?? this.contractPrice,
      storagePrice: storagePrice ?? this.storagePrice,
      uploadPrice: uploadPrice ?? this.uploadPrice,
      downloadPrice: downloadPrice ?? this.downloadPrice,
      rank: rank ?? this.rank,
      cheating: cheating ?? this.cheating,
      finalScore: finalScore ?? this.finalScore,
      errorType: errorType ?? this.errorType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': hostId,
      'online': online,
      'pubkey': pubkey,
      'currentIp': currentIp,
      'countryCode': countryCode,
      'totalStorage': totalStorage,
      'acceptingContracts': acceptingContracts,
      'version': version,
      'usedStorage': usedStorage,
      'collateral': collateral,
      'contractPrice': contractPrice,
      'storagePrice': storagePrice,
      'uploadPrice': uploadPrice,
      'downloadPrice': downloadPrice,
      'rank': rank,
      'cheating': cheating,
      'finalScore': finalScore,
      'errorType': errorType,
    };
  }

  factory Host.fromMap(Map<String, dynamic> map) {
    return Host(
      hostId: map['Id']?.toInt() ?? 0,
      online: map['online'] ?? false,
      pubkey: map['pubkey'] ?? '',
      currentIp: map['currentIp'] ?? '',
      countryCode: map['countryCode'] ?? '',
      totalStorage: map['totalStorage']?.toInt() ?? 0,
      acceptingContracts: map['acceptingContracts'] ?? false,
      version: map['version'] ?? '',
      usedStorage: map['usedStorage']?.toInt() ?? 0,
      collateral: map['collateral']?.toInt() ?? 0,
      contractPrice: map['contractPrice']?.toInt() ?? 0,
      storagePrice: map['storagePrice']?.toInt() ?? 0,
      uploadPrice: map['uploadPrice']?.toInt() ?? 0,
      downloadPrice: map['downloadPrice']?.toInt() ?? 0,
      rank: map['rank']?.toInt() ?? 0,
      cheating: map['cheating'],
      finalScore: map['finalScore']?.toInt() ?? 0,
      errorType: map['errorType'],
    );
  }

  @override
  List<Object> get props {
    return [
      hostId,
      online,
      pubkey,
      currentIp,
      countryCode,
      totalStorage,
      acceptingContracts,
      version,
      usedStorage,
      collateral,
      contractPrice,
      storagePrice,
      uploadPrice,
      downloadPrice,
      rank,
      cheating,
      finalScore,
      errorType,
    ];
  }
}
