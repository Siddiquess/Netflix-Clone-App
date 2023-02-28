import 'package:flutter/material.dart';
import '../../core/constants.dart';


class MainItemCards extends StatelessWidget {
  final String imageUrl;
  const MainItemCards({
   super.key,
    required this.imageUrl,
  });

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
