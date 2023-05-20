// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:tugas_akhir/utilities/constants.dart';
import 'package:tugas_akhir/widgets/app/custom_modal.dart';
import 'package:tugas_akhir/widgets/app/custom_alert_dialog.dart';

class CustomCard extends StatelessWidget {
  User user;
  int index;
  CustomCard({Key? key, required this.user, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.01),

      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      //color: Colors.white10.withOpacity(0.2),
      color: Colors.white,
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: const Border(
              left: BorderSide(
                color: KCardBlue,
                width: 12,
              ),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.9),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
          child: ListTile(
              horizontalTitleGap: 5,
              contentPadding: EdgeInsets.only(
                left: size.width * 0.04,
              ),
              onTap: () {
                _showForm(context, user, index);
              },
              trailing: IconButton(
                  color: Colors.blueGrey,
                  onPressed: () {
                    removeUser(context, index);
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  )),
              title: Text(
                user.fullName,
                style: GoogleFonts.getFont(
                  'Montserrat',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.email,
                    style: GoogleFonts.getFont(
                      'Montserrat',
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Text(
                  //   user.age.toString(),
                  //   style: GoogleFonts.getFont(
                  //     'Montserrat',
                  //     textStyle: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              leading: Stack(
                children: [
                  Text(
                    index.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4
                        ..color = Colors.blueAccent,
                    ),
                  ),
                  Text(
                    index.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  removeUser(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomeAlertDialog(
            index: index,
          );
        });
  }

  void _showForm(BuildContext context, User user, int index) async {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        //backgroundColor: Colors.blue.withOpacity(0.7),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (_) => CustomModal(user: user, index: index));
  }
}
