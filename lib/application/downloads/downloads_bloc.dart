import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_download_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'downloads_bloc.freezed.dart';
part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>(
      (event, emit) async {
        if (state.downloads.isNotEmpty) {
          emit(
            state.copyWith(
              isLoading: false,
              downloadFailureOrSuccessOption: none(),
            ),
          );
          return;
        }
        emit(
          state.copyWith(
            isLoading: true,
            downloadFailureOrSuccessOption: none(),
          ),
        );
        final Either<MainFailure, List<Downloads>> downloadsOption =
            await _downloadsRepo.getDownloadsImages();
        emit(
          downloadsOption.fold(
            (failure) => state.copyWith(
              isLoading: false,
              downloadFailureOrSuccessOption: some(
                left(failure),
              ),
            ),
            (success) => state.copyWith(
              isLoading: false,
              downloads: success,
              downloadFailureOrSuccessOption: some(
                right(success),
              ),
            ),
          ),
        );
      },
    );
  }
}
