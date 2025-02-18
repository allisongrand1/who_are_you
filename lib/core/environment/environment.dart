// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:who_are_you/core/environment/environment_interface.dart';
import 'package:who_are_you/core/environment/environment_typedef.dart';

abstract class Environment {
  static EnvironmentType _type = EnvironmentType.product;
  static EnvironmentInterface _data = EnvironmentInterface.createProductEnvironment();

  static void setEnvironment(EnvironmentType type) {
    _type = type;

    _data = switch (type) {
      EnvironmentType.product => EnvironmentInterface.createProductEnvironment(),
    };
  }

  static String get appName => _data.appName;

  static String get apiKey => _data.apiKey;

  static String get apiSecret => _data.apiSecret;

  static BaseOptions get dioBaseOptions => _data.dioBaseOptions;
}
