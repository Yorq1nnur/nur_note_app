import 'package:equatable/equatable.dart';
import 'package:nur_note_app/bloc/form_status/form_status.dart';
import 'package:nur_note_app/data/models/notes_model.dart';

class NotesState extends Equatable {
  const NotesState({
    required this.formStatus,
    required this.notes,
    required this.errorText,
    required this.countOfFilesInPersonal,
    required this.countOfFilesInAcademic,
    required this.countOfFilesInWork,
    required this.countOfFilesInOthers,
    required this.statusText,
  });

  final FormStatus formStatus;
  final List<NotesModel> notes;
  final String errorText;
  final String statusText;
  final int countOfFilesInPersonal;
  final int countOfFilesInAcademic;
  final int countOfFilesInWork;
  final int countOfFilesInOthers;

  NotesState copyWith({
    String? errorText,
    String? statusText,
    FormStatus? formStatus,
    List<NotesModel>? notes,
    int? countOfFilesInPersonal,
    int? countOfFilesInAcademic,
    int? countOfFilesInWork,
    int? countOfFilesInOthers,
  }) =>
      NotesState(
        formStatus: formStatus ?? this.formStatus,
        notes: notes ?? this.notes,
        errorText: errorText ?? this.errorText,
        countOfFilesInPersonal:
            countOfFilesInPersonal ?? this.countOfFilesInPersonal,
        countOfFilesInAcademic:
            countOfFilesInPersonal ?? this.countOfFilesInAcademic,
        countOfFilesInWork:
            countOfFilesInPersonal ?? this.countOfFilesInAcademic,
        countOfFilesInOthers: countOfFilesInOthers ?? this.countOfFilesInOthers,
        statusText: statusText ?? this.statusText,
      );

  static NotesState initial() => const NotesState(
        formStatus: FormStatus.pure,
        notes: [],
        errorText: '',
        countOfFilesInPersonal: 0,
        countOfFilesInAcademic: 0,
        countOfFilesInWork: 0,
        countOfFilesInOthers: 0,
        statusText: '',
      );

  @override
  List<Object?> get props => [
        formStatus,
        notes,
        errorText,
        countOfFilesInPersonal,
        countOfFilesInAcademic,
        countOfFilesInWork,
        countOfFilesInOthers,
        statusText,
      ];
}
