import 'package:flutter/material.dart';

import 'package:prova0609/pages/login.dart';
import 'package:prova0609/pages/sobre.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Prova',

      home: LoginPage(),
    );
  }
}

