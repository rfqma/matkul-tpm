import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Site extends StatefulWidget {
  const Site({super.key});

  @override
  State<Site> createState() => _SiteState();
}

class _SiteState extends State<Site> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Situs Rekomendasi",
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
                    final Uri url = Uri.parse('https://netflix.com');
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
                                      "https://cdn.vox-cdn.com/thumbor/sW5h16et1R3au8ZLVjkcAbcXNi8=/0x0:3151x2048/2000x1333/filters:focal(1575x1024:1576x1025)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png"),
                                  // "assets/images/netflix.png"
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
                                  "Netflix",
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
                                  "netflix.com/",
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
                              Icons.bookmark_add,
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
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse('https://reddit.com');
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
                                      // "assets/images/reddit.png",
                                      "https://www.redditinc.com/assets/images/site/reddit-logo.png"),
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
                                  "Reddit",
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
                                  "reddit.com/",
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
                              Icons.bookmark_add,
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
            Card(
              margin: EdgeInsets.all(20),
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse('https://deviantart.com');
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
                                      // "assets/images/deviantart.jpg",
                                      "https://play-lh.googleusercontent.com/IUcqE41VIxbZexis7tPuWMuGD_4mQCPx4cuO5z1ZrgzeMqRu1-uU720TtznqPWS69Jk"),
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
                                  "DevianArt",
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
                                  "deviantart.com/",
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
                              width: 60,
                            ),
                            Icon(
                              Icons.bookmark_add,
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
                              Icons.bookmark_add,
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
