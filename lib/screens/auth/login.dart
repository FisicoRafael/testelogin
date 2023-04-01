import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
              ElevatedButton(onPressed: () {}, child: Text("Logar"))
            ],
          ),
        ),
      ),
    );
  }
}
