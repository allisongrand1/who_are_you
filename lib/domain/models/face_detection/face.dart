import 'package:equatable/equatable.dart';
import 'package:who_are_you/domain/models/face_detection/attributes.dart';
import 'package:who_are_you/domain/models/face_detection/rectangle.dart';

class Face extends Equatable {
  final String faceToken;
  final Rectangle faceRectangle;
  final Attributes attributes;

  const Face({
    required this.faceToken,
    required this.faceRectangle,
    required this.attributes,
  });

  @override
  List<Object> get props => [faceToken, faceRectangle, attributes];
}
