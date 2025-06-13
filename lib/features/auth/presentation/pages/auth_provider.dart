import 'package:contpaqi_technical_test/features/auth/data/repositories/auth_storage_repository.dart';
import 'package:contpaqi_technical_test/features/auth/data/repositories/biometric_repository.dart';
import 'package:contpaqi_technical_test/features/auth/data/repositories/oauth_repository.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/biometric_authenticate_use_case.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/check_auth_use_case.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/oauth_authenticate_use_case.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/store_auth_use_case.dart';
import 'package:contpaqi_technical_test/features/auth/presentation/state/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthProvider extends StatelessWidget {
  final Widget child;
  const AuthProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create:
          (BuildContext context) => AuthBloc(
            checkAuthUseCase: CheckAuthUseCase(
              repository: AuthStorageRepository(),
            ),
            storeAuthUseCase: StoreAuthUseCase(
              repository: AuthStorageRepository(),
            ),
            biometricAuthenticateUseCase: BiometricAuthenticateUseCase(
              repository: BiometricRepository(),
            ),
            oAuthAuthenticateUseCase: OAuthAuthenticateUseCase(
              oAuthRepository: OAuthRepository(),
            ),
          ),
      child: child,
    );
  }
}
