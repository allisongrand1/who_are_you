// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:who_are_you/data/models/face_detection/face.dart';

part 'face_detection_response.freezed.dart';
part 'face_detection_response.g.dart';

@freezed
class FaceDetectionResponse with _$FaceDetectionResponse {
  const factory FaceDetectionResponse({
    required List<FaceModel> faces,
    @Default('') @JsonKey(name: 'request_id') String requestId,
    @Default(0) @JsonKey(name: 'time_used') int timeUsed,
    @Default('') @JsonKey(name: 'image_id') String imageId,
    @Default(0) @JsonKey(name: 'face_num') int faceNum,
  }) = _FaceDetectionResponse;

  factory FaceDetectionResponse.fromJson(Map<String, dynamic> json) => _$FaceDetectionResponseFromJson(json);
}
