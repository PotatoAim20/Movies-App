import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/registeration/login_screen/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = 'OnboardingScreen';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onboarding_bg1.png",
      "overlay": "assets/images/onboarding_layer1.png",
      "title": "Discover Movies",
      "subtitle":
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    },
    {
      "image": "assets/images/onboarding_bg2.png",
      "overlay": "assets/images/onboarding_layer2.png",
      "title": "Explore All Genres",
      "subtitle":
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    },
    {
      "image": "assets/images/onboarding_bg3.png",
      "overlay": "assets/images/onboarding_layer3.png",
      "title": "Create Watchlists",
      "subtitle":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    },
    {
      "image": "assets/images/onboarding_bg4.png",
      "overlay": "assets/images/onboarding_layer4.png",
      "title": "Rate, Review, and Learn",
      "subtitle":
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
    {
      "image": "assets/images/onboarding_bg5.png",
      "overlay": "assets/images/onboarding_layer5.png",
      "title": "Start Watching Now",
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      setState(() => currentPage++);
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginScreen.routeName,
        (route) => false,
      );
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      setState(() => currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentPage];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: Stack(
          key: ValueKey<int>(currentPage),
          fit: StackFit.loose,
          children: [
            Image.asset(page["image"]!, fit: BoxFit.cover),
            if (page["overlay"] != null)
              Image.asset(page["overlay"]!, fit: BoxFit.cover),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 350.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xff121312),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          page["title"]!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        if (page["subtitle"] != null)
                          Text(
                            page["subtitle"]!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        Column(
                          children: [
                            SizedBox(
                              height: 55.h,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: nextPage,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffF6BD00),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                ),
                                child: Text(
                                  currentPage == pages.length - 1
                                      ? 'Get Started'
                                      : 'Next',
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff121312),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            if (currentPage > 0)
                              SizedBox(
                                height: 55.h,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: prevPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff121312),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                      side: BorderSide(
                                        color: Color(0xffF6BD00),
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Back',
                                    style: GoogleFonts.inter(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
