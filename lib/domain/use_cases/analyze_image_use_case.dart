import 'dart:io';

import 'package:who_are_you/config/constants/typedef/typedefs.dart';
import 'package:who_are_you/data/storage/storage.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';

class AnalyzeImageUseCase {
  final FaceDetectionRepository repository;
  final Storage storage;

  AnalyzeImageUseCase({required this.repository, required this.storage});

  String _result = '';

  Future<LoadedImage> call() async {
    final path = await storage.getString(key: 'photo');

    if (path != null) {
      final image = File(path);

      try {
        final detectFace = await repository.detectFaceInfo(image);

        _result =
            'Пол: ${detectFace.faces.first.attributes.gender.value}, Возраст: ${detectFace.faces.first.attributes.age.value}';

        return (result: _result, image: image);
      } on Object catch (_) {
        return (result: 'Не получилось проанализировать =(', image: image);
      }
    }

    return (result: 'Ошибка загрузки', image: null);
  }
}
