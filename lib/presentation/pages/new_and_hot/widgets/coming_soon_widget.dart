import 'package:flutter/material.dart';

import '../../../../core/colors.dart';
import '../../../../core/constants.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 60,
          height: 430,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: size.width - 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 VideoWidget(posterPath: posterPath),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 20,
                      
                          fontWeight: FontWeight.bold,
                          // fontFamily: 'Julee',
                        ),
                      ),
                    ),
                    // const Spacer(),
                    const CustomButtonWidget(
                      icon: Icons.notifications_outlined,
                      title: 'Remaind Me',
                      iconSize: 20,
                      textSize: 12,
                    ),
                    kWidth,
                    const CustomButtonWidget(
                      icon: Icons.info_outline_rounded,
                      title: 'Info',
                      iconSize: 20,
                      textSize: 12,
                    ),
                  ],
                ),
                kHeight,
                Text('Coming on $day $month '),
                kHeight,
                Row(
                  children: [
                    Image.network(
                      netflixLogo,
                      width: 20,
                      height: 20,
                    ),
                    const Text(
                      'FILM',
                      style: TextStyle(fontSize: 10, letterSpacing: 2),
                    )
                  ],
                ),
                kHeight,
                Text(movieName, style: kTextExtraBold),
                kHeight,
                Text(
                  description,
                  style: const TextStyle(color: kGreyColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
