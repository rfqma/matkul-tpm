// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  final String username;
  const LoginPage({super.key, required this.username});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool hidePassword = true;

  // Toggle to show password
  void passwordToggle() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Hello, \nWelcome Back",
                style: GoogleFonts.getFont(
                  'Montserrat',
                  textStyle: TextStyle(
                      fontSize: size.width * 0.1, fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  //* Username Field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      enabled: true,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelText: "Username (NIM)",
                        labelStyle: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        isDense: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(
                            color: (isLoginSuccess)
                                ? Colors.transparent
                                : Colors.red,
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          size: 24,
                        ),
                      ),
                      onChanged: (value) {
                        username = value;
                      },
                    ),
                  ),
                  //* End of Username Field

                  SizedBox(
                    height: 15,
                  ),

                  //* Password Field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: TextField(
                      enabled: true,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: "Password (nama)",
                          labelStyle: GoogleFonts.getFont(
                            'Montserrat',
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          isDense: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            borderSide: BorderSide(
                              color: (isLoginSuccess)
                                  ? Colors.transparent
                                  : Colors.red,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_rounded,
                            size: 24,
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: passwordToggle,
                              child: Icon(
                                hidePassword
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                                size: 24,
                              ),
                            ),
                          )),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                  //* End of Password Field
                ],
              ),

              //* Login Button
              ElevatedButton(
                onPressed: () {
                  String text = "";
                  if (username == "123200128" && password == "rifqimaulana") {
                    setState(() {
                      text = "🚀 Login Success!";
                      isLoginSuccess = true;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    });
                  } else {
                    setState(() {
                      text = "🤔 Login Failed!";
                      isLoginSuccess = false;
                    });
                  }
                  print("isLoginSuccess: $isLoginSuccess");
                  SnackBar snackBar = SnackBar(
                    content: Text(text),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.all(16),
                  ),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              //* End of Login Button
            ],
          ),
        ),
      ),
    );
  }
}
