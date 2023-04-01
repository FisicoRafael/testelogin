import 'package:flutter/material.dart';
import 'package:testelogin/router/app_routes.dart';

import 'injection_depency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initInjectionDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Teste Login',
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
