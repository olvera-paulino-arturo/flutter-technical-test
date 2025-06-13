import 'package:contpaqi_technical_test/core/constants/oauth_configuration.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class OAuthDataSource {
  final FlutterAppAuth _appAuth = const FlutterAppAuth();

  Future<AuthModel> authenticate() async {
    final AuthorizationTokenRequest request = AuthorizationTokenRequest(
      OAuthConfiguration.clientId,
      OAuthConfiguration.redirectUrl,
      discoveryUrl: OAuthConfiguration.discoveryUrl,
      scopes: OAuthConfiguration.scopeList,
    );

    try {
      final AuthorizationTokenResponse result = await _appAuth
          .authorizeAndExchangeCode(request);

      return AuthModel(
        idToken: result.idToken ?? '',
        accessToken: result.accessToken ?? '',
        refreshToken: result.refreshToken ?? '',
        tokenType: result.tokenType ?? '',
      );
    } catch (e) {
      rethrow;
    }
  }

}