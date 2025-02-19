import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:who_are_you/config/constants/typedef/typedefs.dart';
import 'package:who_are_you/data/storage/storage.dart';

class LoadTwoImagesUseCase {
  late final ImagePicker _picker;
  final Storage storage;

  LoadTwoImagesUseCase(this.storage) {
    _picker = ImagePicker();
  }

  final Set<File> _images = {};

  Future<LoadedImages> call(int numberImage) async {
    if (_images.length == 2) {
      _images.clear();
    }

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await storage.setString(key: 'photo-$numberImage', value: pickedFile.path);

      final result = switch (numberImage) {
        0 => 'Фото загружено! Добавь еще одно фото для сравнения',
        _ => 'Фотографии загружены',
      };

      if (numberImage == 0) {
        _images.add(File(pickedFile.path));

        return (result: result, images: _images);
      }

      _images.add(File(pickedFile.path));

      return (result: result, images: _images);
    }

    return (result: 'Ошибка загрузки', images: null);
  }
}
