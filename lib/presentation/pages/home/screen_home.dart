import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    return Scaffold(
      body: ValueListenableBuilder(
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
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const MainPageBackgroundCard(),
                      const MainTitleCardWidget(
                          mainTitle: 'Released in the past year'),
                      const MainTitleCardWidget(mainTitle: 'Trending Now'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          MainTitleWidget(
                              mainTitle: "Top 10 Tv Shows In Inida Today"),
                          NumberTitleCardWidget()
                        ],
                      ),
                      const MainTitleCardWidget(mainTitle: 'Tense Dramas'),
                      const MainTitleCardWidget(
                          mainTitle: 'South Indian Cinema'),
                    ],
                  ),
                  scrollNotifier.value
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
                      : const SizedBox()
                ],
              ),
            );
          }),
    );
  }
}
