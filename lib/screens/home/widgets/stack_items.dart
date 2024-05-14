import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/bloc/notes/notes_bloc.dart';
import 'package:nur_note_app/bloc/notes/notes_event.dart';
import 'package:nur_note_app/bloc/notes/notes_state.dart';
import 'package:nur_note_app/screens/app_routes.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
import 'package:nur_note_app/utils/images/app_images.dart';
import 'package:nur_note_app/utils/sizedbox/get_sizedbox.dart';
import 'package:nur_note_app/utils/styles/app_text_style.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class StackItems extends StatelessWidget {
  const StackItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    context.read<NotesBloc>().add(
                          const ListenNoteEvent(
                            'personal',
                          ),
                        );
                    navigatorMethod(context, "Personal");
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.file,
                        height: 250.h,
                        width: 138.h,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            top: 50.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.c6B4EFF.withOpacity(
                                    .1,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(AppImages.note),
                                ),
                              ),
                              18.getH(),
                              Text(
                                'Personal',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.c2A2251,
                                ),
                              ),
                              Text(
                                '${state.countOfFilesInPersonal} Files',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c000000.withOpacity(
                                    .6,
                                  ),
                                ),
                              ),
                              Text(
                                'Size: ${state.countOfFilesInPersonal * 0.05} MBs',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.c000000.withOpacity(
                                    .4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    navigatorMethod(context, "Academic");
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.file,
                        height: 250.h,
                        width: 138.h,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            top: 50.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.c6B4EFF.withOpacity(
                                    .1,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(AppImages.noteLight),
                                ),
                              ),
                              18.getH(),
                              Text(
                                'Academic',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.c2A2251,
                                ),
                              ),
                              Text(
                                '${state.countOfFilesInAcademic} Files',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c000000.withOpacity(
                                    .6,
                                  ),
                                ),
                              ),
                              Text(
                                'Size: ${state.countOfFilesInAcademic * 0.05} MGs',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.c000000.withOpacity(
                                    .4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZoomTapAnimation(
                  onTap: () {
                    navigatorMethod(context, "Work");
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.file,
                        height: 250.h,
                        width: 138.h,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            top: 50.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.c6B4EFF.withOpacity(
                                    .1,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(AppImages.person),
                                ),
                              ),
                              18.getH(),
                              Text(
                                'Work',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.c2A2251,
                                ),
                              ),
                              Text(
                                '${state.countOfFilesInWork} Files',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c000000.withOpacity(
                                    .6,
                                  ),
                                ),
                              ),
                              Text(
                                'Size: ${state.countOfFilesInWork * 0.05} MBs',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.c000000.withOpacity(
                                    .4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ZoomTapAnimation(
                  onTap: () {
                    navigatorMethod(context, "Others");
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        AppImages.file,
                        height: 250.h,
                        width: 138.h,
                        fit: BoxFit.fill,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 25.w,
                            top: 50.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 12.w,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.c6B4EFF.withOpacity(
                                    .1,
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(AppImages.other),
                                ),
                              ),
                              18.getH(),
                              Text(
                                'Others',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.c2A2251,
                                ),
                              ),
                              Text(
                                '${state.countOfFilesInOthers} Files',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.c000000.withOpacity(
                                    .6,
                                  ),
                                ),
                              ),
                              Text(
                                'Size: ${state.countOfFilesInOthers * 0.05} MBs',
                                style: AppTextStyle.nunitoBlack.copyWith(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.c000000.withOpacity(
                                    .4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

void navigatorMethod(BuildContext context, String categoryName) {
  context.read<NotesBloc>().add(
        ListenNoteEvent(
          categoryName,
        ),
      );
  methodPrint(
    'NAVIGATOR ITEM METHOD GA TUSHDI...',
  );
  Navigator.pushNamed(context, RouteNames.notesScreen, arguments: categoryName);
}
