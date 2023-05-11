import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:tugas_4/provider/favorite_provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    var favoriteBloc = Provider.of<FavoriteBloc>(context);

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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: favoriteBloc.favorite.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteBloc.favorite[index].title.toString()),
                  subtitle: Text(favoriteBloc.favorite[index].url.toString()),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        favoriteBloc.favorite[index].image.toString()),
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
