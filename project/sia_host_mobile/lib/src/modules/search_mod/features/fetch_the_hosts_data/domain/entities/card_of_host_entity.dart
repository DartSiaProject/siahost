import 'package:equatable/equatable.dart';

class CardOfHostEntity extends Equatable {
  final String pubKey;
  final num finalScore;
  final double totalStorage;

  const CardOfHostEntity({
    this.pubKey = "",
    this.finalScore = 0,
    this.totalStorage = 0.0,
  });

  @override
  List<Object> get props => [
        finalScore,
        pubKey,
        totalStorage,
      ];
}
