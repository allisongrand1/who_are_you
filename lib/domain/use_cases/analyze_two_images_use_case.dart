import 'dart:io';

import 'package:who_are_you/config/constants/typedef/typedefs.dart';
import 'package:who_are_you/data/storage/storage.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';

class AnalyzeTwoImagesUseCase {
  final FaceDetectionRepository repository;
  final Storage storage;

  AnalyzeTwoImagesUseCase({required this.repository, required this.storage});

  Future<AnalyzeTwoImages> call(List<File?> images) async {
    if (images[0] == null || images[1] == null) {
      return (result: 'Загрузите оба фото для анализа');
    }

    final compareFace = await repository.compareTwoFaces(images: images.whereType<File>().toList());

    return compareFace.fold(
      left: (failure) => (result: failure.message),
      right: (success) => (result: 'Совпадение на ${success.confidence} %'),
    );
  }
}
