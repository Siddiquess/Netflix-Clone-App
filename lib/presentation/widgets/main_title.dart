import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({super.key, required this.mainTitle});

  final String mainTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        mainTitle,
        style: GoogleFonts.montserrat(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
