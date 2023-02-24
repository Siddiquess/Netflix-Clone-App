import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';
import '../../core/constants.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
  });
  final String title;
  final IconData icon;

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
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: kWhiteColor,
              fontSize: 16,
            ),
          ),
          kHeight
        ],
      ),
    );
  }
}