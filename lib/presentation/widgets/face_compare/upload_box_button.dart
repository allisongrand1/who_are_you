import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_states.dart';

class UploadBoxButton extends StatelessWidget {
  final int indexButton;
  final VoidCallback onTap;
  const UploadBoxButton({required this.onTap, required this.indexButton, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 200,
        width: width / 3,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black45),
          ),
          child: BlocBuilder<FaceCompareBloc, FaceCompareStates>(
            builder: (context, state) {
              final image = state.images.elementAtOrNull(indexButton);

              if (image != null) {
                return Image.file(
                  image,
                  fit: BoxFit.cover,
                );
              }
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo,
                      color: Colors.black45,
                    ),
                    Text('Выбери фото'),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
