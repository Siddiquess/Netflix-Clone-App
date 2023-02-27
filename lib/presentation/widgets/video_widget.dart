import 'package:flutter/material.dart';
import '../../core/colors.dart';

class VideoWidget extends StatelessWidget {
  final String posterPath;
  const VideoWidget({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 160,
          child: Image.network(
            posterPath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text(
                  "Couldn't load Image"
                  
                ),
              );
            },
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
