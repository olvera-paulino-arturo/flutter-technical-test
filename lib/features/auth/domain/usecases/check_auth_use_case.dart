import 'package:contpaqi_technical_test/features/app/domain/repositories/usecase.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';
import 'package:contpaqi_technical_test/features/auth/domain/repositories/auth_storage_repository_contract.dart';

class CheckAuthUseCase implements UseCaseBase<bool> {
  final AuthStorageRepositoryContract repository;

  CheckAuthUseCase({required this.repository});

  @override
  Future<bool> execute() async {
    final AuthModel? authModel = await repository.getUserData();
    return authModel != null;
  }


}