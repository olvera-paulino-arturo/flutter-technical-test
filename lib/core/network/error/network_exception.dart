class NetworkException implements Exception {
  final int code;
  String? message;

  NetworkException({required this.code, this.message});

  @override
  String toString() {
    return 'NetworkException( statusCode: $code)';
  }

}