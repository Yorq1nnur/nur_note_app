import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nur_note_app/bloc/notes/notes_bloc.dart';
import 'package:nur_note_app/bloc/notes/notes_state.dart';
import 'package:nur_note_app/screens/app_routes.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
import 'package:nur_note_app/utils/images/app_images.dart';
import 'package:nur_note_app/utils/sizedbox/get_sizedbox.dart';
import 'package:nur_note_app/utils/styles/app_text_style.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Scaffold(
        body: BlocBuilder<NotesBloc, NotesState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.getH(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 30.w,
                              color: AppColors.c6B4EFF,
                            ),
                            10.getW(),
                            Text(
                              'Back',
                              style: AppTextStyle.nunitoBlack.copyWith(
                                color: AppColors.c6B4EFF,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Personal',
                        style: AppTextStyle.nunitoBold.copyWith(
                          fontSize: 20.sp,
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.search,
                              color: AppColors.c6B4EFF,
                              size: 30.w,
                            ),
                            Text(
                              'Search',
                              style: AppTextStyle.nunitoBlack.copyWith(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.c6B4EFF,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      Wrap(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.addNoteScreen,
                              );
                            },
                            borderRadius: BorderRadius.circular(
                              8.r,
                            ),
                            child: Container(
                              height: 170.w,
                              width: 170.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8.r,
                                ),
                                border: Border.all(
                                  color: AppColors.c2A2251.withOpacity(
                                    .6,
                                  ),
                                  width: 1,
                                ),
                                color: AppColors.c6B4EFF.withOpacity(
                                  .1,
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.plus,
                                      height: 40.h,
                                      width: 40.h,
                                    ),
                                    Text(
                                      'New note',
                                      style: AppTextStyle.nunitoBold.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.c2A2251,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        state.notes.length,
                        (index) => Text(
                          state.notes[index].title,
                          style: AppTextStyle.nunitoBold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
