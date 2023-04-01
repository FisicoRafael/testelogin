import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:testelogin/constantes/env.dart';

import '../../repository/user/auth.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  Dio dio = Dio();

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthEventLogin>((event, emit) async {
      print("Chamou");
      emit(AuthStateLoading(message: "Realizando o Login"));
      String path =
          "$SERVIDOR_API_URL/authorize?response_type=code&client_id=${event.cpf}&scope=openid+email+profile+govbr_confiabilidades&redirect_uri=&nonce=&state=&code_challenge=J0AV2KiMhCpby5FB0l6F1BdutmCAMGbn7M1LKy0DI60&code_challenge_method=S256";
      dio.get(path).then((value) async {
        return emit(AuthStateLoginSucess());
      }).onError((error, stackTrace) {
        print("Error: $error");
        return emit(AuthStateLoaginErro(message: error.toString()));
      });
      //

      // final resp = await authRepository.login(cpf: event.cpf);
      // resp.fold((l) => emit(AuthStateLoaginErro(message: l.message)), (r) {
      //   emit(AuthStateLoginSucess());
      // });
    });
  }
}
