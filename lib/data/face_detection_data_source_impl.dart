import 'package:dio/dio.dart';
import 'package:who_are_you/core/environment/environment.dart';
import 'package:who_are_you/data/endpoint.dart';
import 'package:who_are_you/data/face_detection_data_source.dart';
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
      "api_key": Environment.apiKey,
      "api_secret": Environment.apiSecret,
      "image_file": await MultipartFile.fromFile(imagePath),
      "return_attributes": "gender,age,emotion",
    });

    final response = await dio.post(detect, data: formData);

    return FaceDetectionResponse.fromJson(response.data).toEntity();
  }

  @override
  Future<FaceCompare> compareFaces({
    required String firstImagePath,
    required String secondImagePath,
  }) async {
    final formData = FormData.fromMap({
      "api_key": Environment.apiKey,
      "api_secret": Environment.apiSecret,
      "image_file1": await MultipartFile.fromFile(firstImagePath),
      "image_file2": await MultipartFile.fromFile(secondImagePath),
    });

    final response = await dio.post(compare, data: formData);

    return FaceCompareResponse.fromJson(response.data).toEntity();
  }
}
