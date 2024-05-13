import 'package:flutter/material.dart';
import 'package:nur_note_app/screens/add_note/add_note_screen.dart';
import 'package:nur_note_app/screens/home/home_screen.dart';
import 'package:nur_note_app/screens/notes/notes_screen.dart';
import 'package:nur_note_app/screens/splash/splash_screen.dart';

class AppRoutes {
  static Route generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return navigate(
          const SplashScreen(),
        );
      case RouteNames.homeScreen:
        return navigate(
          const HomeScreen(),
        );
      case RouteNames.notesScreen:
        return navigate(
           NotesScreen(categoryName: settings.arguments as String,),
        );
      case RouteNames.addNoteScreen:
        return navigate(
          const AddNoteScreen(),
        );

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text(
                "This kind of rout does not exist!",
              ),
            ),
          ),
        );
    }
  }

  static navigate(
    Widget widget,
  ) {
    return MaterialPageRoute(
      builder: (
        context,
      ) =>
          widget,
    );
  }
}

class RouteNames {
  static const String splashScreen = "/";
  static const String homeScreen = "/home_screen";
  static const String notesScreen = "/notes_screen";
  static const String addNoteScreen = "/add_note_screen";
}
