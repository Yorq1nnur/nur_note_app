import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/utils/colors/app_colors.dart';
import 'package:nur_note_app/utils/images/app_images.dart';
import 'package:nur_note_app/utils/styles/app_text_style.dart';

class CenterItems extends StatelessWidget {
  const CenterItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 25.h,
        bottom: 25.h,
      ),
      padding: EdgeInsets.symmetric(vertical: 37.h, horizontal: 30.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          23.r,
        ),
        gradient: const LinearGradient(
          colors: [
            AppColors.c6B4EFF,
            AppColors.c836CFB,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.cD9D9D9.withOpacity(
                    .47,
                  ),
                  AppColors.cD9D9D9.withOpacity(
                    .15,
                  ),
                ],
              ),
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
            child: Center(
              child: Image.asset(
                AppImages.percent,
                height: 52.h,
                width: 52.w,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'Available Space',
                style: AppTextStyle.nunitoBlack.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  color: AppColors.cFFFFFF,
                ),
              ),
              Text(
                '20 .254 GB of 25 GB Used',
                style: AppTextStyle.nunitoBlack.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cFFFFFF.withOpacity(
                    .6,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
