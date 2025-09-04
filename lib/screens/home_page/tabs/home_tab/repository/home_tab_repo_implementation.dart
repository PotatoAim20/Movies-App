import 'package:movies_app/core/api_manager.dart';
import 'package:movies_app/core/endpoints.dart';
import 'package:movies_app/core/models/movies_list_model.dart';
import 'package:movies_app/screens/home_page/tabs/home_tab/repository/home_tab_repo.dart';

class HomeTabRepoImplementation implements HomeTabRepo {
  ApiManager apiManager = ApiManager();

  @override
  Future<MoviesResponse> getMoviesList() async {
    try {
      var response = await apiManager.getApi(Endpoints.listMovies, {
        'limit': 50,
      });
      MoviesResponse result = MoviesResponse.fromJson(response.data);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
