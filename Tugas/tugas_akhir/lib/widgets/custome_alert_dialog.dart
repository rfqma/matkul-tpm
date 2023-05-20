// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_akhir/constants.dart';
import 'package:tugas_akhir/widgets/custom_button.dart';

class CustomeAlertDialog extends StatelessWidget {
  int index;
  CustomeAlertDialog({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: backgroundblue,
      title: const Text(
        'Are you sure you want to delete this user?',
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(
            buttonName: 'yes',
            onPress: () {
              Box box = Hive.box('users');
              box.deleteAt(index);
              Navigator.pop(context);
            },
          ),
          CustomButton(
            buttonName: 'No',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
