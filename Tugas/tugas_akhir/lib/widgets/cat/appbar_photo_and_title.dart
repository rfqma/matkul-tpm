import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/screens/Home/CatLists/gallery_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:tugas_akhir/data/api.dart';
import 'package:tugas_akhir/models/catModels/cat_model.dart';

import 'package:tugas_akhir/utilities/constants.dart';

class AppbarPhotoAndTitle extends StatelessWidget {
  final Cat cat;
  const AppbarPhotoAndTitle({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      //*photo start
      Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: SizedBox(
            width: 100.h,
            height: 40.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.h),
              ),
              child: FutureBuilder(
                future: ApiService().getImageUrlByBreedId(cat.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String url = snapshot.data as String;
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ); // image is ready
                  } else {
                    return const SizedBox(
                      height: 250,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ); // placeholder
                  }
                },
              ),
            )),
      ),
      //*photo end
      //*title start
      Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).orientation == Orientation.landscape
                ? 85.h
                : 85.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.h),
                  topLeft: Radius.circular(5.h)),
              color: ThemeColor.darkGrey,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      cat.name,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "Origin: ${cat.origin}",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return GalleryScreen(cat: cat);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo_library_sharp,
                          color: ThemeColor.white,
                          size: 30.0,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Cat Gallery",
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
      //*title end
    ]);
  }
}
