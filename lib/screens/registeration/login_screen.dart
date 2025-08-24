import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 67.h, horizontal: 19.w),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 121.w,
                height: 118.h,
                child: Image.asset(
                  'assets/images/app_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 69.h),
            CustomTextFormField(
              icon: 'assets/icons/email.png',
              label: 'Email',
              isPassword: false,
            ),
            SizedBox(height: 22.h),
            CustomTextFormField(
              icon: 'assets/icons/password.png',
              label: 'Password',
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}
