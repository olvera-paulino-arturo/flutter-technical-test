import 'package:bloc/bloc.dart';
import 'package:contpaqi_technical_test/features/auth/domain/models/auth_model.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/biometric_authenticate_use_case.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/check_auth_use_case.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/oauth_authenticate_use_case.dart';
import 'package:contpaqi_technical_test/features/auth/domain/usecases/store_auth_use_case.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CheckAuthUseCase checkAuthUseCase;
  final StoreAuthUseCase storeAuthUseCase;
  final BiometricAuthenticateUseCase biometricAuthenticateUseCase;
  final OAuthAuthenticateUseCase oAuthAuthenticateUseCase;

  AuthBloc({
    required this.checkAuthUseCase,
    required this.storeAuthUseCase,
    required this.biometricAuthenticateUseCase,
    required this.oAuthAuthenticateUseCase,
  }) : super(AuthInitial()) {
    on<OnCheckStoreLoginEvent>((
      OnCheckStoreLoginEvent event,
      Emitter<AuthState> emit,
    ) async {
      emit(AuthLoadingState());
      final bool result = await checkAuthUseCase.execute();
      if (result) {
        emit(AuthStorageState());
      } else {
        emit(AuthNotStorageState());
      }
    });

    on<OnStoreLoginEvent>((OnStoreLoginEvent event, Emitter<AuthState> emit) async {
      await storeAuthUseCase.execute(event.authModel);
      emit(AuthSuccessState());
    });

    on<OnBiometricLoginEvent>((
      OnBiometricLoginEvent event,
      Emitter<AuthState> emit,
    ) async {
      emit(AuthLoadingState());
      final bool accessResult = await biometricAuthenticateUseCase.execute(
        event.message,
      );
      if (accessResult) {
        emit(AuthSuccessState());
      } else {
        emit(AuthNotProvideState());
      }
    });

    on<OnOAuthLoginEvent>(
      (OnOAuthLoginEvent event, Emitter<AuthState> emit) async {
        emit(AuthLoadingState());
        try{
          final AuthModel authModel = await oAuthAuthenticateUseCase.execute();
          await storeAuthUseCase.execute(authModel);
          emit(AuthSuccessState());
        }
        catch(e) {
          emit(AuthNotProvideState());
        }
      },
    );
  }
}
