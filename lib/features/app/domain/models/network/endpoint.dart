import 'package:contpaqi_technical_test/features/app/domain/models/network/catalogs/http_type.dart';

class Endpoint {
  Endpoint({required this.endpoint, required this.type});

  final String endpoint;
  final HttpType type;
  late Uri uri;

  Endpoint copyWith({String? endpoint, HttpType? type}) {
    return Endpoint(
      endpoint: endpoint ?? this.endpoint,
      type: type ?? this.type,
    );
  }
}
