import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/home_page/tabs/home_tab/cubit/home_tab_cubit.dart';
import 'package:movies_app/screens/home_page/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:movies_app/screens/movie_details/movie_details_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
      builder: (BuildContext context, HomeTabStates state) {
        if (state is GetMoviesListLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          HomeTabCubit.get(context)
                              .moviesResponse!
                              .data!
                              .movies![carouselIndex]
                              .backgroundImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/movie_details_layer.png',
                          ),
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
                            items:
                                (HomeTabCubit.get(
                                          context,
                                        ).moviesResponse?.data?.movies ??
                                        [])
                                    .map((movie) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                context,
                                                MovieDetails.routeName,
                                                arguments: movie.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                    20.r,
                                                  ),
                                              child: Image.network(
                                                movie.backgroundImage,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    })
                                    .toList(),
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
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        HomeTabCubit.get(context).moviesResponse?.data?.movies
                            ?.where((movie) => movie.genres.contains("Action"))
                            .length ??
                        0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            MovieDetails.routeName,
                            arguments: HomeTabCubit.get(
                              context,
                            ).moviesResponse?.data?.movies?[index].id,
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.network(
                              (HomeTabCubit.get(context)
                                      .moviesResponse!
                                      .data!
                                      .movies!
                                      .where(
                                        (movie) =>
                                            movie.genres.contains("Action"),
                                      )
                                      .toList())[index]
                                  .backgroundImage,
                            ),
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
      },
    );
  }
}
