import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/widgets/catWidgets/item_card.dart';

import 'package:tugas_akhir/utilities/constants.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: ThemeColor.darkBackground,
        appBar: AppBar(
          title: Text(
            "Cat Information",
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
        body: const ItemCard());
  }
}
