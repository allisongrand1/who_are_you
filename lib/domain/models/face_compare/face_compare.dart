import 'package:equatable/equatable.dart';

class FaceCompare extends Equatable {
  final String requestId;
  final int timeUsed;
  final String confidence;
  final String? errorMessage;

  const FaceCompare({
    required this.requestId,
    required this.timeUsed,
    required this.confidence,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        requestId,
        timeUsed,
        confidence,
        errorMessage,
      ];
}
