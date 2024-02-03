part of 'login_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginInitial extends LoginCubitState {}

class LoginLoading extends LoginCubitState {}

class LoginSuccess extends LoginCubitState {}

class LoginFailure extends LoginCubitState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});

}
