import 'package:contpaqi_technical_test/features/movies/data/data_sources/remote/movie_api.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie.dart';
import 'package:contpaqi_technical_test/features/movies/domain/models/movie_model.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie_request.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie_response.dart';
import 'package:contpaqi_technical_test/features/movies/domain/repositories/movies_repository_contract.dart';

class MoviesRepository implements MoviesRepositoryContract{
  final MovieApi movieApi = MovieApi();

  @override
  Future<List<MovieModel>> getMovies(MovieRequest movieRequest) async {
    try {
      final MovieResponse response = await movieApi.getMovies(movieRequest);
      final List<MovieModel> movieModel = response.movies.map((Movie movie) => movie.toDomain()).toList();
      return movieModel;
    }
    catch(e) {
      rethrow;
    }
  }

}