import 'package:flutter/material.dart';
import 'package:nur_note_app/data/models/notes_model.dart';
import 'package:nur_note_app/screens/detail/detail_screen.dart';
import 'package:nur_note_app/screens/notes/widgets/notes_container.dart';

class ItemSearch extends SearchDelegate<String> {
  final List<NotesModel> notes; // List of items to search from

  ItemSearch({required this.notes});

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
    final List<NotesModel> searchOfResults = notes
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Wrap(
      children: List.generate(
        searchOfResults.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(notesModel: searchOfResults[index]),
              ),
            );
          },
          child: NotesContainer(notesModel: searchOfResults[index]),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<NotesModel> suggestionList = query.isEmpty
        ? []
        : notes
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
