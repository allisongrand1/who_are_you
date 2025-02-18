import 'dart:io';

sealed class FaceCompareStates {
  static FaceCompareStates init() => InitFaceCompareState();
  static FaceCompareStates loading() => LoadingFaceCompareState();
  static FaceCompareStates loaded({required String info, required Set<File> images}) =>
      LoadedFaceCompareState(images: images, info: info);
  static FaceCompareStates error({required String errorMessage, Set<File>? images}) => ErrorFaceCompareState(
        errorMessage: errorMessage,
        images: images,
      );
}

class InitFaceCompareState extends FaceCompareStates {}

class LoadingFaceCompareState extends FaceCompareStates {}

class LoadedFaceCompareState extends FaceCompareStates {
  final String info;
  final Set<File> images;
  LoadedFaceCompareState({required this.images, required this.info});
}

class ErrorFaceCompareState extends FaceCompareStates {
  final String errorMessage;
  final Set<File>? images;

  ErrorFaceCompareState({required this.errorMessage, required this.images});
}

extension FaceCompareStatesExtension<T> on FaceCompareStates {
  T mapOrElse({
    T Function()? init,
    T Function()? loading,
    T Function(LoadedFaceCompareState state)? loaded,
    T Function(ErrorFaceCompareState state)? error,
    required T Function() orElse,
  }) {
    final state = this;

    return switch (state) {
      InitFaceCompareState() when init != null => init(),
      LoadingFaceCompareState() when loading != null => loading(),
      LoadedFaceCompareState() when loaded != null => loaded(state),
      ErrorFaceCompareState() when error != null => error(state),
      _ => orElse(),
    };
  }
}
