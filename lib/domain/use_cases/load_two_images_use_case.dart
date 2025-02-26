import 'dart:io';

import 'package:who_are_you/config/constants/typedef/typedefs.dart';

class LoadTwoImagesUseCase {
  Future<LoadedTwoImages> call({required int index, required List<File?> images, required File file}) async {
    final newImages = List<File?>.from(images);

    if (newImages.length > index) {
      newImages[index] = file;
    } else {
      newImages.add(file);
    }

    if (newImages.length < 2) {
      return (result: 'Фото загружено! Добавь еще одно фото для сравнения', images: newImages);
    }

    return (result: 'Фотографии загружены', images: newImages);
  }
}
