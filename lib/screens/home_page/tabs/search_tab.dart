import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/widgets/custom_text_form_field.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});

  final List images = [
    'assets/images/test.png',
    'assets/images/test2.png',
    'assets/images/test3.png',
    'assets/images/test4.png',
    'assets/images/test5.png',
    'assets/images/test6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SafeArea(
        child: Column(
          children: [
            CustomTextFormField(
              icon: 'assets/icons/search_nav.png',
              label: 'Search',
              isPassword: false,
            ),
            // Spacer(),
            // Image.asset('assets/images/empty_img.png'),
            // Spacer(),
            SizedBox(height: 13.h),
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
    );
  }
}
