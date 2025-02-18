import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/domain/use_cases/analyze_two_images_use_case.dart';
import 'package:who_are_you/domain/use_cases/load_two_images_use_case.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_events.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_states.dart';

class FaceCompareBloc extends Bloc<FaceCompareEvents, FaceCompareStates> {
  final LoadTwoImagesUseCase loadTwoImagesUseCase;
  final AnalyzeTwoImagesUseCase analyzeTwoImagesUseCase;

  FaceCompareBloc(
    this.loadTwoImagesUseCase,
    this.analyzeTwoImagesUseCase,
  ) : super(InitFaceCompareState()) {
    on<FaceCompareEvents>(
      (event, emit) => event.map(
        loadImages: (event) => _loadImages(event, emit),
        analyzeImages: (event) => _analyzeImage(event, emit),
      ),
    );
  }

  Future<void> _loadImages(LoadImagesEvent event, Emitter<FaceCompareStates> emit) async {
    emit(FaceCompareStates.loading());

    final infoCompare = await loadTwoImagesUseCase.call(event.imageNumber);

    if (infoCompare.images != null) {
      emit(FaceCompareStates.loaded(
        info: infoCompare.result,
        images: infoCompare.images!,
      ));
    } else {
      emit(FaceCompareStates.error(errorMessage: infoCompare.result));
    }
  }

  Future<void> _analyzeImage(AnalyzeImagesEvent event, Emitter<FaceCompareStates> emit) async {
    final infoCompare = await analyzeTwoImagesUseCase.call();

    if (infoCompare.images != null) {
      emit(FaceCompareStates.loaded(
        info: infoCompare.result,
        images: infoCompare.images!,
      ));
    } else {
      emit(FaceCompareStates.error(errorMessage: infoCompare.result));
    }
  }
}
