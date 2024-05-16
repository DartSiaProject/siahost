import '../../../domain/entities/host_info_entity.dart';

class HostInfoModel extends HostInfoEntity {
  const HostInfoModel({
    super.pubKey,
    super.finalScore,
    super.currentIp,
    super.addressLocationIp,
    super.uploadPrice,
    super.downloadPrice,
    super.storagePrice,
    super.online,
    super.acceptingContracts,
    super.contractPrice,
    super.totalStorage,
    super.usedStorage,
    super.remainingStorage,
  });

  static HostInfoModel fromMap(Map<String, dynamic> data) => HostInfoModel(
      pubKey: data["pubkey"],
      finalScore: data["finalScore"],
      currentIp: data["currentIp"],
      addressLocationIp: data["addressLocationIp"],
      uploadPrice: data["uploadPrice"],
      downloadPrice: data["downloadPrice"],
      storagePrice: data["storagePrice"],
      online: data["online"],
      acceptingContracts: data["acceptingContracts"],
      contractPrice: data["contractPrice"],
      totalStorage: data["totalStorage"],
      usedStorage: data["usedStorage"],
      remainingStorage: data["remainingStorage"]);
}
