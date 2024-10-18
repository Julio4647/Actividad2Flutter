import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practica1v2/firebase_options.dart';
import 'package:practica1v2/modules/auth/screens/change_code.dart';
import 'package:practica1v2/modules/auth/screens/create_account.dart';
import 'package:practica1v2/modules/auth/screens/login.dart';
import 'package:practica1v2/modules/auth/screens/recover_password.dart';
import 'package:practica1v2/modules/auth/screens/verification_code.dart';
import 'package:practica1v2/navigation/home.dart';
import 'package:practica1v2/navigation/navigation.dart';
import 'package:practica1v2/navigation/profile.dart';
import 'package:practica1v2/widgets/splash_screen.dart';

void main() {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/register': (context) => CreateAccount(),
        '/menu': (context) => Navigation(),
        '/home': (context) => Scaffold(
              backgroundColor: Colors.pink,
              body: const Home(),
            ),
        '/profile': (context) => Profile(),
        '/recover_password': (context) => RecoverPassword(),
        '/verification_code': (context) => VerificationCode(),
        '/change_code': (context) => ChangeCode(),
      },
    );
  }
}
