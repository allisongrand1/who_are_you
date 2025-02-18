import 'package:who_are_you/core/scopes/data_source_scope.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository.dart';
import 'package:who_are_you/domain/repositories/face_detection_repository_impl.dart';

class RepositoriesScope {
  final FaceDetectionRepository faceDetectionRepository;

  const RepositoriesScope({
    required this.faceDetectionRepository,
  });

  factory RepositoriesScope.create({
    required DataSourcesScope dataSourcesScope,
  }) {
    return RepositoriesScope(
      faceDetectionRepository: FaceDetectionRepositoryImpl(
        faceDetectionDataSource: dataSourcesScope.faceDetectionDataSource,
      ),
    );
  }
}
