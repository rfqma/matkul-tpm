import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tugas_akhir/screens/Home/TimeConverterScreen/timezone_location_screen.dart';
import 'package:tugas_akhir/utilities/constants.dart';

class TimezoneScreen extends StatefulWidget {
  const TimezoneScreen({super.key});

  @override
  State<TimezoneScreen> createState() => _TimezoneScreenState();
}

class _TimezoneScreenState extends State<TimezoneScreen> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    // if (data != null && data.isNotEmpty) {
    //   data = data;
    // } else {
    //   ModalRoute.of(context)?.settings.arguments as Map;
    // }

    //set background
    // String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    String? bgImage;
    if (data != null && data['isDayTime'] != null) {
      bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    } else {
      // Handle the null case or provide a default value
      bgImage = 'background2.jpg';
    }

    // Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    Color? bgColor;
    if (data != null && data['isDayTime'] != null) {
      bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;
    } else {
      // Handle the null case or provide a default value
      bgColor = ThemeColor.darkBackground;
    }

    var location = data != null ? data['location'] : 'Unknown location';
    var time = data != null ? data['time'] : 'Unknown Time';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timezone Converter",
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
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        // await Navigator.pushNamed(context, '/location');
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TimezoneLocationScreen()));
                    setState(() {
                      if (result != null) {
                        var timeR = result['time'];
                        var locationR = result['location'];
                        var isDayTimeR = result['isDayTime'];
                        var flagR = result['flag'];
                        data = {
                          'time': timeR,
                          'location': locationR,
                          'isDayTime': isDayTimeR,
                          'flag': flagR,
                        };
                      }
                      // data = {
                      //   'time': result['time'],
                      //   'location': result['location'],
                      //   'isDayTime': result['isDayTime'],
                      //   'flag': result['flag'],
                      // };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
