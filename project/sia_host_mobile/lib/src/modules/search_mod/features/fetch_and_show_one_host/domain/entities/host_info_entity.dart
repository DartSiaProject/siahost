import 'package:equatable/equatable.dart';

class HostInfoEntity extends Equatable {
  final String pubKey;
  final double finalScore;
  final String currentIp;
  final String addressLocationIp;
  final int uploadPrice;
  final int downloadPrice;
  final int storagePrice;
  final bool online;
  final bool acceptingContracts;
  final double contractPrice;
  final double totalStorage;
  final double usedStorage;
  final double remainingStorage;

  const HostInfoEntity({
    this.pubKey = "",
    this.finalScore = .0,
    this.currentIp = "",
    this.addressLocationIp = "",
    this.uploadPrice = 0,
    this.downloadPrice = 0,
    this.storagePrice = 0,
    this.online = false,
    this.acceptingContracts = false,
    this.contractPrice = 0,
    this.totalStorage = 0.0,
    this.usedStorage = 0.0,
    this.remainingStorage = 0.0,
  });

  @override
  List<Object> get props {
    return [
      pubKey,
      finalScore,
      currentIp,
      addressLocationIp,
      uploadPrice,
      downloadPrice,
      storagePrice,
      online,
      acceptingContracts,
      contractPrice,
      totalStorage,
      usedStorage,
      remainingStorage,
    ];
  }
}
