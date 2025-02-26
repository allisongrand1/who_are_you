import 'dart:io';

class FaceCompare {
  final List<File?> images;
  final bool isLoading;
  final String info;
  final String errorMessage;

  const FaceCompare({
    required this.images,
    this.isLoading = false,
    this.info = '',
    this.errorMessage = '',
  });

  FaceCompare copyWith({
    List<File?>? images,
    bool? isLoading,
    String? info,
    String? errorMessage,
  }) {
    return FaceCompare(
      images: images ?? this.images,
      isLoading: isLoading ?? this.isLoading,
      info: info ?? this.info,
      errorMessage: errorMessage ?? '',
    );
  }
}

sealed class FaceCompareStates {
  final List<File?> images;
  final String? info;
  final String? errorMessage;

  const FaceCompareStates({
    required this.images,
    this.info = '',
    this.errorMessage = '',
  });

  static FaceCompareStates init() => InitFaceCompareState(images: []);

  static FaceCompareStates loading({
    required List<File?> images,
    String? info,
  }) =>
      LoadingFaceCompareState(
        images: images,
        info: info,
      );

  static FaceCompareStates loaded({
    required List<File?> images,
    required String info,
  }) =>
      LoadedFaceCompareState(images: images, info: info);

  static FaceCompareStates error({
    required List<File?> images,
    required String errorMessage,
    String? info,
  }) =>
      ErrorFaceCompareState(
        errorMessage: errorMessage,
        images: images,
        info: info,
      );
}

class InitFaceCompareState extends FaceCompareStates {
  InitFaceCompareState({
    required super.images,
    super.info,
    super.errorMessage,
  });
}

class LoadingFaceCompareState extends FaceCompareStates {
  LoadingFaceCompareState({
    required super.images,
    super.info,
    super.errorMessage,
  });
}

class LoadedFaceCompareState extends FaceCompareStates {
  LoadedFaceCompareState({
    required super.images,
    required super.info,
    super.errorMessage,
  });
}

class ErrorFaceCompareState extends FaceCompareStates {
  ErrorFaceCompareState({
    required super.images,
    super.info,
    super.errorMessage,
  });
}

extension FaceCompareStatesExtension<T> on FaceCompareStates {
  T mapOrElse({
    required T Function() orElse,
    T Function()? init,
    T Function(LoadingFaceCompareState state)? loading,
    T Function(LoadedFaceCompareState state)? loaded,
    T Function(ErrorFaceCompareState state)? error,
  }) {
    final state = this;

    return switch (state) {
      InitFaceCompareState() when init != null => init(),
      LoadingFaceCompareState() when loading != null => loading(state),
      LoadedFaceCompareState() when loaded != null => loaded(state),
      ErrorFaceCompareState() when error != null => error(state),
      _ => orElse(),
    };
  }
}
