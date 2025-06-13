import 'package:contpaqi_technical_test/features/auth/data/data_sources/oauth/oauth_datasource.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';
import 'package:contpaqi_technical_test/features/auth/domain/repositories/oauth_repository_contract.dart';

class OAuthRepository implements OAuthRepositoryContract {
  final OAuthDataSource _oAuthDataSource = OAuthDataSource();

  @override
  Future<AuthModel> authenticate() {
    return _oAuthDataSource.authenticate();
  }

}