import 'package:flutter/material.dart';
import 'package:tugas_akhir/utilities/constants.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  TextEditingController? controller;
  String? saveValue;
  final String? Function(String? val) validate;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  bool isObsecure;

  CustomTextField({
    Key? key,
    this.controller,
    this.saveValue,
    required this.validate,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObsecure = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      onChanged: (value) {
        setState(() {
          widget.saveValue = value;
        });
      },
      obscureText: widget.isObsecure,
      validator: widget.validate,
      cursorColor: customBlue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        hintText: widget.hintText,
        errorStyle: const TextStyle(
          color: kCustomRed,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        fillColor: Colors.white,
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(
                    widget.isObsecure
                        ? widget.suffixIcon
                        : Icons.visibility_off, //FontAwesomeIcons.eyeSlash,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isObsecure = !widget.isObsecure;
                    });
                  },
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
