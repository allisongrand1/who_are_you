import 'dart:io';

import 'package:who_are_you/core/errors/exceptions/network_exception.dart';
import 'package:who_are_you/core/errors/exceptions/server_exception.dart';
import 'package:who_are_you/core/errors/failures/either.dart';
import 'package:who_are_you/core/errors/failures/failure.dart';
import 'package:who_are_you/data/data_sources/face_detection_data_source.dart';
import 'package:who_are_you/domain/models/face_compare/face_compare.dart';
import 'package:who_are_you/domain/models/face_detection/face_detection.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';

class FaceDetectionRepositoryImpl extends FaceDetectionRepository {
  final FaceDetectionDataSource faceDetectionDataSource;

  FaceDetectionRepositoryImpl({required this.faceDetectionDataSource});

  @override
  Future<Either<Failure, FaceDetection>> detectFaceInfo(File image) async {
    try {
      final result = await faceDetectionDataSource.detectFace(image.path);

      return Right(result);
    } on NetworkException catch (e) {
      return Left(Failure(message: e.message));
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, FaceCompare>> compareTwoFaces({required List<File> images}) async {
    try {
      final result = await faceDetectionDataSource.compareFaces(images: images);

      return Right(result);
    } on NetworkException catch (e) {
      return Left(Failure(message: e.message));
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
