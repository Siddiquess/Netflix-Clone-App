import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 160,
          child: Image.network(
            newAndHotImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black.withAlpha(80),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_up,
                color: kWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
