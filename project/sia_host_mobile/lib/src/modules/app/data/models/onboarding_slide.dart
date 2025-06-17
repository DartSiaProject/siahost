import 'package:equatable/equatable.dart';

class OnboardingSlide extends Equatable {
  const OnboardingSlide({
    required this.value,
    required this.imagePath,
  });

  final int value;
  final String imagePath;

  @override
  List<Object?> get props => [value, imagePath];
}
