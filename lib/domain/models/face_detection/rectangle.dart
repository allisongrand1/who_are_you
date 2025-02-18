import 'package:equatable/equatable.dart';

class Rectangle extends Equatable {
  final int top;
  final int left;
  final int width;
  final int height;

  const Rectangle({
    required this.top,
    required this.left,
    required this.width,
    required this.height,
  });

  @override
  List<Object> get props => [top, left, width, height];
}
