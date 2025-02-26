import 'dart:developer';

class ExceptionObserver {
  Future<void> onException(Object error, StackTrace stackTrace) async {
    log(
      'Ошибка на уровне runApp: [$runtimeType]',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
