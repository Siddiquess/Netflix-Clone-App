import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final List _widgetList = [
    const _SmartDownloads(),
    const Section2(),
    const Section3()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => _widgetList[index],
          separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
          itemCount: _widgetList.length),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text('Smart Downloads')
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Text(
          "Introducing Downloads for You",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: kWhiteColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          '''we'll download a personalised selection of
movies and shows for you, so there's
always somthing to watch on your 
device''',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            try {
              return SizedBox(
                width: size.width,
                // height: size.width,
                child: state.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: size.width * 1.15 / 4,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                          DownloadImageWidget(
                            size: Size(size.width * 0.3, size.width * 0.39),
                            angle: 23,
                            margin:
                                const EdgeInsets.only(left: 130, bottom: 37),
                            imageList:
                                '$imageAppendUrl${state.downloads[0].posterPath}',
                          ),
                          DownloadImageWidget(
                            size: Size(size.width * 0.3, size.width * 0.39),
                            angle: -23,
                            margin:
                                const EdgeInsets.only(right: 130, bottom: 37),
                            imageList:
                                '$imageAppendUrl${state.downloads[1].posterPath}',
                          ),
                          DownloadImageWidget(
                            size: Size(size.width * 0.32, size.width * 0.45),
                            margin: const EdgeInsets.only(top: 0),
                            imageList:
                                '$imageAppendUrl${state.downloads[2].posterPath}',
                          ),
                        ],
                      ),
              );
            } catch (e) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            return kHeight;
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set Up',
                style: TextStyle(
                    color: kButtonColorWhite,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kWhiteColor,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    Key? key,
    required this.size,
    this.angle = 0,
    required this.margin,
    required this.imageList,
  }) : super(key: key);

  final Size size;
  final double angle;
  final EdgeInsets margin;
  final String imageList;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Padding(
        padding: margin,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList),
            ),
          ),
        ),
      ),
    );
  }
}
