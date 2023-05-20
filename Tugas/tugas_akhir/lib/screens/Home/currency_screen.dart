import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/currency/currency_card.dart';
import 'package:flutter/material.dart';

class CurrencyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color colorWhite = Color.fromRGBO(239, 255, 251, 1);
    final Color colorBlue = Color.fromRGBO(79, 152, 202, 1);
    final Color colorBlack = Color.fromRGBO(39, 39, 39, 1);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.darkBackground,
        appBar: AppBar(
          title: Text(
            "Currency Converter",
            style: GoogleFonts.getFont(
              'Montserrat',
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                "Check Your Currency Rate",
                style: GoogleFonts.getFont(
                  'Montserrat',
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
              Cards(),
            ],
          ),
        ),
      ),
    );
  }
}
