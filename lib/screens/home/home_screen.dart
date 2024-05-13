import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/screens/home/widgets/center_items.dart';
import 'package:nur_note_app/screens/home/widgets/stack_items.dart';
import 'package:nur_note_app/screens/home/widgets/title_items.dart';
import 'package:nur_note_app/utils/sizedbox/get_sizedbox.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      ),
    );
  }
}
