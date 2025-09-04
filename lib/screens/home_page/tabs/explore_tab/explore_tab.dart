import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/home_page/tabs/explore_tab/cubit/explore_tab_cubit.dart';
import 'package:movies_app/screens/home_page/tabs/explore_tab/cubit/explore_tab_states.dart';
import 'package:movies_app/screens/movie_details/movie_details_screen.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreTabCubit, ExploreTabStates>(
      builder: (context, state) {
        final genres = ExploreTabCubit.get(context).genres;

        return DefaultTabController(
          length: genres.length,
          initialIndex: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SafeArea(
              child: Column(
                children: [
                  TabBar(
                    onTap: (value) {
                      ExploreTabCubit.get(context).getMoviesList(genres[value]);
                    },
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: const Color(0xffF6BD00),
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
                          border: Border.all(color: const Color(0xffF6BD00)),
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
                    child: Builder(
                      builder: (_) {
                        if (state is GetMoviesGenreLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final movies = ExploreTabCubit.get(
                          context,
                        ).moviesResponse?.data?.movies;

                        if (movies == null || movies.isEmpty) {
                          return const Center(
                            child: Text(
                              "No movies found",
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        return GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: movies.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                childAspectRatio: 0.68,
                              ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  MovieDetails.routeName,
                                  arguments: ExploreTabCubit.get(
                                    context,
                                  ).moviesResponse?.data?.movies?[index].id,
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  16.r,
                                ),
                                child: Image.network(
                                  movies[index].backgroundImage,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
