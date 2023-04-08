import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kelompok 8",
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
          children: [
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {},
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: ClipOval(
                                  child: Image.asset("assets/images/me.jpg"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rifqi Maulana",
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
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
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {},
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: ClipOval(
                                  child: Image.asset("assets/images/rae.jpg"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "M. Raehan Parikesit",
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "123200149",
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    textStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {},
                  child: Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: ClipOval(
                                  child: Image.asset("assets/images/ale.jpg"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ale Poetratama",
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "123200116",
                                  style: GoogleFonts.getFont(
                                    'Montserrat',
                                    textStyle: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
