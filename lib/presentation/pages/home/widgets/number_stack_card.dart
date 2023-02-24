import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/widgets/main_item_card.dart';

class NumberStackCard extends StatelessWidget {
  const NumberStackCard({super.key, required this.index});
  final int index;

  final imageUrl =
      'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: const [
            SizedBox(
              width: 40,
            ),
            MainItemCards()
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
