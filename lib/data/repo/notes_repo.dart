import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nur_note_app/data/models/notes_model.dart';
import 'package:nur_note_app/utils/constants/app_constants.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';
import '../response/my_response.dart';

class NotesRepo {
  Future<MyResponse> addNote(NotesModel notesModel) async {
    try {
      methodPrint(
        'ADD NOTE DA TRY GA KIRDI...',
      );
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection(
            AppConstants.notes,
          )
          .add(
            notesModel.toJson(),
          );

      await FirebaseFirestore.instance
          .collection(AppConstants.notes)
          .doc(documentReference.id)
          .update({'uuid': documentReference.id});

      return MyResponse(
        data: 'success',
      );
    } on FirebaseException catch (e) {
      methodPrint(
        'ADD NOTE DA ERROR GA KIRDI: ${e.toString()}',
      );
      return MyResponse(
        errorText: e.toString(),
      );
    }
  }

  Future<MyResponse> calculateFileCount(String categoryName) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.notes)
          .where('category_name', isEqualTo: categoryName.toLowerCase())
          .get();

      List<NotesModel> notes = querySnapshot.docs
          .map((e) => NotesModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      return MyResponse(
        data: notes.length,
      );
    } on FirebaseException catch (e) {
      return MyResponse(
        errorText: e.toString(),
      );
    }
  }

  Future<MyResponse> updateNote(NotesModel notesModel) async {
    try {
      methodPrint(
        'UPDATE NOTE DA TRY GA KIRDI...',
      );
      await FirebaseFirestore.instance
          .collection(
            AppConstants.notes,
          )
          .doc(notesModel.uuid)
          .update(
            notesModel.toJsonForUpdate(),
          );
      return MyResponse(
        data: 'success',
      );
    } on FirebaseException catch (e) {
      methodPrint(
        'UPDATE NOTE DA ERROR GA KIRDI: ${e.toString()}',
      );
      return MyResponse(
        errorText: e.toString(),
      );
    }
  }

  Future<MyResponse> deleteNote(String uuid) async {
    try {
      methodPrint(
        'DELETE NOTE DA TRY GA KIRDI...',
      );
      await FirebaseFirestore.instance
          .collection(
            AppConstants.notes,
          )
          .doc(uuid)
          .delete();
      return MyResponse(
        data: 'success',
      );
    } on FirebaseException catch (e) {
      methodPrint(
        'DELETE NOTE DA ERROR GA KIRDI: ${e.toString()}',
      );
      return MyResponse(
        errorText: e.toString(),
      );
    }
  }

  Stream<List<NotesModel>> listenNotes(String categoryName) =>
      FirebaseFirestore.instance.collection(AppConstants.notes).snapshots().map(
            (event) => event.docs
                .map(
                  (e) => NotesModel.fromJson(
                    e.data(),
                  ),
                )
                .toList(),
          );

  Future<MyResponse> getNotes(String categoryName)async{

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.notes)
          .where('category_name', isEqualTo: categoryName.toLowerCase())
          .get();

      List<NotesModel> notes = querySnapshot.docs
          .map((e) => NotesModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      List<NotesModel> n = [];

      for (var element in notes) {
        if(element.categoryName.toLowerCase() == categoryName.toLowerCase()){
          n.add(element);
        }
      }

      return MyResponse(
        data: notes,
      );
    } on FirebaseException catch (e) {
      return MyResponse(
        errorText: e.toString(),
      );
    }

  }

}
