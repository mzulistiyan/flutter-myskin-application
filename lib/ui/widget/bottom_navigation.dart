import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/ui/pages/dokter_page.dart';
import 'package:flutter_application_myskin/ui/pages/konsultasi_page.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedNavBar = 0;
  final List<BottomNavigationBarItem> _itemList = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Beranda',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.assignment), label: 'Pesanan'),
    const BottomNavigationBarItem(
      icon: Icon(Icons.mail),
      label: 'Inbox',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Akun',
    ),
  ];

  final List<Widget> _pageList = [
    const HomePage(),
    const KonsultasiPage(),
    const DokterPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Example'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[300],
        alignment: Alignment.center,
        child: _pageList[_selectedNavBar],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.blue,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: const TextStyle(color: Colors.yellow))), //
        child: BottomNavigationBar(
          items: _itemList,
          currentIndex: _selectedNavBar,
          selectedItemColor: Colors.black,
          unselectedLabelStyle: const TextStyle(color: Colors.blue),
          unselectedItemColor: Colors.white,
          onTap: (int? v) {
            setState(() {
              _selectedNavBar = v!;
            });
          },
        ),
      ),
    );
  }
}
