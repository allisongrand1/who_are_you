import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_events.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_states.dart';

class FaceDetectionScreen extends StatelessWidget {
  const FaceDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Определи пол и возраст по фото")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FaceDetectionBloc, FaceDetectionStates>(
              builder: (context, state) {
                return state.mapOrElse(
                  loading: (state) => CircularProgressIndicator(),
                  loaded: (state) => Image.file(state.image, height: 200),
                  orElse: () => Text("Выберите фото"),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<FaceDetectionBloc>().add(FaceDetectionEvents.loadImage()),
              child: Text("Загрузить фото"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<FaceDetectionBloc>().add(FaceDetectionEvents.analyzeImage()),
              child: Text("Анализировать"),
            ),
            SizedBox(height: 20),
            BlocBuilder<FaceDetectionBloc, FaceDetectionStates>(
              builder: (context, state) {
                return state.mapOrElse(
                  loading: (state) => Text(state.message, textAlign: TextAlign.center),
                  loaded: (state) => Text(state.info, textAlign: TextAlign.center),
                  error: (state) => Text(state.errorMessage, textAlign: TextAlign.center),
                  orElse: () => SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


  //  ElevatedButton(
  //             onPressed: () async {
  //               String result = await analyzeFace(faceProvider.image!);
  //               faceProvider.updateResult(result);
  //             },
  //             child: Text("Анализировать"),
  //           ),