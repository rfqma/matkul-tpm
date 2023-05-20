// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/screens/BottomNavigation/home_screen.dart';
import 'package:tugas_akhir/utilities/validation.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/app/custom_button.dart';
import 'package:tugas_akhir/widgets/app/custom_textfield.dart';
import 'package:tugas_akhir/widgets/app/custom_snackbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  late String _email = '', _password = '';
  bool isObscurePassword = true;

  User loginUser =
      User(fullName: "", email: "", password: "", age: 19, gender: "male");

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_setText);
    _passwordController.addListener(_setText);
  }

  void _setText() {
    setState(() {
      _email = _emailController.text;
      _password = _passwordController.text;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Stack(children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(),
              Icon(
                Icons.login,
                size: 60,
                color: kDarkBlue.withOpacity(1),
              ),
              const Spacer(),
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
                height: size.height * 0.04,
              ),
              CustomButton(
                buttonName: 'Login',
                onPress: () {
                  final form = _formKey.currentState;
                  if (form!.validate()) {
                    form.save();
                    signInButton();
                  }
                },
                padding: size.width * 0.1,
              ),
              const Spacer(),
            ],
          ),
        ),
      ]),
    );
  }

  void signInButton() {
    // print('Email: $_email and Password $_password');
    login(email: _email, password: _password);
  }

  login({
    required String email,
    required String password,
  }) async {
    try {
      var usersBox = await Hive.openBox('users');

      var users = usersBox.values
          .where((user) => (user.email.toLowerCase().contains(email) &&
              user.password.contains(password)))
          .toList();

      for (var user in users) {
        loginUser = User(
          fullName: user.fullName,
          email: user.email,
          password: user.password,
          age: user.age,
          gender: user.gender,
        );
      }

      if (users.isNotEmpty) {
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen(
                user: loginUser,
              );
            },
          ),
        );
      } else {
        return CustomSnackBar(
          context,
          const Text('User not found!'),
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
