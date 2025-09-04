// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/custom_text_form_field.dart';
import 'package:movies_app/screens/home_page/tabs/search_tab/cubit/search_tab_cubit.dart';
import 'package:movies_app/screens/home_page/tabs/search_tab/cubit/search_tab_states.dart';
import 'package:movies_app/screens/movie_details/movie_details_screen.dart';

class SearchTab extends StatelessWidget {
  SearchTab({super.key});

  final TextEditingController textEditingController = TextEditingController();

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
              textEditingController: textEditingController,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  SearchTabCubit.get(context).getMoviesList(value);
                }
              },
            ),
            SizedBox(height: 13.h),
            Expanded(
              child: BlocBuilder<SearchTabCubit, SearchTabStates>(
                builder: (BuildContext context, SearchTabStates state) {
                  if (state is SearchTabInitState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Image.asset('assets/images/empty_img.png'),
                        const Spacer(),
                      ],
                    );
                  } else if (state is GetMoviesSearchLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetMoviesSearchSuccessState) {
                    final movies =
                        SearchTabCubit.get(
                          context,
                        ).moviesResponse?.data?.movies ??
                        [];
                    if (movies.isEmpty) {
                      return const Center(
                        child: Text(
                          "No results found",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                              arguments: SearchTabCubit.get(
                                context,
                              ).moviesResponse?.data?.movies?[index].id,
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(16.r),
                            child: Image.network(movies[index].backgroundImage),
                          ),
                        );
                      },
                    );
                  } else if (state is GetMoviesSearchErrorState) {
                    return Center(
                      child: Text(
                        'Error Occured Check Network',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
