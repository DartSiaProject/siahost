import 'package:equatable/equatable.dart';

class Host extends Equatable {
  final int hostId;
  final bool online;
  final String pubkey;
  final String currentIp;
  final String countryCode;
  final double totalStorage;
  final bool acceptingContracts;
  final String version;
  final double usedStorage;
  final int collateral;
  final int contractPrice;
  final int storagePrice;
  final int uploadPrice;
  final int downloadPrice;
  final int rank;
  final int cheating;
  final int finalScore;
  final String errorType;
  final String addressLocationIp; //*note: new variable of hostModel

  const Host({
    this.hostId = 0,
    this.online = false,
    this.pubkey = "",
    this.currentIp = "",
    this.countryCode = "",
    this.totalStorage = 0.0,
    this.acceptingContracts = false,
    this.version = "",
    this.usedStorage = 0.0,
    this.collateral = 0,
    this.contractPrice = 0,
    this.storagePrice = 0,
    this.uploadPrice = 0,
    this.downloadPrice = 0,
    this.rank = 0,
    this.cheating = 0,
    this.finalScore = 0,
    this.errorType = "",
    this.addressLocationIp = "",
  });

  Host copyWith({
    int? hostId,
    bool? online,
    String? pubkey,
    String? currentIp,
    String? countryCode,
    double? totalStorage,
    bool? acceptingContracts,
    String? version,
    double? usedStorage,
    int? collateral,
    int? contractPrice,
    int? storagePrice,
    int? uploadPrice,
    int? downloadPrice,
    int? rank,
    int? cheating,
    int? finalScore,
    String? errorType,
    String? addressLocationIp,
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
      addressLocationIp: addressLocationIp ?? this.addressLocationIp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Id': hostId,
      'Online': online,
      'Pubkey': pubkey,
      'CurrentIp': currentIp,
      'CountryCode': countryCode,
      'TotalStorage': totalStorage,
      'AcceptingContracts': acceptingContracts,
      'Version': version,
      'UsedStorage': usedStorage,
      'Collateral': collateral,
      'ContractPrice': contractPrice,
      'StoragePrice': storagePrice,
      'UploadPrice': uploadPrice,
      'DownloadPrice': downloadPrice,
      'Rank': rank,
      'Cheating': cheating,
      'FinalScore': finalScore,
      'ErrorType': errorType,
    };
  }

  factory Host.fromMap(Map<String, dynamic> map) {
    return Host(
      hostId: map['Id']?.toInt() ?? 0,
      online: map['Online'] ?? false,
      pubkey: map['Pubkey'] ?? '',
      currentIp: map['CurrentIp'] ?? '',
      countryCode: map['CountryCode'] ?? '',
      totalStorage: map['TotalStorage']?.toDouble() ?? 0,
      acceptingContracts: map['AcceptingContracts'] ?? false,
      version: map['Version'] ?? '',
      usedStorage: map['UsedStorage']?.toDouble() ?? 0.0,
      collateral: map['Collateral']?.toInt() ?? 0,
      contractPrice: map['ContractPrice']?.toInt() ?? 0,
      storagePrice: map['StoragePrice']?.toInt() ?? 0,
      uploadPrice: map['UploadPrice']?.toInt() ?? 0,
      downloadPrice: map['DownloadPrice']?.toInt() ?? 0,
      rank: map['Rank']?.toInt() ?? 0,
      cheating: map['Cheating']?.toInt() ?? 0,
      finalScore: map['FinalScore']?.toInt() ?? 0,
      errorType: map['ErrorType'] ?? '',
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
