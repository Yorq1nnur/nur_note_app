import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/bloc/notes/notes_bloc.dart';
import 'package:nur_note_app/bloc/notes/notes_state.dart';
import 'package:nur_note_app/screens/app_routes.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
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
    methodPrint(
      getWidth(context),
    );
    methodPrint(
      getHeight(context),
    );
    return AnnotatedRegion(
      value: systemUiOverlayStyle,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
                      categoryName,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<NotesBloc, NotesState>(
                      builder: (context, state) {
                        if (state.notes.isNotEmpty) {
                          return Wrap(
                            children: List.generate(
                              state.notes.length,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 5.h,
                                ),
                                width: getWidth(context) / (2.4),
                                padding: EdgeInsets.only(
                                  top: 16.h,
                                  bottom: 16.h,
                                  left: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    20.r,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.c6B4EFF.withOpacity(
                                        .07,
                                      ),
                                      blurRadius: 35.r,
                                      offset: const Offset(
                                        0,
                                        4,
                                      ),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.notes[index].title,
                                      style: AppTextStyle.nunitoBold.copyWith(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.c2A2251),
                                      textAlign: TextAlign.start,
                                      maxLines: 300,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      state.notes[index].subtitle,
                                      style: AppTextStyle.nunitoBold.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.c667085),
                                      textAlign: TextAlign.start,
                                      maxLines: 300,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      state.notes[index].dateTime,
                                      style: AppTextStyle.nunitoBold.copyWith(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.c101828),
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(
            bottom: 55.h,
          ),
          child: Material(
            color: Colors.transparent,
            child: Ink(
              height: 50.h,
              width: 180.w,
              decoration: BoxDecoration(
                color: AppColors.c6B4EFF,
                borderRadius: BorderRadius.circular(
                  24.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.c6B4EFF.withOpacity(
                      .1,
                    ),
                    blurRadius: 10.r,
                    offset: const Offset(
                      0,
                      12,
                    ),
                  ),
                  BoxShadow(
                    color: AppColors.c6B4EFF.withOpacity(
                      .1,
                    ),
                    blurRadius: 24.r,
                    offset: const Offset(
                      0,
                      30,
                    ),
                  ),
                  BoxShadow(
                    color: AppColors.c6B4EFF.withOpacity(
                      .2,
                    ),
                    blurRadius: 80.r,
                    offset: const Offset(
                      0,
                      100,
                    ),
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.addNoteScreen,
                  );
                },
                borderRadius: BorderRadius.circular(
                  24.r,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32.w,
                      ),
                      Text(
                        'Add New Notes',
                        style: AppTextStyle.nunitoBold,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
