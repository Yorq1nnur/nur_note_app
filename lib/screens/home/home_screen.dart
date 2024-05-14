import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/bloc/notes/notes_bloc.dart';
import 'package:nur_note_app/bloc/notes/notes_event.dart';
import 'package:nur_note_app/screens/app_routes.dart';
import 'package:nur_note_app/screens/home/widgets/center_items.dart';
import 'package:nur_note_app/screens/home/widgets/stack_items.dart';
import 'package:nur_note_app/screens/home/widgets/title_items.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
import 'package:nur_note_app/utils/sizedbox/get_sizedbox.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(
      () => context.read<NotesBloc>().add(
            CalculateFileCountEvent(),
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.getH(),
                const TitleItems(),
                const CenterItems(),
                const StackItems(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.c6B4EFF,
          onPressed: () {
            Navigator.pushNamed(
              context,
              RouteNames.addNoteScreen,
            );
          },
          child: Center(
            child: Icon(
              Icons.add,
              size: 32.w,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
