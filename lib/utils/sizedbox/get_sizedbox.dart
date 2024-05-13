import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension GetSizedbox on int {
  SizedBox getH() {
    return SizedBox(
      height: (this).h,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this).w,
    );
  }
}
