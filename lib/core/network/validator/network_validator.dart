import 'dart:convert';

import 'package:contpaqi_technical_test/core/network/error/network_exception.dart';
import 'package:contpaqi_technical_test/features/app/domain/models/network/catalogs/http_error_code.dart';
import 'package:http/http.dart';

class NetworkValidator {
  static bool _validation(int statusCode) {
    return statusCode >= 100 && statusCode <= 299;
  }

  static Map<String, dynamic> tryMap(Response response) {
    if (_validation(response.statusCode)) {
      return json.decode(utf8.decode(response.bodyBytes))
          as Map<String, dynamic>;
    }
    final HttpErrorCode statusCode = HttpErrorCode.values.firstWhere(
      (HttpErrorCode element) => element.code == response.statusCode,
    );

    switch (statusCode) {
      case HttpErrorCode.badRequest:
        throw NetworkException(code: statusCode.code);
      case HttpErrorCode.unauthorized:
        throw NetworkException(code: statusCode.code);
      case HttpErrorCode.notFound:
        throw NetworkException(code: statusCode.code);
      case HttpErrorCode.methodNotAllowed:
        throw NetworkException(code: statusCode.code);
      case HttpErrorCode.internalServerError:
        throw NetworkException(code: statusCode.code);
    }
  }
}
