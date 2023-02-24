import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 30,
    this.textSize = 16,
  });
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          kHeight,
          Icon(
            icon,
            color: kWhiteColor,
            size: iconSize,
          ),
          Text(
            title,
            style:  TextStyle(
              color: kWhiteColor,
              fontSize: textSize,
            ),
          ),
          kHeight
        ],
      ),
    );
  }
}
