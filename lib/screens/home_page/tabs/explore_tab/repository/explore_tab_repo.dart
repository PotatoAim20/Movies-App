import 'package:movies_app/core/models/movies_list_model.dart';

abstract class ExploreTabRepo {
  Future<MoviesResponse> getMoviesList(String selectedGenre);
}
