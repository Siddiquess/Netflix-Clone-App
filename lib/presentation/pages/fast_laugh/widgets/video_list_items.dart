import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import '../../../widgets/custom_button_widget.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/uDgy6hyPd82kOHh6I95FLtLnj6p.jpg';

class VideoListItems extends StatelessWidget {
  const VideoListItems({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ---- Left side
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Positioned(
          left: 5,
          bottom: 5,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black.withAlpha(80),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_up),
                  ),
                ),
                // ---- Right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                    kHeight,
                    CustomButtonWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    CustomButtonWidget(icon: Icons.add, title: 'My List'),
                    CustomButtonWidget(icon: Icons.share, title: 'Share'),
                    CustomButtonWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}


