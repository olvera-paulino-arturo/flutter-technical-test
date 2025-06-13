import 'package:contpaqi_technical_test/features/app/domain/repositories/usecase.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';
import 'package:contpaqi_technical_test/features/auth/domain/repositories/auth_storage_repository_contract.dart';

class StoreAuthUseCase implements UseCase<void, AuthModel> {
  final AuthStorageRepositoryContract repository;

  StoreAuthUseCase({required this.repository});

  @override
  Future<void> execute(AuthModel params) async {
    await repository.savaUserData(params);
  }

}