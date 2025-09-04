import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/core/models/movie_suggestion_model.dart';
import 'package:movies_app/screens/movie_details/cubit/movie_details_states.dart';
import 'package:movies_app/screens/movie_details/repository/movie_details_screen_repo.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  static MovieDetailsCubit get(context) =>
      BlocProvider.of<MovieDetailsCubit>(context);

  MovieDetailsScreenRepo movieDetailsScreenRepo;

  MovieDetailsCubit(this.movieDetailsScreenRepo)
    : super(MovieDetailsInitState());

  MovieDetailsResponse? movieDetailsResponse;
  MovieSuggestionsResponse? movieSuggestionsResponse;

  Future<void> getMovieDetails(int id) async {
    try {
      emit(GetMovieDetailsLoadingState());
      var result = await movieDetailsScreenRepo.getMovieDetails(id);
      movieDetailsResponse = result;
      emit(GetMovieDetailsSuccessState());
      getMovieSuggestions(id);
    } catch (e) {
      emit(GetMovieDetailsErrorState());
    }
  }

  Future<void> getMovieSuggestions(int id) async {
    try {
      emit(GetMovieSuggestionsLoadingState());
      var result = await movieDetailsScreenRepo.getMovieSuggestions(id);
      movieSuggestionsResponse = result;
      emit(GetMovieSuggestionsSuccessState());
    } catch (e) {
      emit(GetMovieSuggestionsErrorState());
    }
  }
}
