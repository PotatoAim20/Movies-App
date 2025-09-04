import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/core/models/movie_suggestion_model.dart';

abstract class MovieDetailsScreenRepo {
  Future<MovieDetailsResponse> getMovieDetails(int id);
  Future<MovieSuggestionsResponse> getMovieSuggestions(int id);
}
