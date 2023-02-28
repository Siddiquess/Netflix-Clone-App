import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/strings.dart';
import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import '../../widgets/main_title_card.dart';
import 'widgets/main_page_background.dart';
import 'widgets/number_title_card.dart';

final ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HomeBloc>(context).add(
          const GetHomeScreenData(),
        );
      },
    );
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.hasError) {
                return const Center(
                  child: Text(
                    'Error while getting data',
                    style: TextStyle(
                      color: kWhiteColor,
                    ),
                  ),
                );
              }
              // --------- Released Past year
              final releasedPastYear = state.pastYearMovieList.map((m) {
                return "$imageAppendUrl${m.posterPath}";
              }).toList();
              // --------- trendingNow
              final trendingNow = state.trendingMovieList.map((m) {
                return "$imageAppendUrl${m.posterPath}";
              }).toList();
              // --------- tenseDrama
              final tenseDrama = state.tenseDramasMovieList.map((m) {
                return "$imageAppendUrl${m.posterPath}";
              }).toList();
              // --------- southIndian
              final southIndian = state.southIndianMovieList.map((m) {
                return "$imageAppendUrl${m.posterPath}";
              }).toList();
              southIndian.shuffle();

              // top 10 tv shows

              final top10Tvshows = state.trendingTVList.map((t) {
                return "$imageAppendUrl${t.posterPath}";
              }).toList();
              top10Tvshows.shuffle();

              return ListView(
                children: [
                  const MainPageBackgroundCard(),
                  if (releasedPastYear.length >= 10)
                    MainTitleCardWidget(
                      postrList: releasedPastYear.sublist(0, 10),
                      mainTitle: 'Released in the past year',
                    ),
                  if (trendingNow.length >= 10)
                    MainTitleCardWidget(
                      postrList: trendingNow.sublist(0, 10),
                      mainTitle: 'Trending Now',
                    ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MainTitleWidget(
                        mainTitle: "Top 10 Tv Shows In Inida Today",
                      ),
                      if (top10Tvshows.length >= 10)
                        NumberTitleCardWidget(
                          posterList: top10Tvshows.sublist(0, 10),
                        )
                    ],
                  ),
                  if (tenseDrama.length >= 10)
                    MainTitleCardWidget(
                      postrList: tenseDrama.sublist(0, 10),
                      mainTitle: 'Tense Dramas',
                    ),
                  if (southIndian.length >= 10)
                    MainTitleCardWidget(
                      postrList: southIndian.sublist(0, 10),
                      mainTitle: 'South Indian Cinema',
                    ),
                ],
              );
            },
          ),
          ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, bool value, child) {
                return NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;
                      if (direction == ScrollDirection.reverse) {
                        scrollNotifier.value = false;
                      } else if (direction == ScrollDirection.forward) {
                        scrollNotifier.value = true;
                      }
                      return true;
                    },
                    child: scrollNotifier.value
                        ? AnimatedContainer(
                            duration: const Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 80,
                            color: Colors.black.withAlpha(70),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      netflixLogo,
                                      width: 50,
                                      height: 50,
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.cast,
                                        color: Colors.white,
                                      ),
                                    ),
                                    kWidth,
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blueGrey,
                                    ),
                                    kWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      'TV Shows',
                                      style: kHomeTitleText,
                                    ),
                                    Text(
                                      'Movies',
                                      style: kHomeTitleText,
                                    ),
                                    Text(
                                      'Categories',
                                      style: kHomeTitleText,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        : const SizedBox());
              })
        ],
      ),
    );
  }
}
