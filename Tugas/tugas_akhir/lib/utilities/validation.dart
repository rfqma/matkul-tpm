import 'package:regexpattern/regexpattern.dart';

String? validateEmail(String? value) {
  // String pattern =
  //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  // RegExp regex = new RegExp(pattern);
  // if (!value!.isEmail() && value.isNotEmpty && !regex.hasMatch(value)) {
  //   return 'لطفا ایمیل معتبر وارد کنید';
  // }
  if (value!.isEmpty) {
    return "Email is Required";
  } else if (!value.isEmail()) {
    return 'Please Enter a valid email';
  }
}

String? validatefullName(String? fullName) {
  //fullName = fullName!.split(" ").join("");
  fullName = fullName!.toLowerCase().replaceAll(' ', '');
  if (fullName.isEmpty) {
    return 'Fullname is required';
  } else if (fullName.trim().length <= 3) {
    return 'at least 4 characters';
  }
  return null;
}

String? validatePassword(String? value) {
  String pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{6,}$';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Password is required";
  } else if (!regex.hasMatch(value)) {
    return 'include: Alphabet, Number & 6 chars';
  } else {
    return null;
  }
}

String? validateage(String? value) {
  //The age must be a number between 1 and 130.
  //between -1 and 1 int.parse(age)
  int age = int.parse(value!);
  if (value.isEmpty) {
    return "age is required";
  } else if (age <= 5 || age >= 100) {
    return 'between 5 and 100';
  }
}
