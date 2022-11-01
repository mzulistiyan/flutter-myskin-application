import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:google_fonts/google_fonts.dart';

class GantiPasswordPage extends StatefulWidget {
  const GantiPasswordPage({super.key});

  @override
  State<GantiPasswordPage> createState() => _GantiPasswordPageState();
}

class _GantiPasswordPageState extends State<GantiPasswordPage> {
  bool _isVisibleOldPassword = false;
  bool _isVisiblePassword = false;
  bool _isVisiblePasswordConfirmation = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordOneUpperLowerCase = false;
  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final lowerCaseReges = RegExp(r'^(?=.*[a-z])');
    final upperCaseReges = RegExp(r'^(?=.*[A-Z])');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;

      _hasPasswordOneUpperLowerCase = false;
      if (lowerCaseReges.hasMatch(password) &&
          upperCaseReges.hasMatch(password))
        _hasPasswordOneUpperLowerCase = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Ubah Kata Sandi',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        children: [
          Image.asset(
            'assets/icons/icon_profile_default.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Kata Sandi Lama',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB8B8B8),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 35,
            child: TextFormField(
              obscureText: !_isVisibleOldPassword,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: IconButton(
                    icon: _isVisibleOldPassword
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
                        _isVisibleOldPassword = !_isVisibleOldPassword;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Kata Sandi Baru',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB8B8B8),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 35,
            child: TextFormField(
              onChanged: (password) => onPasswordChanged(password),
              obscureText: !_isVisiblePassword,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: IconButton(
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
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Ulangi Kata Sandi Baru',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB8B8B8),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 35,
            child: TextFormField(
              obscureText: !_isVisiblePasswordConfirmation,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: IconButton(
                    icon: _isVisiblePasswordConfirmation
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
                        _isVisiblePasswordConfirmation =
                            !_isVisiblePasswordConfirmation;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _isPasswordEightCharacters
                        ? Colors.green
                        : Colors.transparent,
                    border: _isPasswordEightCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Kata sandi minimal terdapat 8 karakter")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _hasPasswordOneNumber
                        ? Colors.green
                        : Colors.transparent,
                    border: _hasPasswordOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text("Kata sandi minimal terdapat 1 angka")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: _hasPasswordOneUpperLowerCase
                        ? Colors.green
                        : Colors.transparent,
                    border: _hasPasswordOneUpperLowerCase
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                  "Kata sandi minimal terdapat 1 huruf besar\ndan 1 huruf kecil")
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 60,
        child: PrimaryButton(
          text: 'Ganti Kata Sandi',
          onPressed: () {},
        ),
      ),
    );
  }
}
