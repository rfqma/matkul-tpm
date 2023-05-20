// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/screens/Login/login_screen.dart';
import 'package:tugas_akhir/utilities/validation.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/app/custom_button.dart';
import 'package:tugas_akhir/widgets/app/custom_container.dart';
import 'package:tugas_akhir/widgets/app/custom_textfield.dart';
import 'package:tugas_akhir/widgets/app/custom_snackbar.dart';
import 'package:hive_flutter/adapters.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String _fullName = '', _email = '', _password = '';
  bool isObscurePassword = true;
  late User _currentUser;

  // List of items in our dropdown menu
  final items = ['Female', 'Male'];
  String currentChoice = 'Female';

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_setText);
    _emailController.addListener(_setText);
    _passwordController.addListener(_setText);
  }

  void _setText() {
    setState(() {
      _fullName = _fullNameController.text;
      _email = _emailController.text;
      _password = _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Spacer(),
            CustomTextField(
              controller: _fullNameController,
              saveValue: _fullName,
              validate: validatefullName,
              prefixIcon: Icons.person,
              hintText: 'Full Name',
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            CustomTextField(
              controller: _emailController,
              saveValue: _email,
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
              saveValue: _password,
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
                const Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.black54,
                  ),
                ),
                CustomContainer(
                  height: size.height * 0.07,
                  width: size.width * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                      value: currentChoice,
                      items: items
                          .map<DropdownMenuItem<String>>(
                              (String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Center(child: Text(item)),
                                  ))
                          .toList(),
                      onChanged: (String? value) =>
                          setState(() => currentChoice = value!),

                      icon: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.arrow_circle_down_sharp,
                            color: Colors.black,
                          )),
                      iconEnabledColor: kWhite, //Icon color
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      dropdownColor: Colors.white, //dropdown background color
                      underline: Container(), //remove underline
                      isExpanded: true, //make true to make width 100%
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            CustomButton(
              buttonName: 'Sign Up',
              padding: 35.0,
              onPress: () {
                final form = _formKey.currentState;
                if (form!.validate()) {
                  form.save();
                  signUpButton();
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void signUpButton() {
    //print('Email: $_email and Password $_password and gender $currentChoice');
    add(
        fullName: _fullName,
        email: _email,
        password: _password,
        gender: currentChoice);
  }

  add(
      {required String fullName,
      required String email,
      required String password,
      required String gender}) async {
    try {
      var usersBox = await Hive.openBox('users');
      User user = User(
          fullName: fullName.toLowerCase(),
          email: email.toLowerCase(),
          password: password,
          age: 19,
          gender: gender.toLowerCase());

      var userExist = usersBox.values
          .where((user) => (user.email.toLowerCase().contains(email)))
          .toList();

      if (userExist.isEmpty) {
        await usersBox.add(user);
        _currentUser = user;
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      } else {
        return CustomSnackBar(
          context,
          Text('User "$email" already exists.'),
          backgroundColor: kCustomRed,
        );
      }
    } catch (error) {
      return CustomSnackBar(
        context,
        Text('something wrong! \n $error'),
        backgroundColor: kCustomRed,
      );
    }
  }
}
