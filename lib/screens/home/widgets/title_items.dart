import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
import 'package:nur_note_app/utils/images/app_images.dart';
import 'package:nur_note_app/utils/sizedbox/get_sizedbox.dart';
import 'package:nur_note_app/utils/styles/app_text_style.dart';

class TitleItems extends StatelessWidget {
  const TitleItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50.h,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 23.h,
                ),
                child: Text(
                  'Note-Taking App',
                  style: AppTextStyle.nunitoBold.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.c292150),
                ),
              ),
              Positioned(
                top: 10,
                child: Text(
                  'Welcome, John !',
                  style: AppTextStyle.nunitoBold.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cB6B0D9),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppImages.notification,
              width: 24.w,
              height: 24.w,
            ),
            20.getW(),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AppImages.profile,
                height: 50.h,
                width: 50.w,
                fit: BoxFit.fill,
              ),
            ),
          ],
        )
      ],
    );
  }
}
