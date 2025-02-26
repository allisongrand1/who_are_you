import 'package:who_are_you/core/scopes/repositories_scope.dart';
import 'package:who_are_you/data/storage/storage.dart';
import 'package:who_are_you/domain/use_cases/analyze_image_use_case.dart';
import 'package:who_are_you/domain/use_cases/analyze_two_images_use_case.dart';
import 'package:who_are_you/domain/use_cases/load_image_use_case.dart';
import 'package:who_are_you/domain/use_cases/load_two_images_use_case.dart';
import 'package:who_are_you/domain/use_cases/pick_image_use_case.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_detection_bloc/face_detection_bloc.dart';

class BlocScope {
  final FaceDetectionBloc faceDetectionBloc;
  final FaceCompareBloc faceCompareBloc;

  const BlocScope({
    required this.faceDetectionBloc,
    required this.faceCompareBloc,
  });

  factory BlocScope.create({
    required RepositoriesScope repositoriesScope,
    required Storage storage,
  }) {
    return BlocScope(
      faceDetectionBloc: FaceDetectionBloc(
        LoadImageUseCase(),
        AnalyzeImageUseCase(
          repository: repositoriesScope.faceDetectionRepository,
          storage: storage,
        ),
        PickImageUseCase(),
      ),
      faceCompareBloc: FaceCompareBloc(
        LoadTwoImagesUseCase(),
        AnalyzeTwoImagesUseCase(
          repository: repositoriesScope.faceDetectionRepository,
          storage: storage,
        ),
        PickImageUseCase(),
      ),
    );
  }
}
