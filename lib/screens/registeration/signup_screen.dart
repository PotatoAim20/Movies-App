import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/home_page/home_page.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/widgets/custom_text_form_field.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = 'SignupScreen';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isEnglish = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      appBar: AppBar(
        backgroundColor: Color(0xff121312),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xffF6BD00)),
        title: Text(
          'Register',
          style: GoogleFonts.roboto(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xffF6BD00),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 161.h,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.4,
              ),
              items: List.generate(9, (index) {
                final avatarPath = 'assets/avatars/avatar${index + 1}.png';
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(avatarPath, fit: BoxFit.cover);
                  },
                );
              }),
            ),

            SizedBox(height: 41.h),
            CustomTextFormField(icon: 'assets/icons/name.png', label: 'Name'),
            SizedBox(height: 24.h),
            CustomTextFormField(icon: 'assets/icons/email.png', label: 'Email'),
            SizedBox(height: 24.h),
            CustomTextFormField(
              icon: 'assets/icons/password.png',
              label: 'Password',
            ),
            SizedBox(height: 24.h),
            CustomTextFormField(
              icon: 'assets/icons/password.png',
              label: 'Password',
            ),
            SizedBox(height: 24.h),
            CustomTextFormField(
              icon: 'assets/icons/phone.png',
              label: 'Phone Number',
            ),
            SizedBox(height: 24.h),
            CustomElevatedButton(
              text: 'Create Account',
              fontSize: 20,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomePage.routeName,
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 18.h),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already Have Account ? ",
                      style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Login",
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
            SizedBox(height: 18.h),
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
