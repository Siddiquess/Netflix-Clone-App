import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentation/widgets/video_widget.dart';

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
        body: TabBarView(
          children: [
            _buildComingSoon(context),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  _buildComingSoon(context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) =>const EveryOnesWatchingWidget(),
    );
  }
}
