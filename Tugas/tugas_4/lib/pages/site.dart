import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_4/models/items_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:tugas_4/provider/favorite_provider.dart';
import 'package:tugas_4/pages/favorite.dart';

class Site extends StatefulWidget {
  const Site({super.key});

  @override
  State<Site> createState() => _SiteState();
}

class _SiteState extends State<Site> {
  List itemsList = [
    {
      "title": "Reddit",
      "url": "https://reddit.com/",
      "image": "assets/images/reddit.png",
      "status": "false",
    },
    {
      "title": "Netflix",
      "url": "https://netflix.com",
      "image": "assets/images/netflix.jpeg",
      "status": "false",
    },
    {
      "title": "DeviantArt",
      "url": "https://deviantart.com/",
      "image": "assets/images/deviantart.jpg",
      "status": "false",
    },
    {
      "title": "Pexels",
      "url": "https://pexels.com/",
      "image": "assets/images/pexels.jpeg",
      "status": "false",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var favoriteBloc = Provider.of<FavoriteBloc>(context); //pass provider

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
        actions: [
          Row(
            children: [
              Text(
                favoriteBloc.count.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favorite(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    final Uri urlDestination =
                        Uri.parse(itemsList[index]['url']);
                    if (!await launchUrl(urlDestination)) {
                      throw Exception('Could not launch $urlDestination');
                    }
                  },
                  title: Text(itemsList[index]['title']),
                  subtitle: Text(itemsList[index]['url']),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(itemsList[index]['image']),
                  ),
                  trailing: itemsList[index]["status"] == "false"
                      ? IconButton(
                          icon: Icon(Icons.star_border_outlined),
                          onPressed: () {
                            favoriteBloc.incrementCount();

                            ItemModel itemsModel = new ItemModel(
                              title: itemsList[index]['title'],
                              url: itemsList[index]['url'],
                              image: itemsList[index]['image'],
                            );

                            favoriteBloc.addItems(
                                itemsModel); // add item count in bookmark provider
                            //print(bookmarkBloc.wishlist[index].title);
                            setState(() {
                              itemsList[index]["status"] = "true";
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                          ),
                          onPressed: () {
                            favoriteBloc.decrementCount();

                            ItemModel itemsModel = new ItemModel(
                              title: itemsList[index]['title'],
                              url: itemsList[index]['url'],
                              image: itemsList[index]['image'],
                            );

                            favoriteBloc.removeItems(
                                itemsModel); // add item count in bookmark provider
                            //print(bookmarkBloc.wishlist[index].title);
                            setState(() {
                              itemsList[index]["status"] = "false";
                            });
                          },
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
