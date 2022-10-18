import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/onboarding_page.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/register_page.dart';
import 'package:flutter_application_myskin/ui/pages/splash_screen_page.dart';
import 'package:flutter_application_myskin/ui/widget/bottom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/get-started': (context) => const OnboardingPage(),
        '/login-page': (context) => const LoginPage(),
        '/register-page': (context) => const RegisterPage(),
      },
    );
  }
}
