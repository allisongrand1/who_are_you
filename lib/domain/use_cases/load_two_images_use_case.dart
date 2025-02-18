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
  String _result = '';

  Future<LoadedImages> call(int numberImage) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await storage.setString(key: 'photo-$numberImage', value: pickedFile.path);

      if (numberImage == 0) {
        _images.add(File(pickedFile.path));
        _result = "Фото загружено! Добавьте еще одно фото для сравнения";

        return (result: _result, images: _images);
      }

      _images.add(File(pickedFile.path));
      _result = "Фотографии загружены";

      return (result: _result, images: _images);
    }

    _result = "Ошибка загрузки";

    return (result: _result, images: null);
  }
}
