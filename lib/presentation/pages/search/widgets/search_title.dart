import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextTitle extends StatelessWidget {
  const SearchTextTitle({super.key, required this.searchTitle});

  final String searchTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      searchTitle,
      style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
