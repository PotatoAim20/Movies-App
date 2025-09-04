import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/models/movies_list_model.dart';
import 'package:movies_app/screens/home_page/tabs/explore_tab/cubit/explore_tab_states.dart';
import 'package:movies_app/screens/home_page/tabs/explore_tab/repository/explore_tab_repo.dart';

class ExploreTabCubit extends Cubit<ExploreTabStates> {
  static ExploreTabCubit get(context) =>
      BlocProvider.of<ExploreTabCubit>(context);

  ExploreTabRepo exploreTabRepo;
  ExploreTabCubit(this.exploreTabRepo) : super(ExploreTabInitState());

  MoviesResponse? moviesResponse;

  final List<String> genres = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "Film-Noir",
    "History",
    "Horror",
    "Music",
    "Musical",
    "Mystery",
    "Romance",
    "Sport",
    "Thriller",
    "War",
    "Western",
  ];

  Future<void> getMoviesList(String selectedGenre) async {
    try {
      emit(GetMoviesGenreLoadingState());
      var result = await exploreTabRepo.getMoviesList(selectedGenre);
      moviesResponse = result;
      emit(GetMoviesGenreSuccessState());
    } catch (e) {
      emit(GetMoviesGenreErrorState());
    }
  }
}
