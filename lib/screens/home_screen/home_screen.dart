import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121312),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xff282A28)),
        child: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home_nav.png',
                color: Colors.white,
                height: 24.h,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                'assets/icons/home_nav.png',
                color: Color(0xffF6BD00),
                height: 24.h,
                width: 24.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/search_nav.png',
                color: Colors.white,
                height: 24.h,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                'assets/icons/search_nav.png',
                color: Color(0xffF6BD00),
                height: 24.h,
                width: 24.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/explore_nav.png',
                color: Colors.white,
                height: 24.h,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                'assets/icons/explore_nav.png',
                color: Color(0xffF6BD00),
                height: 24.h,
                width: 24.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/profile_nav.png',
                color: Colors.white,
                height: 24.h,
                width: 24.w,
              ),
              activeIcon: Image.asset(
                'assets/icons/profile_nav.png',
                color: Color(0xffF6BD00),
                height: 24.h,
                width: 24.w,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/test.png'),
                      fit: BoxFit.fill,
                      opacity: 0.3,
                    ),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/available_now.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 21.h),
                      CarouselSlider(
                        options: CarouselOptions(
                          enlargeFactor: 0.25,
                          height: 351.h,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.6,
                        ),
                        items: List.generate(9, (index) {
                          final avatarPath = 'assets/images/test.png';
                          return Builder(
                            builder: (BuildContext context) {
                              return Image.asset(avatarPath, fit: BoxFit.cover);
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 21.h),
                      Center(
                        child: Image.asset(
                          'assets/images/watch_now.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Action',
                    style: GoogleFonts.roboto(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See More',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffF6BD00),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward,
                      color: Color(0xffF6BD00),
                      size: 15,
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: SizedBox(
                height: 220.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Image.asset(
                        'assets/images/test2.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
