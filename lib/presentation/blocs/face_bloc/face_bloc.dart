import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_bloc/face_events.dart';
import 'package:who_are_you/presentation/blocs/face_bloc/face_states.dart';

class FaceBloc extends Bloc<FaceEvents, FaceStates> {
  FaceBloc() : super(InitFaceState()) {
    on<FaceEvents>(
      (event, emit) => event.map(
        init: (event) => _init(event, emit),
      ),
    );
  }

  Future<void> _init(FaceEvent event, Emitter<FaceStates> emit) async {}
}
