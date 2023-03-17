import 'package:flutter/material.dart';
import 'package:quiz_tpm/pages/layang.dart';
import 'package:quiz_tpm/pages/segitiga.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz TPM"),
        backgroundColor: Colors.purple.shade500,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.purple.shade200,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ClipOval(
                  child: Image.asset("assets/images/me2.jpg"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rifqi Maulana",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "123200128",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Teknologi dan Pemrograman Mobile IF-C",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Layang()));
                  },
                  child: Text("Hitung Layang-Layang"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade900,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Segitiga()));
                  },
                  child: Text("Hitung Segitiga"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade900,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
