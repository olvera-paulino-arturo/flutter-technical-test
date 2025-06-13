
import 'package:contpaqi_technical_test/features/app/domain/repositories/usecase.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie_request.dart';
import 'package:contpaqi_technical_test/features/movies/domain/models/movie_language_request.dart';
import 'package:contpaqi_technical_test/features/movies/domain/models/movie_model.dart';
import 'package:contpaqi_technical_test/features/movies/domain/repositories/movies_repository_contract.dart';

class MoviesUseCase extends UseCase<List<MovieModel>, MovieLanguageRequest> {
  final MoviesRepositoryContract repository;

  MoviesUseCase({required this.repository});

  @override
  Future<List<MovieModel>> execute(MovieLanguageRequest params) async {
    final String language = params.language.split('_')[0];
    final List<MovieModel> movieList = await repository.getMovies(MovieRequest(language: language));
    return movieList;
  }


}