import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/data/models/notes_model.dart';
import 'package:nur_note_app/screens/detail/detail_screen.dart';
import 'package:nur_note_app/screens/notes/widgets/notes_container.dart';
import '../../../../utils/colors/app_colors.dart';

class ItemSearch extends SearchDelegate<String> {
  final List<NotesModel> items; // List of items to search from

  ItemSearch({required this.items});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<NotesModel> results = items
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Wrap(
      children: List.generate(
        results.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(notesModel: results[index]),
              ),
            );
          },
          child: NotesContainer(notesModel: results[index]),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<NotesModel> suggestionList = query.isEmpty
        ? []
        : items
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return Wrap(
      children: List.generate(
        suggestionList.length,
        (index) => NotesContainer(
          notesModel: suggestionList[index],
        ),
      ),
    );
  }
}
