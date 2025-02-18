import 'package:dio/dio.dart';
import 'package:who_are_you/core/environment/environment.dart';

class InfrastructureInterface {
  final Dio dio;

  InfrastructureInterface({
    required this.dio,
  });

  factory InfrastructureInterface.base() => _BaseInfrastructureInterface(dio: Dio(Environment.dioBaseOptions));
}

class _BaseInfrastructureInterface extends InfrastructureInterface {
  _BaseInfrastructureInterface({required super.dio});
}
