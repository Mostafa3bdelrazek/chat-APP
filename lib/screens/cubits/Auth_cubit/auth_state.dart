part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}

final class RegisterSuccess extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}
