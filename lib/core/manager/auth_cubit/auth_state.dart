part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class ShowPasswordState extends AuthState {}

class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {
  final UserModel user;

  SuccessLoginState(this.user);
}

class ErrorLoginState extends AuthState {
  final String error;

  ErrorLoginState(this.error);
}

class LoadingRegisterState extends AuthState {}

class SuccessRegisterState extends AuthState {
  final String message;

  SuccessRegisterState({required this.message});
}

class ErrorRegisterState extends AuthState {
  final String error;

  ErrorRegisterState(this.error);
}
