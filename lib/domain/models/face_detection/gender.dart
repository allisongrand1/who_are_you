import 'package:equatable/equatable.dart';

class Gender extends Equatable {
  final String value;

  const Gender({required this.value});

  @override
  List<Object> get props => [value];
}
