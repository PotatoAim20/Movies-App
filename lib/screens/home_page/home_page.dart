import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/screens/home_page/tabs/explore_tab.dart';
import 'package:movies_app/screens/home_page/tabs/home_tab.dart';
import 'package:movies_app/screens/home_page/tabs/profile_tab.dart';
import 'package:movies_app/screens/home_page/tabs/search_tab.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List tabs = [HomeTab(), SearchTab(), ExploreTab(), ProfileTab()];

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
      body: tabs[selectedIndex],
    );
  }
}
