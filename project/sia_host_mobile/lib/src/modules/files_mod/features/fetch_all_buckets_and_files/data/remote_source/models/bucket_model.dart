import '../../../domain/entities/bucket_entity.dart';

class BucketModel extends BucketEntity {
  const BucketModel({
    super.nameBucket,
  });

  static BucketModel fromMap(Map<String, dynamic> data) => BucketModel(
        nameBucket: data["name"],
      );
}
