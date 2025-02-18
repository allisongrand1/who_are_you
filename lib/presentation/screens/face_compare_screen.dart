import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_events.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_states.dart';
import 'package:who_are_you/presentation/widgets/face_compare/upload_image_button.dart';

class FaceCompareScreen extends StatelessWidget {
  const FaceCompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Сравни два фото")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                UploadImageCompareButton(
                  buttonIndex: 0,
                ),
                UploadImageCompareButton(
                  buttonIndex: 1,
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<FaceCompareBloc>().add(FaceCompareEvents.analyzeImages()),
              child: Text("Анализировать"),
            ),
            SizedBox(height: 20),
            BlocBuilder<FaceCompareBloc, FaceCompareStates>(
              builder: (context, state) {
                return state.mapOrElse(
                  loading: () => SizedBox.shrink(),
                  loaded: (state) => Text(state.info, textAlign: TextAlign.center),
                  error: (state) => Text(state.errorMessage, textAlign: TextAlign.center),
                  orElse: () => SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
