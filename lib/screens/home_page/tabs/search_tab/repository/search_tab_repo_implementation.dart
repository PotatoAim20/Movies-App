import 'package:movies_app/core/api_manager.dart';
import 'package:movies_app/core/endpoints.dart';
import 'package:movies_app/core/models/movies_list_model.dart';
import 'package:movies_app/screens/home_page/tabs/search_tab/repository/search_tab_repo.dart';

class SearchTabRepoImplementation implements SearchTabRepo {
  ApiManager apiManager = ApiManager();

  @override
  Future<MoviesResponse> getMoviesList(String search) async {
    try {
      var response = await apiManager.getApi(Endpoints.listMovies, {
        'query_term': search,
      });
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
