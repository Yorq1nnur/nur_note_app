import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/data/models/notes_model.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
import 'package:nur_note_app/utils/styles/app_text_style.dart';
import 'package:nur_note_app/utils/utility_functions/utility_functions.dart';

class NotesContainer extends StatelessWidget {
  const NotesContainer({
    super.key,
    required this.notesModel,
  });

  final NotesModel notesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            notesModel.title,
            style: AppTextStyle.nunitoBold.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.c2A2251),
            textAlign: TextAlign.start,
            maxLines: 300,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            notesModel.subtitle,
            style: AppTextStyle.nunitoBold.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.c667085),
            textAlign: TextAlign.start,
            maxLines: 300,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            notesModel.dateTime,
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
    );
  }
}
