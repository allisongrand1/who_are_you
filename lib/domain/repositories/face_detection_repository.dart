import 'dart:io';

import 'package:who_are_you/core/errors/failures/either.dart';
import 'package:who_are_you/core/errors/failures/failure.dart';
import 'package:who_are_you/domain/models/face_compare/face_compare.dart';
import 'package:who_are_you/domain/models/face_detection/face_detection.dart';

abstract class FaceDetectionRepository {
  Future<Either<Failure, FaceDetection>> detectFaceInfo(File image);

  Future<Either<Failure, FaceCompare>> compareTwoFaces({required List<File> images});
}
