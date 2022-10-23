import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/main.dart';
import 'package:flutter_application_myskin/shared/helper/token_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () async {
      final TokenHelper _tokenHelper = TokenHelper();
      String token = await _tokenHelper.getToken();

      if (initScreen == 0) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/get-started', (route) => false);
      } else {
        if (token.isEmpty) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login-page', (route) => false);
        } else if (token.isNotEmpty) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo_myskins.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
