import 'dart:io';

import 'package:who_are_you/data/data_sources/face_detection_data_source.dart';
import 'package:who_are_you/domain/models/face_compare/face_compare.dart';
import 'package:who_are_you/domain/models/face_detection/face_detection.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';

class FaceDetectionRepositoryImpl extends FaceDetectionRepository {
  final FaceDetectionDataSource faceDetectionDataSource;

  FaceDetectionRepositoryImpl({required this.faceDetectionDataSource});

  @override
  Future<FaceDetection> detectFaceInfo(File image) async {
    return faceDetectionDataSource.detectFace(image.path);
  }

  @override
  Future<FaceCompare> compareTwoFaces({required Set<File> images}) async {
    return faceDetectionDataSource.compareFaces(images: images);
  }
}
