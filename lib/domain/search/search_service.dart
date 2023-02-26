import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/models/search_response/search_response.dart';

import '../core/failures/main_failure.dart';

abstract class SearchService{
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });

}