import 'package:equatable/equatable.dart';

class BucketModel extends Equatable {
  const BucketModel({
    required this.name,
  });

  factory BucketModel.fromJson(Map<String, dynamic> json) {
    return BucketModel(
      name: json['name'] as String,
    );
  }

  final String name;

  @override
  List<Object?> get props => [
        name,
      ];
}
