import 'package:flutter/material.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constants.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

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
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kGreyColor),
              ),
              Text(
                '11',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 60,
          height: 430,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const VideoWidget(),
              Row(
                children: const [
                  Text(
                    'JURASSIC WORLD',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Julee'),
                  ),
                  Spacer(),
                  CustomButtonWidget(
                    icon: Icons.notifications_outlined,
                    title: 'Remaind Me',
                    iconSize: 20,
                    textSize: 12,
                  ),
                  kWidth,
                  CustomButtonWidget(
                    icon: Icons.info_outline_rounded,
                    title: 'Info',
                    iconSize: 20,
                    textSize: 12,
                  ),
                ],
              ),
              kHeight,
              const Text('Coming on friday'),
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
              const Text(
                "Jurassic world",
                style: kTextExtraBold
              ),
              kHeight,
              const Text(
                '''Four years after the destruction of Isla Nublar, Biosyn operatives attempt to track down Maisie Lockwood, while Dr Ellie Sattler investigates a genetically engineered swarm of giant insects.''',
                style: TextStyle(color: kGreyColor),
              )
            ],
          ),
        ),
      ],
    );
  }
}

