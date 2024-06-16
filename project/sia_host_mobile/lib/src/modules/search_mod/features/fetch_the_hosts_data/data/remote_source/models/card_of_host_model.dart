import '../../../domain/entities/card_of_host_entity.dart';

class CardOfHostModel extends CardOfHostEntity {
  const CardOfHostModel({
    super.pubKey,
    super.finalScore,
    super.totalStorage,
  });

  static CardOfHostModel fromMap(Map<String, dynamic> data) => CardOfHostModel(
        pubKey: data["public_key"],
        finalScore: data["finalScore"],
        totalStorage: data["total_storage"],
      );
}
