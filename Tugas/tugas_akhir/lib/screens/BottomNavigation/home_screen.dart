// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tugas_akhir/models/userModels/user_model.dart';
import 'package:tugas_akhir/screens/Home/CatScreen/cat_screen.dart';
import 'package:tugas_akhir/screens/Home/CurrencyConverterScreen/currency_screen.dart';
import 'package:tugas_akhir/screens/Home/TimeConverterScreen/timezone_screen.dart';
import 'package:tugas_akhir/screens/Home/UserScreen/user_screen.dart';
import 'package:tugas_akhir/screens/LoginScreen/login_screen.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/appWidgets/base_screen.dart';
import 'package:tugas_akhir/widgets/appWidgets/custom_card.dart';
import 'package:tugas_akhir/widgets/appWidgets/custom_circular_progress.dart';
import 'package:tugas_akhir/widgets/appWidgets/custom_container.dart';

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
          "Welcome ${user.fullName}",
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
                        "Cats Database",
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
                      return TimezoneScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.access_time_filled),
                      Text(
                        "Clock",
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
