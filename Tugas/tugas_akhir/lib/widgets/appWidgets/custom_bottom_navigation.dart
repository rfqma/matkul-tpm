import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/models/userModels/user_model.dart';
import 'package:tugas_akhir/screens/BottomNavigation/feedback_screen.dart';
import 'package:tugas_akhir/screens/BottomNavigation/home_screen.dart';
import 'package:tugas_akhir/screens/BottomNavigation/profile_screen.dart';
import 'package:tugas_akhir/screens/LoginScreen/login_screen.dart';

class BottomMap extends StatefulWidget {
  final User user;
  BottomMap({super.key, required this.user});

  @override
  State<BottomMap> createState() => _BottomMapState();
}

class _BottomMapState extends State<BottomMap> {
  static User loginUser =
      User(fullName: "", email: "", password: "", age: 19, gender: "male");

  int index = 0;
  List list = [
    HomeScreen(user: loginUser),
    ProfileScreen(),
    FeedbackScreen(),
  ];

  Widget currentScreen = HomeScreen(user: loginUser);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Akhir Teknologi dan Pemrograman Mobile IF-C',
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
                          currentScreen = HomeScreen(user: loginUser);
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
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = ProfileScreen();
                          index = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: index == 1 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Profile",
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
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = FeedbackScreen();
                          index = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.feed,
                            color: index == 2 ? Colors.blue : Colors.white,
                          ),
                          Text(
                            "Feedback",
                            style: GoogleFonts.getFont(
                              "Montserrat",
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  color:
                                      index == 2 ? Colors.blue : Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: index == 3 ? Colors.blue : Colors.white,
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
