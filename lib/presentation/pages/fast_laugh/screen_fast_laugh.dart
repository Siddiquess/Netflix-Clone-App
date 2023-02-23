import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/pages/fast_laugh/widgets/video_list_items.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            10,
            (index) => VideoListItems(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
