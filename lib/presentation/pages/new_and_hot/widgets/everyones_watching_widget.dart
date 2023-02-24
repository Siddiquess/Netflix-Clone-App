import 'package:flutter/material.dart';
import '../../../../core/constants.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/video_widget.dart';

class EveryOnesWatchingWidget extends StatelessWidget {
  const EveryOnesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        const Text(
          'Friends',
          style: kTextExtraBold,
        ),
        kHeight,
        const Text(
          '''Six young people from New York City, on their own and struggling to survive in the real world, find the companionship, comfort and support they get from each other to be the perfect antidote to the pressures of life.''',
        ),
        kHeight50,
        const VideoWidget(),
        kHeight20,
        Row(
          children: const [
            Text('Movie name'),
            Spacer(),
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
        )
      ],
    );
  }
}
