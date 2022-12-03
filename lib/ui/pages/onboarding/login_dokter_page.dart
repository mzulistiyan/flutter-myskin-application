import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/dokter/event/login_dokter_event.dart';
import 'package:flutter_application_myskin/bloc/dokter/handle_api/login_dokter_bloc.dart';
import 'package:flutter_application_myskin/bloc/dokter/state/login_dokter_state.dart';
import 'package:flutter_application_myskin/model/auth/dokter/response_login_dokter.dart';
import 'package:flutter_application_myskin/shared/helper/token_helper.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../bloc/pasien/state/login_state.dart';

class LoginDokterPage extends StatefulWidget {
  const LoginDokterPage({super.key});

  @override
  State<LoginDokterPage> createState() => _LoginDokterPageState();
}

class _LoginDokterPageState extends State<LoginDokterPage> {
  final emailController = TextEditingController(text: 'dokter1@gmail.com');
  final passwordController = TextEditingController(text: '12345678');
  final LoginDokterBloc _loginBloc = LoginDokterBloc();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Masuk Dokter ',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'MySkin',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: const Color(0xffEE7814),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
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
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/lupa-password-page'),
              child: Text(
                'Lupa Kata Sandi?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<LoginDokterBloc, LoginDokterState>(
              bloc: _loginBloc,
              listener: (context, state) {
                print('state is: $state');
                if (state is LoginDokterSuccess) {
                  _tokenHelper.saveRole(1);
                  _tokenHelper
                      .saveToken(state.responseDokterLogin.data!.accessToken!);
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home-dokter-page', (route) => false);
                  });
                }

                if (state is LoginDokterError) {
                  Fluttertoast.showToast(
                      msg:
                          responseLoginDokterToJson(state.responseDokterLogin));
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
              height: 16,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Masuk sebagai ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Pasien',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: const Color(0xffEE7814),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
