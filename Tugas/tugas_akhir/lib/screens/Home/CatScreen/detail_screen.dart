import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/catWidgets/appbar_photo_and_title.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/models/catModels/cat_model.dart';
import 'package:tugas_akhir/widgets/catWidgets/categories.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final Cat cat;

  const DetailsScreen({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.darkBackground,
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppbarPhotoAndTitle(cat: cat),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "*Characteristics from 0 to 5. 0 is bad, 5 is excellent",
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Categories(cat: cat),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 100.w,
                              child: Text(
                                "Description:",
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cat.description,
                              style: GoogleFonts.getFont(
                                'Montserrat',
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            cat.wikiUrl != null
                                ? GestureDetector(
                                    onTap: () async {
                                      var url = Uri.parse("${cat.wikiUrl}");

                                      await launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).orientation ==
                                                  Orientation.landscape
                                              ? 100.h
                                              : 60.w,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            const Text(
                                              "Check on Wikipedia",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                //decoration: TextDecoration.underline,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
