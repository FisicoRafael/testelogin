part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthStateLoginSucess extends AuthState {}

class AuthStateLoaginErro extends AuthState {
  final String message;

  AuthStateLoaginErro({required this.message});
}

class AuthStateLoading extends AuthState {
  final String message;

  AuthStateLoading({required this.message});
}
