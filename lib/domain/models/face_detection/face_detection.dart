import 'package:equatable/equatable.dart';
import 'package:who_are_you/domain/models/face_detection/face.dart';

class FaceDetection extends Equatable {
  final String requestId;
  final int timeUsed;
  final List<Face> faces;
  final String imageId;
  final int faceNum;

  const FaceDetection({
    required this.requestId,
    required this.timeUsed,
    required this.faces,
    required this.imageId,
    required this.faceNum,
  });

  @override
  List<Object?> get props => [];
}
