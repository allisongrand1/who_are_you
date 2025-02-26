import 'dart:io';

import 'package:who_are_you/config/constants/typedef/typedefs.dart';
import 'package:who_are_you/data/storage/storage.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';

class AnalyzeImageUseCase {
  final FaceDetectionRepository repository;
  final Storage storage;

  AnalyzeImageUseCase({required this.repository, required this.storage});

  Future<AnalyzeImage> call(File image) async {
    final detectFace = await repository.detectFaceInfo(image);

    return detectFace.fold(
      left: (failure) => (result: failure.message),
      right: (success) => (
        result:
            'Пол: ${success.faces.first.attributes.gender.value}, Возраст: ${success.faces.first.attributes.age.value}'
      ),
    );
  }
}
