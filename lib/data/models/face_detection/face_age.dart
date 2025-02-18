import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_age.freezed.dart';
part 'face_age.g.dart';

@freezed
class FaceAge with _$FaceAge {
  const factory FaceAge({
    @Default(0) int value,
  }) = _FaceAge;

  factory FaceAge.fromJson(Map<String, dynamic> json) => _$FaceAgeFromJson(json);
}
