import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/constants.dart';
import '../../../widgets/custom_button_widget.dart';

class MainPageBackgroundCard extends StatelessWidget {
  const MainPageBackgroundCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            color: kWhiteColor,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(kMainImage),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(icon: Icons.add, title: 'My List'),
                _playButton(),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: CustomButtonWidget(
                      icon: Icons.info_outline, title: 'Info'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  ElevatedButton _playButton() {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kWhiteColor),
      ),
      child: Row(
        children: const [
          Icon(
            Icons.play_arrow,
            color: kBlackColor,
            // size: 30,
          ),
          kWidth,
          Text(
            "Play",
            style: kBlackText,
          )
        ],
      ),
    );
  }
}