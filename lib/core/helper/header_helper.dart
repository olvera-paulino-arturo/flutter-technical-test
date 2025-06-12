import 'dart:io' show HttpHeaders;

class HeaderHelper {
  static const Map<String, String> basicHeaders = { HttpHeaders.contentTypeHeader: 'application/json'};

  static Map<String, String> authHeader(String authorization) => <String, String>{ HttpHeaders.authorizationHeader: authorization};

}