import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_4/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:tugas_4/provider/favorite_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoriteBloc(),
      child: const MyApp(),
    ),
  );
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
