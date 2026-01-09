import 'package:e_commerce_app2/features/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/ui/register/register_screen.dart';

void main() {
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes : {
        LoginScreen.routeName : (context)=> LoginScreen(),
        RegisterScreen.routeName : (context)=>RegisterScreen(),
      }
    );
  }
}


