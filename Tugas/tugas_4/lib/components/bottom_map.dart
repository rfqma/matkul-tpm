import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_4/pages/help.dart';
import 'package:tugas_4/pages/home.dart';
import 'package:tugas_4/pages/login.dart';

class BottomMap extends StatefulWidget {
  const BottomMap({super.key});

  @override
  State<BottomMap> createState() => _BottomMapState();
}

class _BottomMapState extends State<BottomMap> {
  int index = 0;
  List list = [
    HomePage(),
    Help(),
  ];

  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 4 Teknologi dan Pemrograman Mobile IF-C',
      home: Scaffold(
        body: list[index],
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = HomePage();
                          index = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: index == 0 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Home",
                            style: GoogleFonts.getFont(
                              "Montserrat",
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  color:
                                      index == 0 ? Colors.blue : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Help();
                          index = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.help,
                            color: index == 1 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Bantuan",
                            style: GoogleFonts.getFont(
                              "Montserrat",
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  color:
                                      index == 1 ? Colors.blue : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage(username: '');
                        }));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: index == 2 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Logout",
                            style: GoogleFonts.getFont(
                              "Montserrat",
                              textStyle:
                                  TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
