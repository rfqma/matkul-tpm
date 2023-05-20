// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/utilities/validation.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/app/custom_button.dart';
import 'package:tugas_akhir/widgets/app/custom_textfield.dart';
import 'package:tugas_akhir/widgets/app/custom_snackbar.dart';

class CustomModal extends StatefulWidget {
  User user;
  final int index;
  CustomModal({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  State<CustomModal> createState() => _CustomModalState();
}

class _CustomModalState extends State<CustomModal> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _fullNameController.text = widget.user.fullName;
    _emailController.text = widget.user.email;
    _passwordController.text = widget.user.password;
    _ageController.text = widget.user.age.toString();
    _genderController.text = widget.user.gender;
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          //color: Colors.purpleAccent.shade100.withOpacity(0.4),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 50,
              colors: [
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.3),
              ],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                //color: Colors.transparent,
                //color: Colors.blue.shade500.withOpacity(0.5),
                color: kDarkBlue.withOpacity(0.6),
                blurRadius: 5.0,
                offset: const Offset(7.0, 7.0),
              ),
            ],
          ),
          //color: Colors.transparent,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 15,
              left: 15,
              right: 15),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ListTile(
                  title: Center(
                      child: Text(
                    'Edit',
                    style: kTextStyle,
                  )),
                ),
                CustomTextField(
                  controller: _fullNameController,
                  saveValue: null,
                  validate: validatefullName,
                  prefixIcon: Icons.person,
                  hintText: 'FullName',
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                CustomTextField(
                  controller: _emailController,
                  saveValue: null,
                  validate: validateEmail,
                  prefixIcon: Icons.email,
                  hintText: 'Email',
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                CustomTextField(
                  controller: _passwordController,
                  isObsecure: true,
                  saveValue: null,
                  validate: validatePassword,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                  hintText: 'Password',
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Age',
                          style: kSubTitleStyle.copyWith(color: kDarkGrey),
                        ),
                        SizedBox(
                          width: size.height * 0.02,
                        ),
                        SizedBox(
                          //width: 50,
                          width: size.width * 0.35,
                          child: CustomTextField(
                            controller: _ageController,
                            isObsecure: false,
                            saveValue: null,
                            validate: validateage,
                            //prefixIcon: Icons.lock,
                            hintText: 'age',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Gender',
                          style: kSubTitleStyle.copyWith(color: kDarkGrey),
                        ),
                        SizedBox(
                          width: size.height * 0.02,
                        ),
                        Container(
                          width: size.width * 0.17,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            _genderController.text,
                            style: kSubTitleStyle,
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    buttonName: 'Update',
                    padding: 35.0,
                    onPress: () async {
                      final form = _formKey.currentState;
                      if (form!.validate()) {
                        form.save();
                        editButton();
                        Navigator.pop(context);
                      }
                    }),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editButton() {
    updateUser(
      fullName: _fullNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      age: _ageController.text,
      gender: _genderController.text,
    );
  }

  updateUser({
    required String fullName,
    required String email,
    required String password,
    required String age,
    required String gender,
  }) async {
    try {
      var box = await Hive.openBox('users');
      User userUpdate = User(
        fullName: fullName.toLowerCase(),
        email: email.toLowerCase(),
        password: password,
        age: int.parse(age),
        gender: gender.toLowerCase(),
      );

      var userExist = box.values
          .where((user) => (user.email.toLowerCase().contains(email)))
          .toList();

      if (userExist.isEmpty) {
        await box.putAt(widget.index, userUpdate);
        return CustomSnackBar(
          context,
          Text('user ${widget.index} updated'),
          backgroundColor: Colors.green,
        );
      } else {
        if (widget.user.email == email) {
          await box.putAt(widget.index, userUpdate);
          return CustomSnackBar(
            context,
            Text('user ${widget.index} updated'),
            backgroundColor: Colors.green,
          );
        } else {
          return CustomSnackBar(
            context,
            const Text('this user already exist!'),
            backgroundColor: Colors.red,
          );
        }
      }
    } catch (error) {
      return CustomSnackBar(
        context,
        Text('something wrong! \n $error'),
        backgroundColor: Colors.red,
      );
    }
  }
}
