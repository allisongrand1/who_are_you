import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_rectangle.freezed.dart';
part 'face_rectangle.g.dart';

@freezed
class FaceRectangle with _$FaceRectangle {
  const factory FaceRectangle({
    @Default(0) int top,
    @Default(0) int left,
    @Default(0) int width,
    @Default(0) int height,
  }) = _FaceRectangle;

  factory FaceRectangle.fromJson(Map<String, dynamic> json) => _$FaceRectangleFromJson(json);
}
