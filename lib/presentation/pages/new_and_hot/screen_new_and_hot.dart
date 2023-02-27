import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';

import 'widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'New & Hot',
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
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
          bottom: TabBar(
            isScrollable: true,
            labelColor: kBlackColor,
            unselectedLabelColor: kWhiteColor,
            labelStyle: kHomeTitleText,
            indicator: BoxDecoration(
              color: kWhiteColor,
              borderRadius: kRadius30,
            ),
            tabs: const [
              Tab(text: '🍿 Coming Soon'),
              Tab(
                text: "👀 Everyone's watching",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ComingSoonList(
              key: Key('coming_soon'),
            ),
            EveryOneIsWatchingList(
              key: Key('everyone_is_watching'),
            )
          ],
        ),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataInComingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while loading Data'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('ComingSoon is Empty'),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: state.comingSoonList.length,
              itemBuilder: (context, index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return kHeight;
                }
                String month = '';
                String day = '';
                try {
                  final date = DateTime.parse(movie.releaseDate!);
                  final formatedDate = DateFormat.yMMMMd('en_US').format(date);
                  month = formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  day = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  day = '';
                }

                return ComingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: day,
                  posterPath: '$imageAppendUrl${movie.backdropPath}',
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? "No Description",
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoadDataInEveryoneIsWatching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryoneIsWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text('Error while loading Data'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('ComingSoon is Empty'),
            );
          } else {
            return ListView.builder(
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyOneIsWatchingList[index];
                if (tv.id == null) {
                  return kHeight;
                }

                return EveryOnesWatchingWidget(
                  posterPath: '$imageAppendUrl${tv.backdropPath}',
                  movieName: tv.originalName ?? "No Title Provided",
                  description: tv.overview ?? "No Description",
                );
              },
            );
          }
        },
      ),
    );
  }
}
