import 'package:flutter/material.dart';
import '../../core/constants.dart';

String imageUrl =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/uKvVjHNqB5VmOrdxqAt2F7J78ED.jpg';

class MainItemCards extends StatelessWidget {
  const MainItemCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 130,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
