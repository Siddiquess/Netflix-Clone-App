import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentation/pages/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/presentation/pages/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/pages/home/screen_home.dart';
import 'package:netflix_clone/presentation/pages/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/pages/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/pages/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, child) {
              return pages[index];
            }),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
