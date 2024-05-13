import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nur_note_app/utils/styles/app_text_style.dart';
import 'package:toast/toast.dart';
import '../colors/app_colors.dart';

SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
  statusBarColor: AppColors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
);

void methodPrint(dynamic data) {
  debugPrint("\$\$\$\$\$\$\n$data\n\$\$\$\$\$\$");
}

double getWidth(BuildContext context){
  return MediaQuery.sizeOf(context).width;
}
double getHeight(BuildContext context){
  return MediaQuery.sizeOf(context).height;
}

showToast({
  required BuildContext context,
  required dynamic message,
  Color? color,
}) {
  ToastContext toastContext = ToastContext();
  toastContext.init(
    context,
  );
  Toast.show(
    "$message",
    duration: Toast.lengthLong,
    gravity: Toast.top,
    border: Border.all(
      color: Colors.black.withOpacity(
        0.6,
      ),
      width: 2.w,
    ),
    backgroundColor: color ?? Colors.blue,
    textStyle: AppTextStyle.interBold.copyWith(
      color: AppColors.black,
      fontSize: 16.w,
    ),
    backgroundRadius: 25,
  );
}

showSnackBar({
  required BuildContext context,
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? Colors.blue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            16,
          ),
          topLeft: Radius.circular(
            16,
          ),
        ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: AppTextStyle.interSemiBold.copyWith(
          fontSize: 20.w,
          color: Colors.black,
        ),
      ),
    ),
  );
}

showErrorForRegister(
  String code,
  BuildContext context,
) {
  if (code == 'weak-password') {
    methodPrint('The password provided is too weak.');
    if (!context.mounted) return;
    showToast(
      color: Colors.red,
      context: context,
      message: "Passwordni xato kiritdingiz!!!",
    );
  } else if (code == 'email-already-in-use') {
    methodPrint('The account already exists for that email.');
    if (!context.mounted) return;
    showToast(
      color: Colors.red,
      context: context,
      message: "Bu e-pochta uchun hisob allaqachon mavjud!!!",
    );
  }
}

showErrorForLogin(
  String code,
  BuildContext context,
) {
  if (code == 'wrong-password') {
    methodPrint('The password provided is wrong.');
    if (!context.mounted) return;
    showToast(
      color: Colors.red,
      context: context,
      message: "Passwordni xato kiritdingiz!!!",
    );
  } else if (code == 'invalid-email') {
    methodPrint('The e-mail is invalid!!!');
    if (!context.mounted) return;
    showToast(
      color: Colors.red,
      context: context,
      message: "Bu e-pochta yaqroqsiz!!!",
    );
  } else if (code == 'user-disabled') {
    methodPrint('The user is blocked.');
    if (!context.mounted) return;
    showToast(
      color: Colors.red,
      context: context,
      message: "Foydalanuvchi bloklangan!!!",
    );
  } else if (code == "user not found") {
    methodPrint('The user is not found.');
    if (!context.mounted) return;
    showToast(
      color: Colors.red,
      context: context,
      message: "Foydalanuvchi topilmadi!!!",
    );
  } else {
    methodPrint('The user is not found.');
    if (!context.mounted) return;
    showToast(
      color: Colors.red,
      context: context,
      message: "Noma'lum xatolik!!!",
    );
  }
}

String formatDateWithSlash(String input) {
  if (input.length != 4) {
    methodPrint('Input string must be exactly 4 characters long.');
  }

  DateTime now = DateTime.now();
  int currentYear = now.year;
  int currentMonth = now.month;

  int year = int.parse(input.substring(0, 2));
  int month = int.parse(input.substring(2, 4));

  if (year > currentYear || (year == currentYear && month > currentMonth)) {
    methodPrint('Input date cannot be in the past.');
  }
  return '$year/$month';
}
