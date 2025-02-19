import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/domain/use_cases/analyze_image_use_case.dart';
import 'package:who_are_you/domain/use_cases/load_image_use_case.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_events.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_states.dart';

class FaceDetectionBloc extends Bloc<FaceDetectionEvents, FaceDetectionStates> {
  final LoadImageUseCase loadImageUseCase;
  final AnalyzeImageUseCase analyzeImageUseCase;

  FaceDetectionBloc(
    this.loadImageUseCase,
    this.analyzeImageUseCase,
  ) : super(FaceDetectionStates.init()) {
    on<FaceDetectionEvents>(
      (event, emit) => event.map(
        loadImage: (event) => _loadImage(event, emit),
        analyzeImage: (event) => _analyzeImage(event, emit),
      ),
    );
  }

  Future<void> _loadImage(LoadImageEvent event, Emitter<FaceDetectionStates> emit) async {
    emit(FaceDetectionStates.loading('Фото загружается...'));

    final infoDetection = await loadImageUseCase.call();

    if (infoDetection.image != null) {
      emit(
        FaceDetectionStates.loaded(
          info: infoDetection.result,
          image: infoDetection.image!,
        ),
      );
    } else {
      emit(FaceDetectionStates.error(errorMessage: infoDetection.result));
    }
  }

  Future<void> _analyzeImage(AnalyzeImageEvent event, Emitter<FaceDetectionStates> emit) async {
    final infoDetection = await analyzeImageUseCase.call();

    if (infoDetection.image != null) {
      emit(
        FaceDetectionStates.loaded(
          info: infoDetection.result,
          image: infoDetection.image!,
        ),
      );
    } else {
      emit(FaceDetectionStates.error(errorMessage: infoDetection.result));
    }
  }
}
