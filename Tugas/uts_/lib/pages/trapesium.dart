import 'package:flutter/material.dart';

class Trapesium extends StatefulWidget {
  const Trapesium({super.key});

  @override
  State<Trapesium> createState() => _TrapesiumState();
}

class _TrapesiumState extends State<Trapesium> {
  double hasilLuasTrapesium = 0;
  double hasilKelilingTrapesium = 0;
  double pi = 3.14;

  TextEditingController alas_a = TextEditingController();
  TextEditingController alas_b = TextEditingController();
  TextEditingController tinggi = TextEditingController();

  TextEditingController sisi_a = TextEditingController();
  TextEditingController sisi_b = TextEditingController();
  TextEditingController sisi_c = TextEditingController();
  TextEditingController sisi_d = TextEditingController();

  luasTrapesium() {
    setState(() {
      hasilLuasTrapesium = 1 /
          2 *
          ((double.parse(alas_a.text) + double.parse(alas_b.text)) *
              double.parse(tinggi.text));
    });
  }

  kelilingTrapesium() {
    setState(() {
      hasilKelilingTrapesium = (double.parse(sisi_a.text) +
          double.parse(sisi_b.text) +
          double.parse(sisi_c.text) +
          double.parse(sisi_d.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("🪤 Menu Trapesium"),
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
                  "🪤 Hitung Luas Trapesium ",
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
                    controller: alas_a,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Alas a",
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
                    controller: alas_b,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Alas b",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ],
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
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                luasTrapesium();
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
              "Luas = " + hasilLuasTrapesium.toString(),
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
                  "🪤 Hitung Keliling Trapesium ",
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
                    controller: sisi_a,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi a",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: sisi_b,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi b",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: sisi_c,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi c",
                      labelStyle: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    controller: sisi_d,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Input Sisi d",
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
                kelilingTrapesium();
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
              "Keliling = " + hasilKelilingTrapesium.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
