import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/movie_details/movie_details_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int carouselIndex = 0;
  List images = [
    'assets/images/test.png',
    'assets/images/test2.png',
    'assets/images/test3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(images[carouselIndex]),
                    fit: BoxFit.fill,
                    opacity: 0.2,
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
                        onPageChanged: (index, reason) {
                          carouselIndex = index;
                          setState(() {});
                        },
                        enlargeFactor: 0.25,
                        height: 351.h,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.6,
                      ),
                      items: images.map((path) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MovieDetails.routeName,
                                );
                              },
                              child: Image.asset(path, fit: BoxFit.cover),
                            );
                          },
                        );
                      }).toList(),
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MovieDetails.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Image.asset(
                        'assets/images/test2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
