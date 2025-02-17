import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FaceAttributesScreen extends StatelessWidget {
  const FaceAttributesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final faceProvider = Provider.of<FaceRecognitionProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Кто ты из...")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('FaceAttributesScreen'),
            ),
            // faceProvider.image == null ? Text("Выберите фото") : Image.file(faceProvider.image!, height: 200),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () => faceProvider.pickImage(),
            //   child: Text("Загрузить фото"),
            // ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () async {
            //     String result = await analyzeFace(faceProvider.image!);
            //     faceProvider.updateResult(result);
            //   },
            //   child: Text("Анализировать"),
            // ),
            // SizedBox(height: 20),
            // Text(faceProvider.result, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

Future<String> analyzeFace(File imageFile) async {
  final apiKey = "l0Dnd9AQyMD5qd9nbAU2g4UGQllqVR71";
  final apiSecret = "btgu65wy2kgwCZ_ivK0xHXuXW7NjITs0";
  final url = "https://api-us.faceplusplus.com/facepp/v3/detect";

  FormData formData = FormData.fromMap({
    "api_key": apiKey,
    "api_secret": apiSecret,
    "image_file": await MultipartFile.fromFile(imageFile.path),
    "return_attributes": "gender,age,emotion"
  });

  try {
    var response = await Dio().post(url, data: formData);
    if (response.statusCode == 200) {
      var data = response.data;
      return "Пол: ${data['faces'][0]['attributes']['gender']['value']}, Возраст: ${data['faces'][0]['attributes']['age']['value']}";
    } else {
      return "Ошибка анализа";
    }
  } catch (e) {
    return "Ошибка запроса: $e";
  }
}

class FaceRecognitionProvider with ChangeNotifier {
  File? _image;
  String _result = "Загрузите фото для анализа";

  File? get image => _image;
  String get result => _result;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _result = "Фото загружено! Нажмите 'Анализировать'";
      notifyListeners(); // Уведомляем UI об изменениях
    }
  }

  void updateResult(String newResult) {
    _result = newResult;
    notifyListeners();
  }
}
