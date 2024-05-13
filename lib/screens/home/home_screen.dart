import 'package:flutter/material.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'HOME SCREEN',
          ),
        ),
      ),
    );
  }
}
