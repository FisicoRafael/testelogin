import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository/user/auth.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthEventLogin>((event, emit) async {
      emit(AuthStateLoading(message: "Realizando o Login"));
      final resp = await authRepository.login(cpf: event.cpf);
      resp.fold((l) => emit(AuthStateLoaginErro(message: l.message)), (r) {
        emit(AuthStateLoginSucess());
      });
    });
  }
}
