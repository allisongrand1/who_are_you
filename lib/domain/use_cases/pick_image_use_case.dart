import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:who_are_you/config/constants/typedef/typedefs.dart';

class PickImageUseCase {
  final ImagePicker _picker;
  PickImageUseCase() : _picker = ImagePicker();

  Future<PickImage> call() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return (result: '', image: File(pickedFile.path));
    }
    return (result: '', image: null);
  }
}
