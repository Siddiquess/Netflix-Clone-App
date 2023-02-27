import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads.freezed.dart';
part 'downloads.g.dart';

@freezed
class Downloads with _$Downloads {
  const factory Downloads({
    @JsonKey(name: "backdrop_path") String? bakdropPath,
    @JsonKey(name: "poster_path") String? posterPath,
    @JsonKey(name: "title") String? title,
  }) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
