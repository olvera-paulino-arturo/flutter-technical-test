import 'package:contpaqi_technical_test/features/app/domain/models/network/catalogs/http_protocol.dart';

class ServerConfiguration {
  static const String serverUrl = 'api.themoviedb.org';
  static const HttpProtocol httpType = HttpProtocol.https;
  static const String imageURL = 'https://image.tmdb.org/t/p/w500/';
  static const String apiKey = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzBiZDg3OGU1ZDM0NjZkODBlZTkzMmZlMzc4ODU1MiIsIm5iZiI6MTc0MDc3MjU5Ny41MTAwMDAyLCJzdWIiOiI2N2MyMTRmNTU3ZjQ5Yzg0MTY1M2FjZDAiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.Y5al_VKrGvRbfdWYTHxYPN2LaRciHjNaqn5FyQjs7Zc';
}