import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/auth/handle_api/logout_bloc.dart';
import 'package:flutter_application_myskin/ui/pages/home_page.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/onboarding_page.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/register_page.dart';
import 'package:flutter_application_myskin/ui/pages/splash_screen_page.dart';
import 'package:flutter_application_myskin/ui/pages/tes_kulit/term_and_condition_page.dart';
import 'package:flutter_application_myskin/ui/widget/bottom_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/auth/handle_api/login_bloc.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1); //if already shown -> 1 else 0
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => LogoutBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/main-page': (context) => MainPage(),
          '/get-started': (context) => const OnboardingPage(),
          '/login-page': (context) => const LoginPage(),
          '/register-page': (context) => const RegisterPage(),
          '/home-page': (context) => const HomePage(),
          '/term-condition-page': (context) => const TermAndConditionPage(),
        },
      ),
    );
  }
}
