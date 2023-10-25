import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/bottom_navbar.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/screens/split_bill/home/home.dart';

class NewAppBar extends StatelessWidget {
  const NewAppBar({
    required this.isNotification,
    required this.title,
    required this.leadingIcon,
    Key? key,
  }) : super(key: key);

  final bool isNotification;
  final String title;
  final int leadingIcon; // 1 -> menu, 2 -> back

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: darkModeColors().primary,
      ),
      child: Row(children: [
        leadingIcon == 1
            ? Padding(
                padding: const EdgeInsets.only(left: 24),
                child: IconButton(
                  onPressed: () {
                    BottomNavBar.scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 32,
                  ),
                  color: darkModeColors().textColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 28),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => BottomNavBar()));
                  },
                  icon: const Icon(FontAwesomeIcons.arrowLeft),
                  color: darkModeColors().textColor,
                ),
              ),
        const SizedBox(
          width: 12,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: darkModeColors().textColor,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              fontSize: 26.0,
            ),
          ),
        ),
        const Spacer(),
        isNotification
            ? Padding(
                padding: const EdgeInsets.only(right: 26),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                      FontAwesomeIcons.solidBell),
                  color: darkModeColors().textColor,
                ),
              )
            : const SizedBox.shrink(),
      ]),
    );
  }
}
