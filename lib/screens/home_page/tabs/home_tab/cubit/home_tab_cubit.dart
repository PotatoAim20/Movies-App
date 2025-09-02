import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/models/movies_list_model.dart';
import 'package:movies_app/screens/home_page/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:movies_app/screens/home_page/tabs/home_tab/repository/home_tab_repo.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  static HomeTabCubit get(context) => BlocProvider.of<HomeTabCubit>(context);

  HomeTabRepo homeTabRepo;
  HomeTabCubit(this.homeTabRepo) : super(HomeTabInitState());

  MoviesResponse? moviesResponse;

  Future<void> getMoviesList() async {
    try {
      emit(GetMoviesListLoadingState());
      var result = await homeTabRepo.getMoviesList();
      moviesResponse = result;
      emit(GetMoviesListSuccessState());
    } catch (e) {
      emit(GetMoviesListErrorState());
    }
  }
}
