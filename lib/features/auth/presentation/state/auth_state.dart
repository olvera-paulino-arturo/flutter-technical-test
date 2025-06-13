part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

final class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

final class AuthNotStorageState extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

final class AuthStorageState extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

final class AuthNotProvideState extends AuthState {
  @override
  List<Object> get props => <Object>[];
}


final class AuthSuccessState extends AuthState {
  @override
  List<Object> get props => <Object>[];
}

