part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthEventLogin extends AuthEvent {
  final String cpf;

  AuthEventLogin({required this.cpf});
}
