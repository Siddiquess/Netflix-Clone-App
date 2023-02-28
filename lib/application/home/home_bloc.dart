import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_service.dart';

import '../../domain/hot_and_new/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;
  HomeBloc(this._homeService) : super(HomeState.initial()) {
    // On event get HomeScreen data
    on<GetHomeScreenData>((event, emit) async {
      // send loading to UI
      emit(state.copyWith(
        hasError: false,
        isLoading: true,
      ));

      // Get Data
      final movieResult = await _homeService.getHotandNewMovieData();
      final tvResult = await _homeService.getHotandNewTVData();

      // transform data

      final state1 = movieResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTVList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp response) {
          final pastYear = response.results;
          final trending = response.results;
          final dramas = response.results;
          final southIndian = response.results;

          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            tenseDramasMovieList: dramas,
            southIndianMovieList: southIndian,
            trendingTVList: state.trendingTVList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(state1);

      final state2 = tvResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            tenseDramasMovieList: [],
            southIndianMovieList: [],
            trendingTVList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp response) {
          final top10List = response.results;
          return HomeState(
            stateId: DateTime.now().millisecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: top10List,
            tenseDramasMovieList: state.tenseDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingTVList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(state2);
    });
  }
}
