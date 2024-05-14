import 'package:flutter/material.dart';
import 'package:nur_note_app/data/models/notes_model.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.notesModel,
  });

  final NotesModel notesModel;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      child: Scaffold(),
      value: systemUiOverlayStyle,
    );
  }
}
