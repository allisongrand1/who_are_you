import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:who_are_you/config/constants/typedef/typedefs.dart';
import 'package:who_are_you/data/storage/storage.dart';

class LoadImageUseCase {
  late final ImagePicker _picker;
  final Storage storage;

  LoadImageUseCase(this.storage) {
    _picker = ImagePicker();
  }

  File? _image;
  String _result = '';

  Future<LoadedImage> call() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await storage.setString(key: 'photo', value: pickedFile.path);

      _image = File(pickedFile.path);
      _result = "Фото загружено! Нажмите 'Анализировать'";

      return (result: _result, image: _image);
    }

    _result = "Ошибка загрузки";

    return (result: _result, image: null);
  }
}
