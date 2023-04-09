import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorit",
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
                  onTap: () async {
                    final Uri url = Uri.parse('https://pexels.com');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
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
                                  child: Image.network(
                                      // "assets/images/pexels.jpeg",
                                      "https://cdn-au.onetrust.com/logos/3dbea99f-abc0-4dbd-bcd7-8f6dfcaea28d/08d31c24-1bed-4774-903b-b1725205a842/bb79b0fe-48e3-427c-bbac-47fc621af04c/3IX0JssK_400x400.jpeg"),
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
                                  "Pexels",
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
                                  "pexels.com/",
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
                            SizedBox(
                              width: 100,
                            ),
                            Icon(
                              Icons.bookmark_added,
                              size: 30,
                              color: Colors.white,
                            )
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
