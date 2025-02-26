import 'dart:io';

import 'package:dio/dio.dart';
import 'package:who_are_you/core/environment/environment.dart';
import 'package:who_are_you/core/errors/exceptions/excteption.dart';
import 'package:who_are_you/core/errors/exceptions/extension_message.dart';
import 'package:who_are_you/core/errors/exceptions/network_exception.dart';
import 'package:who_are_you/core/errors/exceptions/server_exception.dart';
import 'package:who_are_you/data/data_sources/face_detection_data_source.dart';
import 'package:who_are_you/data/endpoint.dart';
import 'package:who_are_you/data/mappers/face_compare_mapper.dart';
import 'package:who_are_you/data/mappers/face_detection_mapper.dart';
import 'package:who_are_you/data/models/face_compare/face_compare_response.dart';
import 'package:who_are_you/data/models/face_detection/face_detection_response.dart';
import 'package:who_are_you/domain/models/face_compare/face_compare.dart';
import 'package:who_are_you/domain/models/face_detection/face_detection.dart';

class FaceDetectionDataSourceImpl extends FaceDetectionDataSource {
  final Dio dio;

  FaceDetectionDataSourceImpl({required this.dio});

  @override
  Future<FaceDetection> detectFace(String imagePath) async {
    final formData = FormData.fromMap({
      'api_key': Environment.apiKey,
      'api_secret': Environment.apiSecret,
      'image_file': await MultipartFile.fromFile(imagePath),
      'return_attributes': 'gender,age,emotion',
    });

    try {
      final response = await dio.post(detect, data: formData);

      return FaceDetectionResponse.fromJson(response.data).toEntity();
    } on DioException catch (e) {
      throw handleException(e);
    }
  }

  @override
  Future<FaceCompare> compareFaces({required List<File> images}) async {
    final formData = FormData.fromMap({
      'api_key': Environment.apiKey,
      'api_secret': Environment.apiSecret,
      'image_file1': await MultipartFile.fromFile(images.first.path),
      'image_file2': await MultipartFile.fromFile(images.last.path),
    });

    try {
      final response = await dio.post(compare, data: formData);

      return FaceCompareResponse.fromJson(response.data).toEntity();
    } on DioException catch (e) {
      throw handleException(e);
    }
  }

  AppException handleException(DioException exception) {
    final response = exception.response!;

    final error = response.data;

    if (error is! Map) {
      throw NetworkException(message: ExtensionMessages.requestEntityTooLarge.message);
    }

    if (response.statusCode != 500) {
      final message = ExtensionMessages().getExtensionMessage(error['error_message']);

      throw NetworkException(message: message);
    }

    throw ServerException(message: exception.toString());
  }
}
