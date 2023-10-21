import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:fluttertoast/fluttertoast.dart'; // Import the FlutterToast library

class UserDetails extends StatelessWidget {
  final String imageLink;
  final String usersName;
  final String usersMailId;
  final String upiId;
  const UserDetails(
      {Key? key,
      required this.imageLink,
      required this.usersName,
      required this.usersMailId,
      required this.upiId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 135 / 2,
          backgroundImage: NetworkImage(imageLink),
        ),
        const SizedBox(
          height: 3.0,
        ),
        Text(
          usersName,
          style: GoogleFonts.inter(
            fontSize: 32.0,
            letterSpacing: -0.2,
            color: darkModeColors().textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          usersMailId,
          style: GoogleFonts.inter(
            fontSize: 15.0,
            letterSpacing: -0.2,
            color: darkModeColors().textColor.withOpacity(0.6),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UPI ID : $upiId',
              style: GoogleFonts.inter(
                fontSize: 15.0,
                letterSpacing: -0.2,
                color: darkModeColors().textColor.withOpacity(0.6),
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                Clipboard.setData(ClipboardData(text: upiId));
                Fluttertoast.showToast(
                  msg: 'UPI ID Copied',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(7, 0, 5, 3),
                child: FaIcon(
                  FontAwesomeIcons.solidCopy,
                  size: 15,
                  color: darkModeColors().textColor.withOpacity(0.6),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
