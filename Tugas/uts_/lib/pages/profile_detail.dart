import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({super.key});

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Profile",
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ClipOval(
                  child: Image.asset("assets/images/me.jpg"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Rifqi Maulana",
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "123200128",
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Teknologi dan Pemrograman Mobile IF-C",
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Semarang, 25 September 2002",
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Harapan saya untuk bekerja di bidang yang saya suka",
              style: GoogleFonts.getFont(
                'Montserrat',
                textStyle: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
