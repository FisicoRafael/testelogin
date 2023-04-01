import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testelogin/bloc/auth/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthBloc authBloc;
  final TextEditingController _cpfController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is AuthStateLoading){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Governo'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.30,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Digite o CPF"),
              TextFormField(
                controller: _cpfController,
                decoration: InputDecoration(
                  hintText: "CPF",
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(28)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(28)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Pegou");
                    authBloc
                        .add(AuthEventLogin(cpf: _cpfController.text.trim()));
                  },
                  child: Text("Logar"))
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
