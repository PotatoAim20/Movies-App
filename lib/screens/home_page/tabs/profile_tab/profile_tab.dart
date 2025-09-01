import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/screens/registeration/edit_profile/edit_profile_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 389.h,
          width: double.infinity,
          color: Color(0xff212121),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/avatars/avatar1.png',
                          height: 118.h,
                          width: 118.w,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          'John Safwat',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '12',
                          style: GoogleFonts.roboto(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Wishlist',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '10',
                          style: GoogleFonts.roboto(
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'History',
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 23.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CustomElevatedButton(
                          text: 'Edit Profile',
                          fontSize: 20,
                          onPressed: () {
                            Navigator.pushNamed(context, EditProfile.routeName);
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 56.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffE82626),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Exit',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 11.w,
                                  ),
                                  child: Icon(
                                    Icons.exit_to_app_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: TabBar(
                    onTap: (value) {},
                    dividerColor: Colors.transparent,
                    dividerHeight: 0,
                    indicatorColor: Color(0xffF6BD00),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    labelPadding: EdgeInsets.symmetric(vertical: 6.h),
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.list_rounded,
                          color: Color(0xffF6BD00),
                          size: 40,
                        ),
                        text: 'Watch List',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.folder_rounded,
                          color: Color(0xffF6BD00),
                          size: 40,
                        ),
                        text: 'History',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(child: Image.asset('assets/images/empty_img.png')),
      ],
    );
  }
}
