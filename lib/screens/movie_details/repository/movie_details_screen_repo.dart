import 'package:movies_app/core/models/movie_details_model.dart';

abstract class MovieDetailsScreenRepo {
  Future<MovieDetailsResponse> getMovieDetails(int id);
}
