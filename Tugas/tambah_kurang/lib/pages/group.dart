import 'package:flutter/material.dart';
import 'package:coba_kalkulator/pages/home.dart';

class Group extends StatelessWidget {
  const Group({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anggota Kelompok"),
      ),
      body: const Center(
        child: Text(
          "1. Muhammad Raehan Parikesit\n"
          "  (123200149)\n"
          "2. Rifqi Maulana\n"
          "  (123200128)\n"
          "3. Hugo Vale Poetratama\n"
          "  (123200116)\n",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return Home();
            }),
          );
        },
        child: const Icon(Icons.arrow_right_alt, color: Colors.black),
      ),
    );
  }
}
