import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_gender.freezed.dart';
part 'face_gender.g.dart';

@freezed
class FaceGender with _$FaceGender {
  const factory FaceGender({
    @Default('') String value,
  }) = _FaceGender;

  factory FaceGender.fromJson(Map<String, dynamic> json) => _$FaceGenderFromJson(json);
}
