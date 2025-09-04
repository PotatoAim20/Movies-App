import 'package:movies_app/core/models/movies_list_model.dart';

abstract class SearchTabRepo {
  Future<MoviesResponse> getMoviesList(String search);
}
