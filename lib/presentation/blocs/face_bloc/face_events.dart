sealed class FaceEvents {
  static FaceEvents feature() => FaceEvent();
}

class FaceEvent extends FaceEvents {}

extension FaceEventsExtension<T> on FaceEvents {
  T map({
    required T Function(FaceEvent) init,
  }) {
    return switch (this) {
      FaceEvent event => init(event),
    };
  }
}
