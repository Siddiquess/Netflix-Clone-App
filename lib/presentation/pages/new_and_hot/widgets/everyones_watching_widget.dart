import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryOnesWatchingWidget({
    super.key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight20,
        Row(
          children: [
            Image.network(
              netflixLogo,
              width: 20,
              height: 20,
            ),
            const Text(
              'NETFLIX',
              style: TextStyle(fontSize: 10, letterSpacing: 2),
            ),
          ],
        ),
        kHeight, 
        Text(
          movieName,
          style: kTextExtraBold,
        ),
        kHeight,
        Text(description),
        kHeight50,
        VideoWidget(posterPath: posterPath),
        kHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Text(
              movieName,
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: const TextStyle(
                fontSize: 20,

                fontWeight: FontWeight.bold,
              ),
            )),
            Row(
              children: const [
                CustomButtonWidget(
                  icon: Icons.telegram,
                  title: 'Share',
                  iconSize: 35,
                ),
                CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  iconSize: 35,
                ),
                CustomButtonWidget(
                  icon: Icons.play_arrow,
                  title: 'Play',
                  iconSize: 35,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
