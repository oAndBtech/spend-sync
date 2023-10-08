import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetails extends StatelessWidget {
  final String imageLink;
  final String usersName;
  final String usersMailId;
  final String upiId;
  const UserDetails({super.key,required this.imageLink,required this.usersName,required this.usersMailId,required this.upiId});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 135/2,
          backgroundImage: NetworkImage(imageLink),
        ),
        const SizedBox(height: 16.0,),
        Text(
          usersName,
          style: GoogleFonts.inter(
            fontSize: 36.0,
            letterSpacing: -0.2,
            color: const Color(0xffEEEEEE),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          usersMailId,
          style: GoogleFonts.inter(
            fontSize: 16.0,
            letterSpacing: -0.2,
            color: const Color(0xffEEEEEE).withOpacity(0.6),
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24.0,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UPI ID : $upiId',
              style: GoogleFonts.inter(
                fontSize: 16.0,
                letterSpacing: -0.2,
                color: const Color(0xffEEEEEE).withOpacity(0.6),
                fontWeight: FontWeight.w400,
              ),
            ),
            // const SizedBox(width: 7.0,),
             Padding(
               padding: const EdgeInsets.fromLTRB(7, 0, 5, 3),
               child: FaIcon(FontAwesomeIcons.solidCopy ,size: 15, color: const Color(0xffEEEEEE).withOpacity(0.6),),
             )
          ],
        ),
      ],
    );
  }
}