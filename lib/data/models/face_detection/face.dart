// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:who_are_you/data/models/face_detection/face_attributes.dart';
import 'package:who_are_you/data/models/face_detection/face_rectangle.dart';

part 'face.freezed.dart';
part 'face.g.dart';

@freezed
class FaceModel with _$FaceModel {
  const factory FaceModel({
    @JsonKey(name: 'face_token') required String faceToken,
    @JsonKey(name: 'face_rectangle') required FaceRectangle faceRectangle,
    required FaceAttributes attributes,
  }) = _FaceModel;

  factory FaceModel.fromJson(Map<String, dynamic> json) => _$FaceModelFromJson(json);
}
