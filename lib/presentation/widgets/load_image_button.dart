// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_bloc.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_events.dart';
import 'package:who_are_you/presentation/blocs/face_compare_bloc/face_compare_states.dart';

class LoadImageButton extends StatelessWidget {
  final VoidCallback onTap;

  const LoadImageButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text('Загрузить фото'),
    );
  }
}
