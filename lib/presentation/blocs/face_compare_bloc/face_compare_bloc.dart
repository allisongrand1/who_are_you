import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/domain/use_cases/analyze_two_images_use_case.dart';
import 'package:who_are_you/domain/use_cases/load_two_images_use_case.dart';
import 'package:who_are_you/domain/use_cases/pick_image_use_case.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_events.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_states.dart';

class FaceCompareBloc extends Bloc<FaceCompareEvents, FaceCompareStates> {
  final PickImageUseCase pickImageUseCase;
  final LoadTwoImagesUseCase loadTwoImagesUseCase;
  final AnalyzeTwoImagesUseCase analyzeTwoImagesUseCase;

  FaceCompareBloc(
    this.loadTwoImagesUseCase,
    this.analyzeTwoImagesUseCase,
    this.pickImageUseCase,
  ) : super(FaceCompareStates.init()) {
    on<FaceCompareEvents>(
      (event, emit) => event.map(
        loadImages: (event) => _loadImages(event, emit),
        analyzeImages: (event) => _analyzeImages(event, emit),
      ),
    );
  }

  Future<void> _loadImages(LoadImagesEvent event, Emitter<FaceCompareStates> emit) async {
    emit(FaceCompareStates.loading(images: state.images));

    final file = await pickImageUseCase.call();

    if (file.image != null) {
      final infoCompare = await loadTwoImagesUseCase.call(index: event.index, images: state.images, file: file.image!);

      emit(
        FaceCompareStates.loaded(
          images: infoCompare.images,
          info: infoCompare.result,
        ),
      );
    } else {
      emit(FaceCompareStates.error(errorMessage: 'Ошибка загрузки фото из галереи', images: state.images));
    }
  }

  Future<void> _analyzeImages(AnalyzeImagesEvent event, Emitter<FaceCompareStates> emit) async {
    emit(FaceCompareStates.loading(images: state.images, info: 'Анализирую...'));

    final result = await analyzeTwoImagesUseCase.call(state.images);

    emit(
      FaceCompareStates.loaded(
        info: result.result,
        images: state.images,
      ),
    );
  }
}
