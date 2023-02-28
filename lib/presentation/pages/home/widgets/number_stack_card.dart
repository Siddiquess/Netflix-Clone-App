import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

import '../../../widgets/main_item_card.dart';

class NumberStackCard extends StatelessWidget {
  const NumberStackCard(
      {super.key, required this.index, required this.imageUrl});
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            MainItemCards(
              imageUrl: imageUrl,
            )
          ],
        ),
        Positioned(
          left: 10,
          bottom: -25,
          child: BorderedText(
            strokeWidth: 5.0,
            strokeColor: kWhiteColor,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  letterSpacing: -10,
                  color: kBlackColor,
                  fontSize: 120,
                  fontWeight: FontWeight.bold

                  // decoration: TextDecoration.none,
                  // decorationColor: Colors.red,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
