import 'package:contpaqi_technical_test/core/helper/header_helper.dart';
import 'package:contpaqi_technical_test/core/network/network_manager.dart';
import 'package:contpaqi_technical_test/core/constants/server_configuration.dart';
import 'package:contpaqi_technical_test/features/movies/data/data_sources/remote/movie_endpoints.dart';
import 'package:contpaqi_technical_test/features/movies/data/data_sources/remote/movies_contract.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie_request.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie_response.dart';

final class MovieApi implements MoviesContract {
  final MovieEndpoints _movieEndpoints = MovieEndpoints();

  @override
  Future<MovieResponse> getMovies(MovieRequest movieRequest) async {
    final Map<String, dynamic> response = await NetworkManager.request(
      NetworkManager.prepareRequest(
        _movieEndpoints.getMovies,
        queryParameters: movieRequest.toJson(),
        headers: HeaderHelper.authHeader(ServerConfiguration.apiKey),
      ),
    );
    return MovieResponse.fromJson(response);
  }
}
