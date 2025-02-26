sealed class FaceDetectionStates {
  final String image;
  final String? info;
  final String? errorMessage;

  const FaceDetectionStates({
    this.image = '',
    this.info = '',
    this.errorMessage = '',
  });

  static FaceDetectionStates init() => InitFaceDetectionState(image: '');

  static FaceDetectionStates loading({String? message, String? image}) => LoadingFaceDetectionState(
        info: message,
        image: image ?? '',
      );

  static FaceDetectionStates loaded({required String info, required String image}) =>
      LoadedFaceDetectionState(image: image, info: info);

  static FaceDetectionStates error({required String errorMessage, String? image}) => ErrorFaceDetectionState(
        errorMessage: errorMessage,
        image: image ?? '',
      );
}

class InitFaceDetectionState extends FaceDetectionStates {
  InitFaceDetectionState({required super.image});
}

class LoadingFaceDetectionState extends FaceDetectionStates {
  LoadingFaceDetectionState({required super.image, super.info});
}

class LoadedFaceDetectionState extends FaceDetectionStates {
  LoadedFaceDetectionState({required super.image, super.info});
}

class ErrorFaceDetectionState extends FaceDetectionStates {
  ErrorFaceDetectionState({super.image, super.errorMessage});
}

extension FaceDetectionStatesExtension<T> on FaceDetectionStates {
  T mapOrElse({
    required T Function() orElse,
    T Function()? init,
    T Function(LoadingFaceDetectionState state)? loading,
    T Function(LoadedFaceDetectionState state)? loaded,
    T Function(ErrorFaceDetectionState state)? error,
  }) {
    final state = this;

    return switch (state) {
      InitFaceDetectionState() when init != null => init(),
      LoadingFaceDetectionState() when loading != null => loading(state),
      LoadedFaceDetectionState() when loaded != null => loaded(state),
      ErrorFaceDetectionState() when error != null => error(state),
      _ => orElse(),
    };
  }
}
