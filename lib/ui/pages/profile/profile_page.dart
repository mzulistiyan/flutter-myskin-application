import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/auth/handle_api/logout_bloc.dart';
import 'package:flutter_application_myskin/bloc/auth/handle_api/pasien_bloc.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_myskin/ui/pages/profile/edit_profile_page.dart';
import 'package:flutter_application_myskin/ui/widget/custom_shimmer_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LogoutBloc _logoutBloc = LogoutBloc();
  final PasienBloc _pasienBloc = PasienBloc();

  @override
  void initState() {
    _pasienBloc.add(GetPasien());
    super.initState();
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear().then((value) {
      if (value) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }), (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFAFAFA),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocConsumer<PasienBloc, PasienState>(
        bloc: _pasienBloc,
        listener: (context, state) {
          print('state is $state');
          if (state is PasienError) {}
        },
        builder: (context, state) {
          if (state is PasienLoading) {
            return Center(
              child: shimmerProfilePage(context),
            );
          } else if (state is PasienSuccess) {
            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/icon_profile_default.png',
                          width: 55,
                          height: 55,
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hallo, ${state.responseGetPasien.data!.namaPasien}',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              state.responseGetPasien.data!.email!,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return _showDialogLogout();
                          },
                        );
                      },
                      child: Image.asset(
                        'assets/icons/icon_exit.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Akun',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffB8B8B8)),
                ),
                const SizedBox(
                  height: 14,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UbahProfilePage(
                        pasien: state.responseGetPasien,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ubah Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, '/ganti-kata-sandi-page'),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ganti Kata Sandi',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bantuan',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Bantuan',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffB8B8B8)),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Term of Service',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rate App',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Privacy & Policy',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            );
          } else if (state is PasienError) {
            return Text(
              'Pasien',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _showDialogLogout() {
    Widget cancelButton = TextButton(
      child: const Text("Tidak"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Ya"),
      onPressed: () async {
        _logoutBloc.add(GetLogout());
        await Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context, rootNavigator: true).pop();
          _logout();
        });
      },
    );
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text("Keluar"),
      content: Text(
        "Anda yakin ingin keluar?",
        style: GoogleFonts.poppins(),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
