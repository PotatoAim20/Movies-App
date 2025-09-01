import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/screens/home_page/home_page.dart';
import 'package:movies_app/screens/movie_details/movie_details_screen.dart';
import 'package:movies_app/screens/onboarding/introduction_screen.dart';
import 'package:movies_app/screens/onboarding/onboarding_screen.dart';
import 'package:movies_app/screens/registeration/edit_profile/edit_profile_screen.dart';
import 'package:movies_app/screens/registeration/forget_password/forget_password_screen.dart';
import 'package:movies_app/screens/registeration/login_screen/login_screen.dart';
import 'package:movies_app/screens/registeration/signup_screen/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.routeName: (context) => HomePage(),
            IntroductionScreen.routeName: (context) => IntroductionScreen(),
            OnboardingScreen.routeName: (context) => OnboardingScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            SignupScreen.routeName: (context) => SignupScreen(),
            ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
            EditProfile.routeName: (context) => EditProfile(),
            MovieDetails.routeName: (context) => MovieDetails(),
          },
          initialRoute: HomePage.routeName,
        );
      },
    );
  }
}
