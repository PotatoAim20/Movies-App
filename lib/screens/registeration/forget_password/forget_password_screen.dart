import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = 'ForgetPasswordScreen';
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      appBar: AppBar(
        backgroundColor: Color(0xff121312),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xffF6BD00)),
        title: Text(
          'Forget Password',
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xffF6BD00),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Image.asset(
              'assets/images/forget_password.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h),
            CustomTextFormField(icon: 'assets/icons/email.png', label: 'Email'),
            SizedBox(height: 24.h),
            CustomElevatedButton(
              text: 'Verify Email',
              fontSize: 20,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
