// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/screens/movie_details/cubit/movie_details_cubit.dart';
import 'package:movies_app/screens/movie_details/cubit/movie_details_states.dart';
import 'package:movies_app/screens/movie_details/repository/movie_details_screen_repo_implementation.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = 'MoviesDetailsScreen';
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider<MovieDetailsCubit>(
      create: (context) =>
          MovieDetailsCubit(MovieDetailsScreenRepoImplementation())
            ..getMovieDetails(movieId),

      child: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
        builder: (context, state) {
          if (state is GetMovieDetailsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Color(0xff121312),

            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                iconSize: 29,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_rounded),
                  color: Colors.white,
                  iconSize: 29,
                ),
              ],
              actionsPadding: EdgeInsets.only(right: 16.w),
            ),

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        MovieDetailsCubit.get(
                              context,
                            ).movieDetailsResponse?.movie.backgroundImage ??
                            '',
                        height: 766.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Image.asset(
                        'assets/images/movie_details_layer.png',
                        height: 766.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Image.asset(
                        'assets/images/play_button.png',
                        height: 97.h,
                        width: 97.w,
                      ),

                      Positioned(
                        bottom: 0.h,
                        left: 16.w,
                        right: 16.w,
                        child: Column(
                          children: [
                            Text(
                              'Doctor Strange in the Multiverse of Madness',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              '2022',
                              style: GoogleFonts.roboto(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffADADAD),
                              ),
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomElevatedButton(
                          text: 'Watch',
                          fontSize: 20,
                          isReverse: true,
                          onPressed: () {},
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 47.h,
                              width: 122.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Color(0xff282A28),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Color(0xffF6BD00),
                                    size: 28,
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    '15',
                                    style: GoogleFonts.roboto(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 47.h,
                              width: 122.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Color(0xff282A28),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time_filled_rounded,
                                    color: Color(0xffF6BD00),
                                    size: 28,
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    '15',
                                    style: GoogleFonts.roboto(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 47.h,
                              width: 122.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Color(0xff282A28),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_rounded,
                                    color: Color(0xffF6BD00),
                                    size: 28,
                                  ),
                                  SizedBox(width: 14.w),
                                  Text(
                                    '15',
                                    style: GoogleFonts.roboto(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Screen Shots',
                          style: GoogleFonts.roboto(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 9.h),
                        Container(
                          height: 167.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/movies_details_screenshot1.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          height: 167.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/movies_details_screenshot2.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          height: 167.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/images/movies_details_screenshot3.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Similar',
                          style: GoogleFonts.roboto(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 11.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(0),
                          itemCount: 4,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: 0.7,
                              ),
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(16.r),
                              child: Image.asset(
                                'assets/images/test${index + 2}.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Summary',
                          style: GoogleFonts.roboto(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Cast',
                          style: GoogleFonts.roboto(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        ListView.separated(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 8.h),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 92.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Color(0xff282A28),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 11.w,
                                  vertical: 11.h,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 70.h,
                                      width: 70.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/images/cast_test.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Name : Hayley Atwell',
                                          style: GoogleFonts.roboto(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          'Character : Captain Carter',
                                          style: GoogleFonts.roboto(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: 4,
                        ),

                        SizedBox(height: 16.h),
                        Text(
                          'Genres',
                          style: GoogleFonts.roboto(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(0),

                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 11.h,
                                childAspectRatio: 0.7,
                              ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Color(0xff282A28),
                              ),
                              child: Center(
                                child: Text(
                                  'Adventure',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
