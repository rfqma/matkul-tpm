import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:tugas_akhir/utilities/constants.dart';

class BaseScreen extends StatelessWidget {
  final Widget bodyContainer;
  const BaseScreen({Key? key, required this.bodyContainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            generateBluredImage(),
            bodyContainer,
          ],
        ),
      ),
    );
  }

  Widget generateBluredImage() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 56, 56, 56),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            //color: Colors.white.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
