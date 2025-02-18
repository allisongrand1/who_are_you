import 'package:dio/dio.dart';

const String _baseUrl = 'https://api-us.faceplusplus.com/facepp/v3/';

sealed class EnvironmentInterface {
  static Duration sendTimeout = const Duration(seconds: 10);
  static Duration connectTimeout = const Duration(seconds: 10);
  static Duration receiveTimeout = const Duration(seconds: 10);

  static EnvironmentInterface createProductEnvironment() => _ProductEnvironment();

  String get appName => 'FaceDetect';

  String get apiKey => 'l0Dnd9AQyMD5qd9nbAU2g4UGQllqVR71';
  String get apiSecret => 'btgu65wy2kgwCZ_ivK0xHXuXW7NjITs0';

  BaseOptions get dioBaseOptions {
    return BaseOptions(
      baseUrl: _baseUrl,
      sendTimeout: sendTimeout,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
  }
}

class _ProductEnvironment extends EnvironmentInterface {}
