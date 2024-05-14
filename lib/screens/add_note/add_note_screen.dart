import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nur_note_app/bloc/form_status/form_status.dart';
import 'package:nur_note_app/bloc/notes/notes_bloc.dart';
import 'package:nur_note_app/bloc/notes/notes_event.dart';
import 'package:nur_note_app/bloc/notes/notes_state.dart';
import 'package:nur_note_app/data/models/notes_model.dart';
import 'package:nur_note_app/screens/app_routes.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
import 'package:nur_note_app/utils/constants/app_constants.dart';
import 'package:nur_note_app/utils/images/app_images.dart';
import 'package:nur_note_app/utils/sizedbox/get_sizedbox.dart';
import 'package:nur_note_app/utils/styles/app_text_style.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  List<String> titles = [
    'Title',
    'Subtitle',
  ];

  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    subTitle.dispose();
    super.dispose();
  }

  int activeIndex = -1;
  String currentCategory = '';

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> controllers = [
      title,
      subTitle,
    ];

    final List<TextInputAction> inputActions = [
      TextInputAction.next,
      TextInputAction.done,
    ];

    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          actions: [
            BlocConsumer<NotesBloc, NotesState>(
              listener: (context, state) {
                if (state.statusText == 'success') {
                  showToast(
                    context: context,
                    message: 'NOTE ADDED SUCCESSFULLY',
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.homeScreen,
                    (route) => false,
                  );
                }
                if (state.formStatus == FormStatus.error) {
                  showToast(
                    context: context,
                    message: state.errorText,
                    color: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                if (state.formStatus == FormStatus.loading) {
                  return const CircularProgressIndicator();
                }
                if (state.formStatus == FormStatus.error) {
                  return Icon(
                    Icons.error_rounded,
                    size: 20.w,
                    color: Colors.red,
                  );
                }
                if (state.statusText == 'success') {
                  return SvgPicture.asset(
                    AppImages.tick,
                  );
                }
                return IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 20.w,
                    color: AppColors.c72777A,
                  ),
                );
              },
            ),
            20.getW(),
          ],
          centerTitle: true,
          title: Text(
            'Add note',
            style: AppTextStyle.nunitoBold,
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.w,
              color: AppColors.c2A2251,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                children: [
                  ...List.generate(
                    controllers.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: TextField(
                        textInputAction: inputActions[index],
                        controller: controllers[index],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                24.r,
                              ),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.w,
                              ),
                            ),
                            labelText: titles[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            50.getH(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    AppConstants.categories.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Ink(
                        height: 50.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: activeIndex == index
                              ? Colors.amber
                              : Colors.indigo,
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            activeIndex = index;
                            currentCategory = AppConstants.categories[index];
                            setState(() {});
                          },
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                          child: Center(
                            child: Text(
                              AppConstants.categories[index],
                              style: AppTextStyle.nunitoBold.copyWith(
                                color: activeIndex == index
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 20.w,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  24.r,
                ),
                onTap: () {
                  if (activeIndex != -1 &&
                      currentCategory != '' &&
                      title.text.isNotEmpty &&
                      subTitle.text.isNotEmpty) {
                    NotesModel note = NotesModel(
                      title: title.text,
                      categoryName: currentCategory.toLowerCase(),
                      subtitle: subTitle.text,
                      uuid: '',
                      dateTime: DateTime.now().toString().substring(
                            0,
                            10,
                          ),
                    );
                    context.read<NotesBloc>().add(
                          AddNoteEvent(
                            note,
                          ),
                        );
                  } else {
                    showToast(
                      context: context,
                      message: 'PLEASE, COMPLETE ALL COLUMN',
                      color: Colors.red,
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(
                      24.r,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Add note",
                      style: AppTextStyle.nunitoBold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
