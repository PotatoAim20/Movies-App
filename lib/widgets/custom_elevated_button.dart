// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  bool icon;
  Function onPressed;
  CustomElevatedButton({
    super.key,
    required this.text,
    required this.fontSize,
    this.icon = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffF6BD00),
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
              style: GoogleFonts.inter(
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff121312),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
