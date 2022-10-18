import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DokterPage extends StatelessWidget {
  const DokterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INI DokterPage'),
      ),
      body: Center(
        child: Text('ini DokterPage'),
      ),
    );
  }
}
