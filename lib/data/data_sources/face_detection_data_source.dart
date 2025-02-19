import 'dart:io';

import 'package:who_are_you/domain/models/face_compare/face_compare.dart';
import 'package:who_are_you/domain/models/face_detection/face_detection.dart';

abstract class FaceDetectionDataSource {
  Future<FaceDetection> detectFace(String imagePath);

  Future<FaceCompare> compareFaces({required Set<File> images});
}
