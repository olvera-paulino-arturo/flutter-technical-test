import 'package:contpaqi_technical_test/core/helper/url_parameter_helper.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/network/catalogs/http_protocol.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/network/endpoint.dart';

class UriHelper {
  static Endpoint prepareUri(
      Endpoint endpoint, HttpProtocol httpType, {
        List<String> parameters = const <String>[],
        Map<String, dynamic>? queryParameters,
        required String serverUrl
      }) {

    final String url = UrlParameterHelper.mapper(endpoint.endpoint);

    final Endpoint endpointPrepared = endpoint.copyWith(endpoint: url);

    switch (httpType) {
      case HttpProtocol.http:
        endpointPrepared.uri = Uri.http(
          serverUrl,
          endpointPrepared.endpoint,
          queryParameters,
        );
        return endpointPrepared;
      case HttpProtocol.https:
        endpointPrepared.uri = Uri.https(
          serverUrl,
          endpointPrepared.endpoint,
          queryParameters,
        );
        return endpointPrepared;
    }
  }
}