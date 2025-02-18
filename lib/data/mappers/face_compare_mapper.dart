import 'package:who_are_you/data/models/face_compare/face_compare_response.dart';
import 'package:who_are_you/domain/models/face_compare/face_compare.dart';

extension FaceCompareMapper on FaceCompareResponse {
  FaceCompare toEntity() {
    return FaceCompare(
      requestId: requestId,
      timeUsed: timeUsed,
      confidence: confidence,
      errorMessage: errorMessage,
    );
  }
}
