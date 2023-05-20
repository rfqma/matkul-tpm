import 'package:flutter/material.dart';
import 'package:tugas_akhir/utilities/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPress;
  final double padding;

  const CustomButton(
      {Key? key,
      required this.buttonName,
      required this.onPress,
      this.padding = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: padding,
        ),
        decoration: BoxDecoration(
          color: kBlack,
          // border: Border.all(
          //   color: Colors.white,
          //   width: 2,
          // ),
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Text(
          buttonName,
          style: kSubTitleStyle.copyWith(color: kWhite),
        ),
      ),
    );
  }
}
