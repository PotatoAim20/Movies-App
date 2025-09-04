import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/models/movies_list_model.dart';
import 'package:movies_app/screens/home_page/tabs/search_tab/cubit/search_tab_states.dart';
import 'package:movies_app/screens/home_page/tabs/search_tab/repository/search_tab_repo.dart';

class SearchTabCubit extends Cubit<SearchTabStates> {
  static SearchTabCubit get(context) =>
      BlocProvider.of<SearchTabCubit>(context);

  SearchTabRepo searchTabRepo;
  SearchTabCubit(this.searchTabRepo) : super(SearchTabInitState());

  MoviesResponse? moviesResponse;

  Future<void> getMoviesList(String search) async {
    try {
      emit(GetMoviesSearchLoadingState());
      var result = await searchTabRepo.getMoviesList(search);
      moviesResponse = result;
      emit(GetMoviesSearchSuccessState());
    } catch (e) {
      emit(GetMoviesSearchErrorState());
    }
  }
}
