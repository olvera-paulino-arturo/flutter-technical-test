import 'package:contpaqi_technical_test/core/constants/server_configuration.dart';
import 'package:contpaqi_technical_test/features/app/data/data_sources/remote/repositories/endpoint_base_container.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/network/catalogs/http_type.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/network/endpoint.dart';

final class MovieEndpoints implements EndpointBaseContainer {
  @override
  String get requestMapping => '/3/movie/now_playing';

  @override
  String get serverUrl => ServerConfiguration.serverUrl;

  Endpoint get getMovies => Endpoint(endpoint: requestMapping, type: HttpType.get);

}
