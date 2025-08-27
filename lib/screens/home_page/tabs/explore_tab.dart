import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreTab extends StatelessWidget {
  ExploreTab({super.key});

  final List images = [
    'assets/images/test.png',
    'assets/images/test2.png',
    'assets/images/test3.png',
    'assets/images/test4.png',
    'assets/images/test5.png',
    'assets/images/test6.png',
  ];

  final List genres = [
    'Action',
    'Adventure',
    'Comedy',
    'Horror',
    'Test',
    'Test2',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: genres.length,
      initialIndex: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                onTap: (value) {},
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xffF6BD00),
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: const Color(0xffF6BD00),
                ),
                tabs: genres.map((genre) {
                  return Container(
                    width: 132.w,
                    height: 48.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xffF6BD00)),
                    ),
                    child: Text(
                      genre,
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: 25.h),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    return Image.asset(images[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
