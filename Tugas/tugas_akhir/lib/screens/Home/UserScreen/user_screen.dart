// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tugas_akhir/models/userModels/user_model.dart';
import 'package:tugas_akhir/screens/LoginScreen/login_screen.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/appWidgets/base_screen.dart';
import 'package:tugas_akhir/widgets/appWidgets/custom_card.dart';
import 'package:tugas_akhir/widgets/appWidgets/custom_circular_progress.dart';
import 'package:tugas_akhir/widgets/appWidgets/custom_container.dart';

class UserScreen extends StatelessWidget {
  User user;
  UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('user.fullName: ${user.fullName}');
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ThemeColor.darkBackground,
      appBar: AppBar(
        title: Text(
          "User Lists",
          style: GoogleFonts.getFont(
            'Montserrat',
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: getUsersData(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: listViewBuilder(),
                    ),
                  );
                } else {
                  return const CustomCircularProgress();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Box> getUsersData() {
    return Hive.openBox('users');
  }

  Widget listViewBuilder() {
    final Box userBox = Hive.box('users');
    return ValueListenableBuilder(
      valueListenable: userBox.listenable(),
      builder: (BuildContext context, Box box, _) {
        if (box.values.isEmpty) {
          return const Center(
            child: CustomContainer(
              width: 250,
              height: 100,
              child: Center(
                child: Text(
                  'No Users Found!',
                  style: kTitleStyle,
                ),
              ),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: userBox.length,
                  itemBuilder: (context, index) {
                    final User user = box.getAt(index);
                    return CustomCard(user: user, index: index);
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
