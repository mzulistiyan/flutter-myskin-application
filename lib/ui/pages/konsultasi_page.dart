import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RekamMedisPage extends StatelessWidget {
  const RekamMedisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rekam Medis'),
      ),
      body: Center(
        child: Text('Rekam Medis'),
      ),
    );
  }
}
