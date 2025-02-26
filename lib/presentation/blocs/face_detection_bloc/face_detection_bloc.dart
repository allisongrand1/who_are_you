import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/domain/use_cases/analyze_image_use_case.dart';
import 'package:who_are_you/domain/use_cases/load_image_use_case.dart';
import 'package:who_are_you/domain/use_cases/pick_image_use_case.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_events.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_states.dart';

class FaceDetectionBloc extends Bloc<FaceDetectionEvents, FaceDetectionStates> {
  final LoadImageUseCase loadImageUseCase;
  final AnalyzeImageUseCase analyzeImageUseCase;
  final PickImageUseCase pickImageUseCase;

  FaceDetectionBloc(
    this.loadImageUseCase,
    this.analyzeImageUseCase,
    this.pickImageUseCase,
  ) : super(FaceDetectionStates.init()) {
    on<FaceDetectionEvents>(
      (event, emit) => event.map(
        loadImage: (event) => _loadImage(event, emit),
        analyzeImage: (event) => _analyzeImage(event, emit),
      ),
    );
  }

  Future<void> _loadImage(LoadImageEvent event, Emitter<FaceDetectionStates> emit) async {
    emit(FaceDetectionStates.loading(message: 'Фото загружается...'));

    final file = await pickImageUseCase.call();

    if (file.image != null) {
      final image = await loadImageUseCase.call(file.image);

      emit(
        FaceDetectionStates.loaded(
          image: file.image!.path,
          info: image.result,
        ),
      );
    } else {
      emit(FaceDetectionStates.error(errorMessage: file.result));
    }
  }

  Future<void> _analyzeImage(AnalyzeImageEvent event, Emitter<FaceDetectionStates> emit) async {
    log('${state} : ${state.image}');
    emit(FaceDetectionStates.loading(message: 'Анализирую...', image: state.image));

    if (state.image.isNotEmpty) {
      final file = await analyzeImageUseCase.call(File(state.image));

      emit(
        FaceDetectionStates.loaded(
          info: file.result,
          image: state.image,
        ),
      );
    } else {
      emit(FaceDetectionStates.error(errorMessage: 'Добавьте фото'));
    }
  }
}
