import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/screens/movie_details/cubit/movie_details_states.dart';
import 'package:movies_app/screens/movie_details/repository/movie_details_screen_repo.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates> {
  static MovieDetailsCubit get(context) =>
      BlocProvider.of<MovieDetailsCubit>(context);

  MovieDetailsScreenRepo movieDetailsScreenRepo;
  MovieDetailsCubit(this.movieDetailsScreenRepo)
    : super(MovieDetailsInitState());

  MovieDetailsResponse? movieDetailsResponse;

  Future<void> getMovieDetails(int id) async {
    try {
      emit(GetMovieDetailsLoadingState());
      var result = await movieDetailsScreenRepo.getMovieDetails(id);
      movieDetailsResponse = result;
      emit(GetMovieDetailsSuccessState());
    } catch (e) {
      emit(GetMovieDetailsErrorState());
    }
  }
}
