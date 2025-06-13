import 'dart:convert';

class AuthModel {
  final String idToken;
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  AuthModel({
    required this.idToken,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    idToken: json['idToken'],
    accessToken: json['accessToken'],
    refreshToken: json['refreshToken'],
    tokenType: json['tokenType'],
  );

  factory AuthModel.fromString(String data) =>
      AuthModel.fromJson(json.decode(data));

  Map<String, dynamic> toJson() => <String, dynamic>{
    'idToken': idToken,
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'tokenType': tokenType,
  };

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
