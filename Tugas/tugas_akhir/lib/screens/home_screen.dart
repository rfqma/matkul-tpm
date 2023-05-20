// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/screens/login_screen.dart';
import 'package:tugas_akhir/constants.dart';
import 'package:tugas_akhir/widgets/base_screen.dart';
import 'package:tugas_akhir/widgets/custom_card.dart';
import 'package:tugas_akhir/widgets/custom_circular_progress.dart';
import 'package:tugas_akhir/widgets/custom_container.dart';

class HomeScreen extends StatelessWidget {
  User user;
  HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('user.fullName: ${user.fullName}');
    Size size = MediaQuery.of(context).size;

    return BaseScreen(
      bodyContainer: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              color: kDarkBlue.withOpacity(0.9),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'WELCOME ',
                      style: kTextStyle.copyWith(color: backgroundblue),
                      children: <TextSpan>[
                        TextSpan(
                          text: user.fullName,
                          style: kTitleStyle,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      user = User(
                          fullName: "",
                          email: "",
                          password: "",
                          age: 19,
                          gender: "male");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
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
