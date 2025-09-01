import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/screens/home_page/home_page.dart';
import 'package:movies_app/screens/registeration/forget_password/forget_password_screen.dart';
import 'package:movies_app/screens/registeration/signup_screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEnglish = true;
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
            CustomTextFormField(icon: 'assets/icons/email.png', label: 'Email'),
            SizedBox(height: 22.h),
            CustomTextFormField(
              icon: 'assets/icons/password.png',
              label: 'Password',
              isPassword: true,
            ),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordScreen.routeName,
                    );
                  },
                  child: Text(
                    'Forget Password ?',
                    style: GoogleFonts.roboto(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 33.h),
            CustomElevatedButton(
              text: 'Login',
              fontSize: 20,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 22.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SignupScreen.routeName);
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don’t Have Account ? ",
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Create One",
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                        color: Color(0xffF6BD00),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.w),
              child: Row(
                children: [
                  Expanded(child: Divider(color: Color(0xffF6BD00))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.w),
                    child: Text(
                      'OR',
                      style: GoogleFonts.roboto(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffF6BD00),
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xffF6BD00))),
                ],
              ),
            ),
            SizedBox(height: 28.h),
            CustomElevatedButton(
              text: 'Login With Google',
              fontSize: 16,
              icon: true,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 33.h),
            Container(
              height: 38.h,
              width: 90.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: Color(0xffF6BD00), width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      isEnglish = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: isEnglish
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xffF6BD00),
                                width: 4,
                              ),
                            )
                          : null,
                      child: Image.asset('assets/icons/en.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      isEnglish = false;
                      setState(() {});
                    },
                    child: Container(
                      decoration: isEnglish == false
                          ? BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xffF6BD00),
                                width: 4,
                              ),
                            )
                          : null,
                      child: Image.asset('assets/icons/ar.png'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
