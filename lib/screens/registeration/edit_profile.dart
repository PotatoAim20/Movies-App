import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/widgets/custom_text_form_field.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = 'EditProfile';
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          'Edit Profile',
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
            SizedBox(height: 37.h),
            Image.asset('assets/avatars/avatar1.png'),
            SizedBox(height: 35.h),
            CustomTextFormField(icon: 'assets/icons/user.png', label: 'Name'),
            SizedBox(height: 19.h),
            CustomTextFormField(
              icon: 'assets/icons/phone.png',
              label: 'Phone Number',
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Reset Password',
                    style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            CustomElevatedButton(
              text: 'Delete Account',
              fontSize: 20,
              isReverse: true,
              onPressed: () {},
            ),
            SizedBox(height: 19.h),
            CustomElevatedButton(
              text: 'Update Data',
              fontSize: 20,
              onPressed: () {},
            ),
            SizedBox(height: 34.h),
          ],
        ),
      ),
    );
  }
}
