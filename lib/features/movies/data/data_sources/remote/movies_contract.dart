import 'package:contpaqi_technical_test/features/movies/data/models/movie_request.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie_response.dart';

abstract class MoviesContract {
  Future<MovieResponse> getMovies(MovieRequest movieRequest);
}
