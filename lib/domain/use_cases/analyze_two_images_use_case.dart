import 'dart:io';

import 'package:who_are_you/config/constants/typedef/typedefs.dart';
import 'package:who_are_you/data/storage/storage.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';

class AnalyzeTwoImagesUseCase {
  final FaceDetectionRepository repository;
  final Storage storage;

  AnalyzeTwoImagesUseCase({required this.repository, required this.storage});

  final Set<File> _images = {};

  Future<LoadedImages> call() async {
    if (_images.length == 2) {
      _images.clear();
    }

    for (var i = 0; i < 2; i++) {
      final path = await storage.getString(key: 'photo-$i');
      if (path != null) {
        final image = File(path);
        _images.add(image);
      }
    }

    try {
      final compareFace = await repository.compareTwoFaces(images: _images);

      await storage.clear();

      return (result: 'Совпадение на ${compareFace.confidence} %', images: _images);
    } on Object catch (_) {
      return (result: 'Не получилось проанализировать =(', images: _images);
    }
  }
}
