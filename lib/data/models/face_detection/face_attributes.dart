import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:who_are_you/data/models/face_detection/face_age.dart';
import 'package:who_are_you/data/models/face_detection/face_emotion.dart';
import 'package:who_are_you/data/models/face_detection/face_gender.dart';

part 'face_attributes.freezed.dart';
part 'face_attributes.g.dart';

@freezed
class FaceAttributes with _$FaceAttributes {
  const factory FaceAttributes({
    required FaceGender gender,
    required FaceAge age,
    required FaceEmotion emotion,
  }) = _FaceAttributes;

  factory FaceAttributes.fromJson(Map<String, dynamic> json) => _$FaceAttributesFromJson(json);
}
