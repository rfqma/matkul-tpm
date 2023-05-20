import 'package:flutter/material.dart';
import 'package:tugas_akhir/widgets/app/custom_container.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomContainer(
            width: size.width * 0.1,
            height: size.width * 0.1,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.lightBlueAccent.withOpacity(0.7)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
