import 'package:movies_app/core/api_manager.dart';
import 'package:movies_app/core/endpoints.dart';
import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/core/models/movie_suggestion_model.dart';
import 'package:movies_app/screens/movie_details/repository/movie_details_screen_repo.dart';

class MovieDetailsScreenRepoImplementation implements MovieDetailsScreenRepo {
  ApiManager apiManager = ApiManager();

  @override
  Future<MovieDetailsResponse> getMovieDetails(int id) async {
    try {
      var response = await apiManager.getApi(Endpoints.movieDetails, {
        "movie_id": id,
        "with_images": true,
        "with_cast": true,
      });
      MovieDetailsResponse result = MovieDetailsResponse.fromJson(
        response.data,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieSuggestionsResponse> getMovieSuggestions(int id) async {
    try {
      var response = await apiManager.getApi(Endpoints.movieSuggestions, {
        "movie_id": id,
      });
      MovieSuggestionsResponse result = MovieSuggestionsResponse.fromJson(
        response.data,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
