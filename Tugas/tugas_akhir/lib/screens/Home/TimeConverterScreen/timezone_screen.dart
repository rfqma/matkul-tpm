import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir/utilities/constants.dart';

class TimezoneScreen extends StatefulWidget {
  @override
  _TimezoneScreenState createState() => _TimezoneScreenState();
}

class _TimezoneScreenState extends State<TimezoneScreen> {
  DateTime _selectedDate = DateTime.now();
  String _zone = 'WIB';
  Timer? _timer;
  String? _timeString;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(Duration(milliseconds: 100), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now =
        DateTime.now().toUtc().add(Duration(hours: _getHourOffset()));
    if (this.mounted) {
      setState(() {
        _timeString = DateFormat('HH:mm:ss').format(now);
      });
    }
  }

  int _getHourOffset() {
    if (_zone == "WIB") {
      return 7;
    } else if (_zone == "WITA") {
      return 8;
    } else if (_zone == "WIT") {
      return 9;
    } else if (_zone == "GMT+1") {
      return 1;
    } else {
      return 0;
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Widget build(BuildContext context) {
    String __timeString = _timeString ?? "Null";

    return Scaffold(
      backgroundColor: ThemeColor.darkBackground,
      appBar: AppBar(
        title: Text(
          "Clock",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              DateFormat.yMMMMEEEEd().format(_selectedDate),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Calendar',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  primary: Colors.white),
            ),
            SizedBox(height: 60),
            Text(
              __timeString,
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text('WIB'),
                  onPressed: () {
                    setState(() {
                      _zone = 'WIB';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // warna latar belakang button
                    onPrimary: Colors.white, // warna teks pada button
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  child: Text('WITA'),
                  onPressed: () {
                    setState(() {
                      _zone = 'WITA';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // warna latar belakang button
                    onPrimary: Colors.white, // warna teks pada button
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  child: Text('WIT'),
                  onPressed: () {
                    setState(() {
                      _zone = 'WIT';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // warna latar belakang button
                    onPrimary: Colors.white, // warna teks pada button
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  child: Text('GMT+1'),
                  onPressed: () {
                    setState(() {
                      _zone = 'GMT+1';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black, // warna latar belakang button
                    onPrimary: Colors.white, // warna teks pada button
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
