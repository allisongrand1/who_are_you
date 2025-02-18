sealed class FaceCompareEvents {
  static FaceCompareEvents loadImages(int imageNumber) => LoadImagesEvent(imageNumber);
  static FaceCompareEvents analyzeImages() => AnalyzeImagesEvent();
}

class LoadImagesEvent extends FaceCompareEvents {
  final int imageNumber;

  LoadImagesEvent(this.imageNumber);
}

class AnalyzeImagesEvent extends FaceCompareEvents {}

extension FaceCompareEventsExtension<T> on FaceCompareEvents {
  T map({
    required T Function(LoadImagesEvent) loadImages,
    required T Function(AnalyzeImagesEvent) analyzeImages,
  }) {
    return switch (this) {
      LoadImagesEvent event => loadImages(event),
      AnalyzeImagesEvent event => analyzeImages(event),
    };
  }
}
