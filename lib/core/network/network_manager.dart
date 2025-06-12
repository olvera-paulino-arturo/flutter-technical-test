import 'dart:async';
import 'dart:convert';

import 'package:contpaqi_technical_test/core/helper/header_helper.dart';
import 'package:contpaqi_technical_test/core/helper/uri_helper.dart';
import 'package:contpaqi_technical_test/core/network/error/network_exception.dart';
import 'package:contpaqi_technical_test/core/network/validator/network_validator.dart';
import 'package:contpaqi_technical_test/core/utils/server_configuration.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/network/catalogs/http_type.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/network/endpoint.dart';
import 'package:http/http.dart' show Client, Response;

class NetworkManager {

  static Future<Response> prepareRequest(
    Endpoint prepareEndpoint, {
    List<String> parameters = const <String>[],
    Map<String, String> headers = HeaderHelper.basicHeaders,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    String serverUrl = ServerConfiguration.serverUrl
  }) {
    final Endpoint endpoint = UriHelper.prepareUri(
      prepareEndpoint,
      ServerConfiguration.httpType,
      parameters: parameters,
      queryParameters: queryParameters,
      serverUrl: serverUrl,
    );

    Future<Response> request;

    final Client client = Client();
    switch (endpoint.type) {
      case HttpType.get:
        request = client.get(endpoint.uri, headers: headers);
      case HttpType.post:
        request = client.post(
          endpoint.uri,
          headers: headers,
          body: body != null ? jsonEncode(body) : body,
        );
      case HttpType.delete:
        request = client.delete(
          endpoint.uri,
          headers: headers,
          body: body != null ? jsonEncode(body) : body,
        );
      case HttpType.put:
        request = client.put(
          endpoint.uri,
          headers: headers,
          body: body != null ? jsonEncode(body) : body,
        );
    }
    return request;
  }

  static Future<Map<String, dynamic>> request(Future<Response> client) async {
    try {
      final Response response = await client.timeout(const Duration(seconds: 5));
      final Map<String, dynamic> mapResponse = NetworkValidator.tryMap(response);
      return mapResponse;
    }  on NetworkException catch (httpException) {
      rethrow;
    } on TimeoutException catch (timeoutException) {
      throw NetworkException(code: -1, message: 'timeout');
    }
    catch (e) {
      throw NetworkException(code: -2, message: 'UnknownError');
    }
  }
}
