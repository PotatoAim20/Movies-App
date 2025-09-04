import 'package:movies_app/core/api_manager.dart';
import 'package:movies_app/core/endpoints.dart';
import 'package:movies_app/core/models/movies_list_model.dart';
import 'package:movies_app/screens/home_page/tabs/explore_tab/repository/explore_tab_repo.dart';

class ExploreTabRepoImplementation implements ExploreTabRepo {
  ApiManager apiManager = ApiManager();

  @override
  Future<MoviesResponse> getMoviesList(String selectedGenre) async {
    try {
      var response = await apiManager.getApi(Endpoints.listMovies, {
        'genre': selectedGenre,
      });
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
