import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/ui/pages/artikel_page.dart';
import 'package:flutter_application_myskin/ui/pages/dokter/dokter_page.dart';
import 'package:flutter_application_myskin/ui/pages/konsultasi_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pages/home_page.dart';
import '../pages/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedNavBar = 0;

  final List<Widget> _pageList = [
    const HomePage(),
    const KonsultasiPage(),
    const ArikelPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: _pageList[_selectedNavBar],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18.0),
              topRight: Radius.circular(18.0),
              bottomLeft: Radius.circular(18.0),
              bottomRight: Radius.circular(18.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_home.png',
                      width: 24,
                      height: 24,
                      color: _selectedNavBar == 0
                          ? const Color(0xffEE7814)
                          : const Color(0xff999999)),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_survey.png',
                      width: 24,
                      height: 24,
                      color: _selectedNavBar == 1
                          ? const Color(0xffEE7814)
                          : const Color(0xff999999)),
                  label: 'Hasil Survey',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_artikel.png',
                      width: 24,
                      height: 24,
                      color: _selectedNavBar == 2
                          ? const Color(0xffEE7814)
                          : const Color(0xff999999)),
                  label: 'Artikel',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_profile_nav.png',
                      width: 24,
                      height: 24,
                      color: _selectedNavBar == 3
                          ? const Color(0xffEE7814)
                          : const Color(0xff999999)),
                  label: 'Profile',
                ),
              ],
              selectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffEE7814)),
              currentIndex: _selectedNavBar.toInt(),
              selectedItemColor: Color(0xffEE7814),
              unselectedLabelStyle: const TextStyle(color: Colors.blue),
              unselectedItemColor: Colors.black,
              onTap: (int? v) {
                setState(() {
                  _selectedNavBar = v!;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
