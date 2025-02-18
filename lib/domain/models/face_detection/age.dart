import 'package:equatable/equatable.dart';

class Age extends Equatable {
  final int value;

  const Age({required this.value});

  @override
  List<Object> get props => [value];
}
