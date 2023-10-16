import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

class SpendDrawer extends StatefulWidget {
  const SpendDrawer(
      {required this.profilePic,
      required this.emailID,
      required this.userName,
      super.key});

  final String profilePic;
  final String userName;
  final String emailID;

  @override
  State<SpendDrawer> createState() => _SpendDrawerState();
}

class _SpendDrawerState extends State<SpendDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkModeColors().secondary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(widget.profilePic),
                ),
              ),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  widget.userName,
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.2,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              accountEmail: Text(
                widget.emailID,
                style: GoogleFonts.inter(
                  color: darkModeColors().textColor.withOpacity(0.4),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.2,
                ),
              ),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.transparent),
                color: darkModeColors().primary,
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.history,
                color: darkModeColors().textColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Expense History',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.list,
                color: darkModeColors().textColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Deep Analysis',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.gear,
                color: darkModeColors().textColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Settings',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.userPlus,
                color: darkModeColors().textColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Add friend',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.share,
                color: darkModeColors().textColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Invite your friend',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.infoCircle,
                color: darkModeColors().textColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'About us',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.thumbsUp,
                color: darkModeColors().textColor,
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'Rate us',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: darkModeColors().textColor,
                  ),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
