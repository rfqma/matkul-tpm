import 'package:flutter/material.dart';

class Tabung extends StatefulWidget {
  const Tabung({super.key});

  @override
  State<Tabung> createState() => _TabungState();
}

class _TabungState extends State<Tabung> {
  double hasilLuasTabung = 0;
  double hasilKelilingTabung = 0;
  double pi = 3.14;

  TextEditingController jari_jari = TextEditingController();
  TextEditingController tinggi = TextEditingController();

  luasTabung() {
    setState(() {
      hasilLuasTabung = ((2 * pi) * double.parse(jari_jari.text)) *
          (double.parse(jari_jari.text) + double.parse(tinggi.text));
    });
  }

  kelilingTabung() {
    setState(() {
      hasilKelilingTabung = 2 * (pi * double.parse(jari_jari.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("💊 Menu Tabung"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "💊 Hitung Luas Tabung ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: jari_jari,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Jari-Jari",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: tinggi,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Tinggi",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                luasTabung();
              },
              child: Text(
                "Hitung",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Luas = " + hasilLuasTabung.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "💊 Hitung Keliling Tabung ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                controller: jari_jari,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Input Jari-Jari",
                  labelStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                kelilingTabung();
              },
              child: Text(
                "Hitung",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Keliling = " + hasilKelilingTabung.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
