import 'package:equatable/equatable.dart';

class Emotion extends Equatable {
  final double anger;
  final double disgust;
  final double fear;
  final double happiness;
  final double neutral;
  final double sadness;
  final double surprise;

  const Emotion({
    required this.anger,
    required this.disgust,
    required this.fear,
    required this.happiness,
    required this.neutral,
    required this.sadness,
    required this.surprise,
  });

  @override
  List<Object> get props => [
        anger,
        disgust,
        fear,
        happiness,
        neutral,
        sadness,
        surprise,
      ];
}
