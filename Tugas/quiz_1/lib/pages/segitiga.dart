import 'package:flutter/material.dart';

class Segitiga extends StatefulWidget {
  const Segitiga({super.key});

  @override
  State<Segitiga> createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  double hasilLuasSegitiga = 0;
  double hasilKelilingSegitiga = 0;

  TextEditingController alas = TextEditingController();
  TextEditingController tinggi = TextEditingController();
  TextEditingController sisi_satu = TextEditingController();
  TextEditingController sisi_dua = TextEditingController();
  TextEditingController sisi_tiga = TextEditingController();

  luasSegitiga() {
    setState(() {
      hasilLuasSegitiga =
          (1 / 2 * (double.parse(alas.text) * double.parse(tinggi.text)));
    });
  }

  kelilingSegitiga() {
    setState(() {
      hasilKelilingSegitiga = double.parse(sisi_satu.text) +
          double.parse(sisi_dua.text) +
          double.parse(sisi_tiga.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Quiz TPM - Menu Segitiga"),
        backgroundColor: Colors.purple.shade500,
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
                  "📐 Hitung Segitiga ",
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
                    controller: alas,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Alas",
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
                luasSegitiga();
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
              "Luas = " + hasilLuasSegitiga.toString(),
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
                  "📐 Hitung Keliling Segitiga ",
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
                    controller: sisi_satu,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi 1",
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
                    controller: sisi_dua,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi 2",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: TextField(
                controller: sisi_tiga,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Input Sisi 3",
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
                kelilingSegitiga();
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
              "Keliling = " + hasilKelilingSegitiga.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
