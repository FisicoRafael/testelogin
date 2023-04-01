import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testelogin/bloc/auth/auth_bloc.dart';
import 'package:testelogin/screens/auth/login.dart';

import '../injection_depency.dart';

abstract class AppRoutes {
  static const login = '/login';

  static Route<dynamic> routes(RouteSettings settings) {
    Widget screen;
    switch (settings.name) {
      case login:
        screen = BlocProvider(
            create: (_) => dependency<AuthBloc>(), child: const LoginScreen());
        break;

      default:
        screen = BlocProvider(
            create: (_) => dependency<AuthBloc>(), child: const LoginScreen());
    }

    return MaterialPageRoute(builder: (_) => screen, settings: settings);
  }
}
