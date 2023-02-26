import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrl = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

ValueNotifier<Set<int>> likedVideoIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      // sending Loading to UI
      emit(
        const FastLaughState(
          videosList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //   get trending movies

      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold(
        (l) => const FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        ),
        (respone) => FastLaughState(
          videosList: respone,
          isLoading: false,
          isError: false,
        ),
      );

      // send to ui
      emit(_state);
    });

    on<LikeVideo>((event, emit) async {
      likedVideoIdsNotifier.value.add(event.id);
      likedVideoIdsNotifier.notifyListeners();
    });

    on<UnLikeVideo>((event, emit) async {
      likedVideoIdsNotifier.value.remove(event.id);
      likedVideoIdsNotifier.notifyListeners();
    });
  }
}
