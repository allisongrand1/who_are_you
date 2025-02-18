import 'dart:io';

import 'package:who_are_you/domain/models/face_compare/face_compare.dart';
import 'package:who_are_you/domain/models/face_detection/face_detection.dart';

abstract class FaceDetectionRepository {
  Future<FaceDetection> detectFaceInfo(File image);

  Future<FaceCompare> compareTwoFaces({required Set<File> images});
}
