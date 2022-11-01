import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myskin/bloc/auth/handle_api/registrasi_bloc.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_myskin/ui/widget/custom_pop_loading.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_application_myskin/ui/widget/primary_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegistrasiBloc _registerBloc = RegistrasiBloc();

  bool _isVisiblePassword = false;
  bool _isVisibleConfirmationPassword = false;

  bool isChecked = false;
  final tanggalLahirController = TextEditingController(text: '');
  final genderController = TextEditingController(text: '');
  final emailCohtroller = TextEditingController(text: '');
  final alamatCohtroller = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final namaPasienController = TextEditingController(text: '');

  final passwordConfirmationController = TextEditingController(text: '');
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

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
        value: "Pilih Jenis Kelamin",
        enabled: false,
        child: Text(
          "Pilih Jenis Kelamin",
        ),
      ),
      DropdownMenuItem(value: "Laki - Laki", child: Text("Laki - Laki")),
      DropdownMenuItem(value: "Perempuan", child: Text("Perempuan")),
    ];
    return menuItems;
  }

  String selectedValue = "Pilih Jenis Kelamin";

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      if (!isChecked) {
        return Colors.black;
      } else {
        return const Color(0xffEE7814);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Registrasi',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<RegistrasiBloc, RegistrasiState>(
        bloc: _registerBloc,
        listener: (context, state) {
          print('state is: $state');
          if (state is RegistrasiLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const PopLoading();
              },
            );
          } else if (state is RegistrasiSuccess) {
            Navigator.pop(context);
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                content: Container(
                  height: 85,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle_outlined,
                        color: Colors.green,
                        size: 40,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Daftar Berhasil',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login-page', (route) => false);
            });
          }
        },
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            children: [
              Image.asset(
                'assets/images/icon_registrasi.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 40,
              ),
              PrimaryTextField(
                controller: namaPasienController,
                icon: Icons.person,
                text: 'Nama Lengkap',
              ),
              const SizedBox(
                height: 40,
              ),
              PrimaryTextField(
                controller: emailCohtroller,
                icon: Icons.email,
                text: 'Email',
              ),
              const SizedBox(
                height: 40,
              ),
              PrimaryTextField(
                controller: alamatCohtroller,
                icon: Icons.house,
                text: 'Alamat',
              ),
              const SizedBox(
                height: 40,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.female,
                        size: 20,
                        color: Color(0xffC0ADAD),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 300,
                        child: DropdownButton(
                          focusColor: Colors.transparent,
                          isExpanded: true,
                          disabledHint: const Text("Can't select"),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                          ),
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: dropdownItems,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () => _modalDatePicker(context),
                child: Container(
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
                    enabled: false,
                    controller: tanggalLahirController,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffB8B8B8)),
                      hintText: "Tanggal Lahir",
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                          onPressed: () => _modalDatePicker(context),
                          icon: const Icon(
                            Icons.calendar_month,
                            size: 20,
                            color: Color(0xffC0ADAD),
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
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
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: (password) => onPasswordChanged(password),
                  controller: passwordController,
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
                height: 15,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 15,
                        height: 15,
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
                            size: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "8 karakter",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 15,
                        height: 15,
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
                            size: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "1 angka",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
                  controller: passwordConfirmationController,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  obscureText: !_isVisibleConfirmationPassword,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffB8B8B8)),
                    hintText: 'Konfirmasi Kata Sandi',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: _isVisibleConfirmationPassword
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
                          _isVisibleConfirmationPassword =
                              !_isVisibleConfirmationPassword;
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
                height: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Menyetujui kebijakan dan persyaratan yang\nberlaku',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        height: 80,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: !isChecked ? Colors.grey : const Color(0xffEE7814),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              if (!isChecked) {
              } else {
                print(
                  "${emailCohtroller.text},${namaPasienController.text},${selectedValue},${alamatCohtroller.text},${tanggalLahirController.text}",
                );
                _registerBloc.add(RegisterPost(
                    email: emailCohtroller.text,
                    name: namaPasienController.text,
                    password: passwordController.text,
                    gender: selectedValue,
                    alamat: alamatCohtroller.text,
                    passwordConfirmation: passwordConfirmationController.text,
                    tanggalLahir: tanggalLahirController.text));
              }
            },
            child: Center(
              child: Text(
                'Daftar',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _modalDatePicker(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      context: context,
      builder: (builder) {
        DateTime now = DateTime.now();
        DateTime maxdate = DateTime(now.year - 15, now.month, now.day - 5);

        return Wrap(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Pilih Tanggal',
                        style: GoogleFonts.poppins(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.close)))
                  ],
                )),
            SizedBox(
              height: 200,
              child: DefaultTextStyle.merge(
                style: GoogleFonts.poppins(),
                child: CupertinoDatePicker(
                    maximumDate: maxdate,
                    initialDateTime: maxdate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (val) {
                      setState(() {
                        tanggalLahirController.text =
                            DateFormat("y-MM-d").format(val);
                      });
                    }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: PrimaryButton(
                text: 'Pilih Tanggal',
                onPressed: () {
                  if (tanggalLahirController.text == '') {
                    setState(() {
                      tanggalLahirController.text =
                          DateFormat("y-MM-d").format(DateTime.now());
                    });
                  }

                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
