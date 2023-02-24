import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

import 'main_item_card.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget({
    Key? key,required this.mainTitle
  }) : super(key: key);
  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         MainTitleWidget(mainTitle: mainTitle),
        LimitedBox(
          maxHeight: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => const MainItemCards(),
            ),
          ),
        )
      ],
    );
  }
}