import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/auth/event/login_event.dart';
import 'package:flutter_application_myskin/bloc/auth/handle_api/login_bloc.dart';
import 'package:flutter_application_myskin/model/auth/response_login.dart';
import 'package:flutter_application_myskin/shared/helper/token_helper.dart';
import 'package:flutter_application_myskin/ui/widget/bottom_navigation.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/auth/state/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final LoginBloc _loginBloc = LoginBloc();
  final TokenHelper _tokenHelper = TokenHelper();

  bool _isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo_myskins.png')),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icon_WA.png',
                        width: 15,
                        height: 18,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icon_google.png',
                        width: 15,
                        height: 25,
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/icon_facebook.png',
                        width: 10,
                        height: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'Login with',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'or',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xffDFC3C3).withOpacity(0.2),
                border: Border.all(
                  color: const Color(0xffEE7814),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: emailController,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffB8B8B8)),
                  hintText: 'Email',
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 20,
                    color: Color(0xffC0ADAD),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xffDFC3C3).withOpacity(0.2),
                border: Border.all(
                  color: const Color(0xffEE7814),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: passwordController,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                obscureText: !_isVisiblePassword,
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffB8B8B8)),
                  hintText: 'Kata Sandi',
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: _isVisiblePassword
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        _isVisiblePassword = !_isVisiblePassword;
                      });
                    },
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20,
                    color: Color(0xffC0ADAD),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Forgot password?',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<LoginBloc, LoginState>(
              bloc: _loginBloc,
              listener: (context, state) {
                print('state is: $state');
                if (state is LoginSuccess) {
                  print(responseLoginToJson(state.responseLogin));
                  _tokenHelper
                      .saveToken(state.responseLogin.data!.accessToken!);
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main-page', (route) => false);
                  });
                }

                if (state is LoginError) {
                  Fluttertoast.showToast(
                      msg: responseLoginToJson(state.responseLogin));
                }
              },
              builder: (context, state) {
                return Builder(
                  builder: (context) {
                    if (state is LoginLoading) {
                      return Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xffEE7814),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 1),
                              blurRadius: 5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: const Center(
                            child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                    color: Colors.white))),
                      );
                    } else {
                      return PrimaryButton(
                        text: 'Masuk',
                        onPressed: () {
                          if (emailController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            Fluttertoast.showToast(msg: 'Texfield is required');
                          } else {
                            _loginBloc.add(LoginPost(
                                email: emailController.text,
                                password: passwordController.text));
                          }
                        },
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have account? ',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/register-page'),
                  child: Text(
                    'Sign Up here',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
