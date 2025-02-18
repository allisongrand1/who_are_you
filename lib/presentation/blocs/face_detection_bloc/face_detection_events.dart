sealed class FaceDetectionEvents {
  static FaceDetectionEvents loadImage() => LoadImageEvent();
  static FaceDetectionEvents analyzeImage() => AnalyzeImageEvent();
}

class LoadImageEvent extends FaceDetectionEvents {}

class AnalyzeImageEvent extends FaceDetectionEvents {}

extension FaceDetectionEventsExtension<T> on FaceDetectionEvents {
  T map({
    required T Function(LoadImageEvent) loadImage,
    required T Function(AnalyzeImageEvent) analyzeImage,
  }) {
    return switch (this) {
      LoadImageEvent event => loadImage(event),
      AnalyzeImageEvent event => analyzeImage(event),
    };
  }
}
