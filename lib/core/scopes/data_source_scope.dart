import 'package:who_are_you/core/infrastructure/infrastructure.dart';
import 'package:who_are_you/data/face_detection_data_source.dart';
import 'package:who_are_you/data/face_detection_data_source_impl.dart';

class DataSourcesScope {
  final FaceDetectionDataSource faceDetectionDataSource;

  const DataSourcesScope({
    required this.faceDetectionDataSource,
  });

  factory DataSourcesScope.create({
    required InfrastructureInterface infrastructureScope,
  }) {
    return DataSourcesScope(
      faceDetectionDataSource: FaceDetectionDataSourceImpl(
        dio: infrastructureScope.dio,
      ),
    );
  }
}
