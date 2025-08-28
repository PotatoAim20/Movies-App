// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool icon;
  Function onPressed;
  final bool isReverse;

  CustomElevatedButton({
    super.key,
    required this.text,
    required this.fontSize,
    this.icon = false,
    required this.onPressed,
    this.isReverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isReverse == false
              ? const Color(0xffF6BD00)
              : const Color(0xffE82626),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.w),
                    child: Image.asset('assets/icons/google.png'),
                  )
                : SizedBox.shrink(),
            Text(
              text,
              style: GoogleFonts.roboto(
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w700,
                color: isReverse == false
                    ? const Color(0xff121312)
                    : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
