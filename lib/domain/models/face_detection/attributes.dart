import 'package:equatable/equatable.dart';
import 'package:who_are_you/domain/models/face_detection/age.dart';
import 'package:who_are_you/domain/models/face_detection/emotion.dart';
import 'package:who_are_you/domain/models/face_detection/gender.dart';

class Attributes extends Equatable {
  final Gender gender;
  final Age age;
  final Emotion emotion;

  const Attributes({
    required this.gender,
    required this.age,
    required this.emotion,
  });

  @override
  List<Object> get props => [gender, age, emotion];
}
