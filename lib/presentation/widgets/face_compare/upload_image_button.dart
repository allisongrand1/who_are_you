import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_events.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_states.dart';

class UploadImageCompareButton extends StatelessWidget {
  final int buttonIndex;

  const UploadImageCompareButton({super.key, required this.buttonIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FaceCompareBloc, FaceCompareStates>(
      builder: (context, state) {
        return state.mapOrElse(
          loading: () => CircularProgressIndicator(),
          loaded: (state) => Image.file(state.images.first, height: 200),
          orElse: () => DecoratedBox(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: ElevatedButton(
              onPressed: () => context.read<FaceCompareBloc>().add(FaceCompareEvents.loadImages(buttonIndex)),
              child: Center(child: Text("Загрузить фото")),
            ),
          ),
        );
      },
    );
  }
}
