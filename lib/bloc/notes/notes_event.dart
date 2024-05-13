import 'package:equatable/equatable.dart';
import 'package:nur_note_app/data/models/notes_model.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();
}

class AddNoteEvent extends NotesEvent {
  final NotesModel notesModel;

  const AddNoteEvent(
    this.notesModel,
  );

  @override
  List<Object?> get props => [
        notesModel,
      ];
}

class UpdateNoteEvent extends NotesEvent {
  final NotesModel notesModel;

  const UpdateNoteEvent(
    this.notesModel,
  );

  @override
  List<Object?> get props => [
        notesModel,
      ];
}

class DeleteNoteEvent extends NotesEvent {
  final String uuid;

  const DeleteNoteEvent(
    this.uuid,
  );

  @override
  List<Object?> get props => [
        uuid,
      ];
}

class ListenNoteEvent extends NotesEvent {
  final String categoryName;

  const ListenNoteEvent(
    this.categoryName,
  );

  @override
  List<Object?> get props => [
        categoryName,
      ];
}

class CalculateFileCountEvent extends NotesEvent {
  @override
  List<Object?> get props => [];
}
