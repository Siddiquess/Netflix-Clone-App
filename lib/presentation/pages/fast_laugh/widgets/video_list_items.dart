import 'package:flutter/material.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import '../../../widgets/custom_button_widget.dart';

class VideoListItemsInheritdWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemsInheritdWidget({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemsInheritdWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemsInheritdWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemsInheritdWidget>();
  }
}

class VideoListItems extends StatelessWidget {
  const VideoListItems({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemsInheritdWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrl[index % dummyVideoUrl.length];
    return Stack(
      children: [
        // ---- Left side
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanged: (bool isPlaying) {},
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: posterPath == null
                            ? null
                            : NetworkImage('$imageAppendUrl${posterPath}'),
                      ),
                    ),
                    kHeight,
                    ValueListenableBuilder(
                      valueListenable: likedVideoIdsNotifier,
                      builder: (context, Set<int> newLikedListIds, _) {
                        final _index = index;
                        if (newLikedListIds.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnLikeVideo(id: _index));
                              likedVideoIdsNotifier.value.remove(_index);
                              likedVideoIdsNotifier.notifyListeners();
                            },
                            child: const CustomButtonWidget(
                                icon: Icons.thumb_up, title: 'Liked'),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(LikeVideo(id: _index));
                            likedVideoIdsNotifier.value.add(_index);
                            likedVideoIdsNotifier.notifyListeners();
                          },
                          child: const CustomButtonWidget(
                              icon: Icons.emoji_emotions, title: 'LOL'),
                        );
                      },
                    ),
                    const CustomButtonWidget(icon: Icons.add, title: 'My List'),
                    GestureDetector(
                      onTap: () {
                        final movieName =
                            VideoListItemsInheritdWidget.of(context)
                                ?.movieData
                                .title;
                        if (movieName != null) {
                          Share.share(movieName);
                        }
                      },
                      child: const CustomButtonWidget(
                          icon: Icons.share, title: 'Share'),
                    ),
                    const CustomButtonWidget(
                        icon: Icons.play_arrow, title: 'Play'),
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

class FastLaughVideoPlayer extends StatefulWidget {
  const FastLaughVideoPlayer({
    super.key,
    required this.videoUrl,
    required this.onStateChanged,
  });
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    );
    _videoPlayerController.initialize().then((value) {
      setState(() {});
    });
    _videoPlayerController.play();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController))
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }
}
