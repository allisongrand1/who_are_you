import 'dart:io';

import 'package:who_are_you/config/constants/enums/enums.dart';
import 'package:who_are_you/config/constants/typedef/typedefs.dart';
import 'package:who_are_you/data/storage/storage.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';

class AnalyzeTwoImagesUseCase {
  final FaceDetectionRepository repository;
  final Storage storage;

  AnalyzeTwoImagesUseCase({required this.repository, required this.storage});

  final Set<File> _images = {};
  String _result = '';

  Future<LoadedImages> call() async {
    for (var number in ImageNumber.values) {
      final path = await storage.getString(key: 'photo-$number');
      if (path != null) {
        final image = File(path);
        _images.add(image);
      }

      return (result: 'Ошибка загрузки', images: null);
    }

    try {
      final compareFace = await repository.compareTwoFaces(images: _images);

      _result = 'Совпадение на ${compareFace.confidence} %';

      return (result: _result, images: _images);
    } catch (e) {
      return (result: 'Ошибка загрузки: ${e.toString()}', images: null);
    }
  }
}
