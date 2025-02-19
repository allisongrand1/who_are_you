import 'dart:io';

sealed class FaceDetectionStates {
  static FaceDetectionStates init() => InitFaceDetectionState();

  static FaceDetectionStates loading(String message) => LoadingFaceDetectionState(message);

  static FaceDetectionStates loaded({required String info, required File image}) =>
      LoadedFaceDetectionState(image: image, info: info);

  static FaceDetectionStates error({required String errorMessage, File? image}) => ErrorFaceDetectionState(
        errorMessage: errorMessage,
        image: image,
      );
}

class InitFaceDetectionState extends FaceDetectionStates {}

class LoadingFaceDetectionState extends FaceDetectionStates {
  final String message;

  LoadingFaceDetectionState(this.message);
}

class LoadedFaceDetectionState extends FaceDetectionStates {
  final String info;
  final File image;

  LoadedFaceDetectionState({required this.image, required this.info});
}

class ErrorFaceDetectionState extends FaceDetectionStates {
  final String errorMessage;
  final File? image;

  ErrorFaceDetectionState({required this.errorMessage, this.image});
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
