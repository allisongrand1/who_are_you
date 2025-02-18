import 'dart:developer';

class ExceptionObserver {
  Future<void> onException(Object error, StackTrace stackTrace) async {
    log(
      '[$runtimeType]',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
