import 'package:flutter/material.dart';

import 'number_stack_card.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    Key? key,
    required this.posterList,
  }) : super(key: key);

  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          10,
          (index) => NumberStackCard(
            index: index,
            imageUrl: posterList[index],
          ),
        ),
      ),
    );
  }
}
