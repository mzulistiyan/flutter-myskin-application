import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myskin/bloc/auth/handle_api/logout_bloc.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LogoutBloc _logoutBloc = LogoutBloc();

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
        title: Text('INI ProfilePage'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              _logoutBloc.add(GetLogout());
              await Future.delayed(const Duration(seconds: 1), () {
                _logout();
              });
            },
            child: Text('LOGOUT')),
      ),
    );
  }
}
