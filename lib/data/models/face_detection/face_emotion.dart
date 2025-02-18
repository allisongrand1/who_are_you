import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_emotion.freezed.dart';
part 'face_emotion.g.dart';

@freezed
class FaceEmotion with _$FaceEmotion {
  const factory FaceEmotion({
    @Default(0.0) double anger,
    @Default(0.0) double disgust,
    @Default(0.0) double fear,
    @Default(0.0) double happiness,
    @Default(0.0) double neutral,
    @Default(0.0) double sadness,
    @Default(0.0) double surprise,
  }) = _FaceEmotion;

  factory FaceEmotion.fromJson(Map<String, dynamic> json) => _$FaceEmotionFromJson(json);
}
