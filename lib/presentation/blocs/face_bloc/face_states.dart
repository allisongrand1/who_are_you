sealed class FaceStates {
  static FaceStates init() => InitFaceState();
  static FaceStates loading() => InitFaceState();
  static FaceStates loaded() => InitFaceState();
  static FaceStates error() => InitFaceState();
}

class InitFaceState extends FaceStates {}

class LoadingFaceState extends FaceStates {}

class LoadedFaceState extends FaceStates {}

class ErrorFaceState extends FaceStates {}

extension FaceStatesExtension<T> on FaceStates {
  T map({
    required T Function() init,
    required T Function() loading,
    required T Function(LoadedFaceState state) loaded,
    required T Function(ErrorFaceState error) error,
  }) {
    return switch (this) {
      InitFaceState _ => init(),
      LoadingFaceState _ => loading(),
      LoadedFaceState state => loaded(state),
      ErrorFaceState state => error(state),
    };
  }
}
