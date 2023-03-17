import 'package:flutter/material.dart';

class Layang extends StatefulWidget {
  const Layang({super.key});

  @override
  State<Layang> createState() => _LayangState();
}

class _LayangState extends State<Layang> {
  double hasilLuasLayang = 0;
  double hasilKelilingLayang = 0;

  TextEditingController diagonal_satu = TextEditingController();
  TextEditingController diagonal_dua = TextEditingController();
  TextEditingController sisi_atas = TextEditingController();
  TextEditingController sisi_bawah = TextEditingController();

  luasLayang() {
    setState(() {
      hasilLuasLayang = ((1 / 2) *
          double.parse(diagonal_satu.text) *
          double.parse(diagonal_dua.text));
    });
  }

  kelilingLayang() {
    setState(() {
      hasilKelilingLayang =
          2 * (double.parse(sisi_atas.text) + double.parse(sisi_bawah.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Quiz TPM - Menu Layang-layang"),
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
                  "🪁 Hitung Luas Layang-layang ",
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
                    controller: diagonal_satu,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Diagonal 1",
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
                    controller: diagonal_dua,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Diagonal 2",
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
                luasLayang();
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
              "Luas = " + hasilLuasLayang.toString(),
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
                  "🪁 Hitung Keliling Layang-layang ",
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
                    controller: sisi_atas,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi Atas",
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
                    controller: sisi_bawah,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi Bawah",
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
                kelilingLayang();
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
              "Keliling = " + hasilKelilingLayang.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
