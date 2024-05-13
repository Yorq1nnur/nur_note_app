import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nur_note_app/bloc/form_status/form_status.dart';
import 'package:nur_note_app/bloc/notes/notes_event.dart';
import 'package:nur_note_app/bloc/notes/notes_state.dart';
import 'package:nur_note_app/data/models/notes_model.dart';
import 'package:nur_note_app/data/repo/notes_repo.dart';
import 'package:nur_note_app/data/response/my_response.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc(
    this.notesRepo,
  ) : super(NotesState.initial()) {
    on<AddNoteEvent>(_addNote);
    on<UpdateNoteEvent>(_updateNote);
    on<DeleteNoteEvent>(_deleteNote);
    on<ListenNoteEvent>(_listenNotes);
    on<CalculateFileCountEvent>(_calculateFileCount);
  }

  final NotesRepo notesRepo;

  _addNote(AddNoteEvent event, emit) async {
    MyResponse myResponse = await notesRepo.addNote(
      event.notesModel,
    );

    if (myResponse.errorText.isEmpty) {
      emit(
        state.copyWith(statusText: 'success'),
      );
      methodPrint(
        'ADD NOTE BLOC DA SUCCESS GA TUSHDI...',
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: myResponse.errorText,
        ),
      );
      methodPrint(
        'ADD NOTE BLOC DA ERROR GA TUSHDI: ${myResponse.errorText}',
      );
    }
  }

  _calculateFileCount(CalculateFileCountEvent event, emit) async {
    MyResponse personal = await notesRepo.calculateFileCount(
      'personal',
    );
    MyResponse academic = await notesRepo.calculateFileCount(
      'academic',
    );
    MyResponse work = await notesRepo.calculateFileCount(
      'work',
    );
    MyResponse others = await notesRepo.calculateFileCount(
      'others',
    );

    if (personal.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          countOfFilesInPersonal: personal.data,
          countOfFilesInAcademic: academic.data,
          countOfFilesInWork: work.data,
          countOfFilesInOthers: others.data,
        ),
      );
      methodPrint(
        'CALCULATE FILE COUNT BLOC DA SUCCESS GA TUSHDI...',
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: personal.errorText,
        ),
      );
      methodPrint(
        'CALCULATE FILE COUNT BLOC DA ERROR GA TUSHDI: ${personal.errorText}',
      );
    }
  }

  _updateNote(UpdateNoteEvent event, emit) async {
    MyResponse myResponse = await notesRepo.updateNote(
      event.notesModel,
    );

    if (myResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          statusText: 'updated',
        ),
      );
      methodPrint(
        'UPDATE NOTE BLOC DA SUCCESS GA TUSHDI...',
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: myResponse.errorText,
        ),
      );
      methodPrint(
        'UPDATE NOTE BLOC DA ERROR GA TUSHDI: ${myResponse.errorText}',
      );
    }
  }

  _deleteNote(DeleteNoteEvent event, emit) async {
    MyResponse myResponse = await notesRepo.deleteNote(
      event.uuid,
    );

    if (myResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          notes: myResponse.data,
        ),
      );
      methodPrint(
        'DELETE NOTE BLOC DA SUCCESS GA TUSHDI...',
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorText: myResponse.errorText,
        ),
      );
      methodPrint(
        'DELETE NOTE BLOC DA ERROR GA TUSHDI: ${myResponse.errorText}',
      );
    }
  }

  _listenNotes(ListenNoteEvent event, Emitter emit) async {
    await emit.onEach(
      notesRepo.getCardsFromDb(event.categoryName),
      onData: (List<NotesModel> notes) {
        emit(
          state.copyWith(
            formStatus: FormStatus.success,
            notes: notes,
          ),
        );
      },
    );
  }
}
