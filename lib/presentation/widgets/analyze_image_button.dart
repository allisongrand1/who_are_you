import 'package:flutter/material.dart';

class AnalyzeImageButton extends StatelessWidget {
  final VoidCallback onTap;

  const AnalyzeImageButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text('Анализировать'),
    );
  }
}
