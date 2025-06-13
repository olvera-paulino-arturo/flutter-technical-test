import 'package:contpaqi_technical_test/features/app/domain/repositories/usecase.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';
import 'package:contpaqi_technical_test/features/auth/domain/repositories/oauth_repository_contract.dart';

class OAuthAuthenticateUseCase implements UseCaseBase<AuthModel> {
  final OAuthRepositoryContract oAuthRepository;

  OAuthAuthenticateUseCase({required this.oAuthRepository});

  @override
  Future<AuthModel> execute() async {
   return oAuthRepository.authenticate();
  }

}