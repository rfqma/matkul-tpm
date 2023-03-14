import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int hasil = 0;

  TextEditingController angka1 = new TextEditingController();
  TextEditingController angka2 = new TextEditingController();

  kurang() {
    setState(() {
      hasil = int.parse(angka1.text) - int.parse(angka2.text);
    });
  }

  tambah() {
    setState(() {
      hasil = int.parse(angka1.text) + int.parse(angka2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Tugas TPM - Tambah/Kurang"),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new TextField(
              controller: angka1,
              keyboardType: TextInputType.number,
              decoration:
                  new InputDecoration(labelText: "Masukkan Angka Pertama"),
            ),
          ),
          new Container(
            padding: new EdgeInsets.all(5.0),
            child: new TextField(
              controller: angka2,
              keyboardType: TextInputType.number,
              decoration:
                  new InputDecoration(labelText: "Masukkan Angka Kedua"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.green)),
                  onPressed: () {
                    tambah();
                  },
                  child: new Text("Tambah",
                      style: new TextStyle(color: Colors.white)),
                ),
              ),
              new Container(
                padding: new EdgeInsets.all(5.0),
                child: new TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.green)),
                  onPressed: () {
                    kurang();
                  },
                  child: new Text("Kurang",
                      style: new TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          new Padding(
            padding: new EdgeInsets.all(10.0),
          ),
          new Center(
            child: new Text(
              "Hasil: " + hasil.toString(),
              style: new TextStyle(fontSize: 30.0),
            ),
          )
        ],
      ),
    );
  }
}
