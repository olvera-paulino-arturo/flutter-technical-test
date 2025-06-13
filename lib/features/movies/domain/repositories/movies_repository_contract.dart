import 'package:contpaqi_technical_test/features/movies/data/models/movie_request.dart';
import 'package:contpaqi_technical_test/features/movies/domain/models/movie_model.dart';

abstract class MoviesRepositoryContract {
  Future<List<MovieModel>> getMovies(MovieRequest movieRequest);
}