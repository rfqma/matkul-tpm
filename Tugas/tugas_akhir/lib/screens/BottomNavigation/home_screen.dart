// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tugas_akhir/models/userModels/user_model.dart';
import 'package:tugas_akhir/screens/Home/CatLists/cat_screen.dart';
import 'package:tugas_akhir/screens/Home/currency_screen.dart';
import 'package:tugas_akhir/screens/Home/time_screen.dart';
import 'package:tugas_akhir/screens/Home/user_screen.dart';
import 'package:tugas_akhir/screens/Login/login_screen.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/app/base_screen.dart';
import 'package:tugas_akhir/widgets/app/custom_card.dart';
import 'package:tugas_akhir/widgets/app/custom_circular_progress.dart';
import 'package:tugas_akhir/widgets/app/custom_container.dart';

class HomeScreen extends StatelessWidget {
  User user;
  HomeScreen({Key? key, required this.user}) : super(key: key);

  User loginUser =
      User(fullName: "", email: "", password: "", age: 19, gender: "male");

  @override
  Widget build(BuildContext context) {
    //print('user.fullName: ${user.fullName}');
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ThemeColor.darkBackground,
      appBar: AppBar(
        title: Text(
          "👋🏼 Hi, ${user.fullName}",
          style: GoogleFonts.getFont(
            'Montserrat',
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: size.height * 0.2,
            top: size.height * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CatScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.pets),
                      Text(
                        "Cat Lists",
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CurrencyScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.currency_exchange),
                      Text(
                        "Currency Converter",
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return TimeScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.timer),
                      Text(
                        "Time Converter",
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return UserScreen(
                        user: loginUser,
                      );
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.supervised_user_circle_rounded),
                      Text(
                        "User List",
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // ElevatedButton(
                //   style:
                //       ElevatedButton.styleFrom(backgroundColor: Colors.black),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) {
                //           return LoginPage(
                //             username: '',
                //           );
                //         },
                //       ),
                //     );
                //   },
                //   child: Text(
                //     "Logout",
                //     style: GoogleFonts.getFont(
                //       'Montserrat',
                //       textStyle: TextStyle(
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
