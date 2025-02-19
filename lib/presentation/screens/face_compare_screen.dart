import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_events.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_states.dart';
import 'package:who_are_you/presentation/widgets/analyze_image_button.dart';
import 'package:who_are_you/presentation/widgets/decoration_box.dart';
import 'package:who_are_you/presentation/widgets/face_compare/upload_box_button.dart';

class FaceCompareScreen extends StatelessWidget {
  const FaceCompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Найди сходства двух людей',
          softWrap: true,
          maxLines: 2,
        ),
      ),
      body: DecorationBox(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UploadBoxButton(
                    onTap: () => context.read<FaceCompareBloc>().add(FaceCompareEvents.loadImages(0)),
                    indexButton: 0,
                  ),
                  const SizedBox(width: 15),
                  UploadBoxButton(
                    onTap: () => context.read<FaceCompareBloc>().add(FaceCompareEvents.loadImages(1)),
                    indexButton: 1,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AnalyzeImageButton(
                onTap: () => context.read<FaceCompareBloc>().add(FaceCompareEvents.analyzeImages()),
              ),
              const SizedBox(height: 20),
              BlocBuilder<FaceCompareBloc, FaceCompareStates>(
                builder: (context, state) {
                  return state.mapOrElse(
                    loaded: (state) => Text(state.info, textAlign: TextAlign.center),
                    error: (state) => Text(state.errorMessage, textAlign: TextAlign.center),
                    orElse: () => const SizedBox(height: 10),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
