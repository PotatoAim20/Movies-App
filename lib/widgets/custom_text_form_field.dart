import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final String icon;
  final String label;
  final bool isPassword;

  const CustomTextFormField({
    super.key,
    required this.icon,
    required this.label,
    required this.isPassword,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPassword == false,
      obscuringCharacter: '*',
      style: GoogleFonts.roboto(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      cursorColor: Color(0xffF6BD00),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  showPassword = !showPassword;
                  setState(() {});
                },
                icon: Icon(
                  showPassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                ),
                color: Colors.white,
              )
            : null,
        label: Text(
          widget.label,
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        fillColor: Color(0xff282A28),
        filled: true,
        prefixIcon: Image.asset(widget.icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
