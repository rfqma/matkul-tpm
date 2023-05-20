import 'dart:ui';

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final double borderRadius;

  const CustomContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.child,
      this.borderRadius = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          child: child,
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 50,
              colors: [
                // Colors.white.withOpacity(0.20),
                // Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.3),
              ],
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.transparent,
                //color: kDarkBlue.withOpacity(0.6),
                blurRadius: 3.0,
                offset: Offset(6.0, 6.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
