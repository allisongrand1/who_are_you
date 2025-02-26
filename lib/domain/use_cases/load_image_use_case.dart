import 'dart:io';

import 'package:who_are_you/config/constants/typedef/typedefs.dart';

class LoadImageUseCase {
  Future<LoadedImage> call(File? file) async {
    if (file != null) {
      return (result: "Фото загружено! Нажми 'Анализировать'");
    }
    return (result: 'Ошибка загрузки');
  }
}
