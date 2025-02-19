import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_events.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_states.dart';
import 'package:who_are_you/presentation/widgets/analyze_image_button.dart';
import 'package:who_are_you/presentation/widgets/decoration_box.dart';
import 'package:who_are_you/presentation/widgets/load_image_button.dart';

class FaceDetectionScreen extends StatelessWidget {
  const FaceDetectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Определи пол и возраст по фото',
          softWrap: true,
          maxLines: 2,
        ),
      ),
      body: DecorationBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FaceDetectionBloc, FaceDetectionStates>(
                builder: (context, state) {
                  return state.mapOrElse(
                    loading: (state) => const CircularProgressIndicator(),
                    loaded: (state) => Image.file(state.image, height: 200),
                    orElse: () => const Text('Выберите фото'),
                  );
                },
              ),
              const SizedBox(height: 20),
              LoadImageButton(
                onTap: () => context.read<FaceDetectionBloc>().add(FaceDetectionEvents.loadImage()),
              ),
              const SizedBox(height: 20),
              AnalyzeImageButton(
                onTap: () => context.read<FaceDetectionBloc>().add(FaceDetectionEvents.analyzeImage()),
              ),
              const SizedBox(height: 20),
              BlocBuilder<FaceDetectionBloc, FaceDetectionStates>(
                builder: (context, state) {
                  return state.mapOrElse(
                    loading: (state) => Text(state.message, textAlign: TextAlign.center),
                    loaded: (state) => Text(state.info, textAlign: TextAlign.center),
                    error: (state) => Text(state.errorMessage, textAlign: TextAlign.center),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
