// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'face_compare_response.freezed.dart';
part 'face_compare_response.g.dart';

@freezed
class FaceCompareResponse with _$FaceCompareResponse {
  const factory FaceCompareResponse({
    @Default('') @JsonKey(name: 'request_id') String requestId,
    @Default(0) @JsonKey(name: 'time_used') int timeUsed,
    @Default('') String confidence,
    @JsonKey(name: 'error_message') String? errorMessage,
  }) = _FaceCompareResponse;

  factory FaceCompareResponse.fromJson(Map<String, dynamic> json) => _$FaceCompareResponseFromJson(json);
}
