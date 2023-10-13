import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

class MyFriendProfile extends StatelessWidget {
  MyFriendProfile({
    required this.name,
    required this.onTap,
    required this.profilePic,
  });

  final String name;
  final VoidCallback onTap;
  final String profilePic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(profilePic),
            // backgroundColor: Color(0xff00ADB5),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              color: darkModeColors().textColor,
              fontSize: 16.0,
              letterSpacing: -0.2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
