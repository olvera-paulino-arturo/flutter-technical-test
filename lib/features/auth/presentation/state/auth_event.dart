part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class OnCheckStoreLoginEvent extends AuthEvent {
  @override
  List<Object?> get props => <Object?>[];
}

class OnStoreLoginEvent extends AuthEvent {
  final AuthModel authModel;

  const OnStoreLoginEvent({required this.authModel});

  @override
  List<Object?> get props => <Object?>[authModel];

}

class OnBiometricLoginEvent extends AuthEvent {
  final String message;

  const OnBiometricLoginEvent({required this.message});

  @override
  List<Object?> get props => <Object?>[message];

}

class OnOAuthLoginEvent extends AuthEvent {

  const OnOAuthLoginEvent();

  @override
  List<Object?> get props => <Object?>[];

}
