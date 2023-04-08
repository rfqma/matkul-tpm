import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_4/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 4 Teknologi dan Pemrograman Mobile IF-C',
      home: LoginPage(
        username: '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
