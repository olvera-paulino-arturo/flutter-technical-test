import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';

abstract class OAuthRepositoryContract {
  Future<AuthModel> authenticate();
}