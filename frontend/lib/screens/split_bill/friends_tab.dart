import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/friends/grid_view.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({super.key});

  final count = 45; //TODO:change this according to user

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(FontAwesomeIcons.userPlus, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 3,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                //   child: Text(
                //     'Total friends: $count',
                //     style: GoogleFonts.inter(
                //           fontSize: 16,
                //           color: darkModeColors().textButton.withOpacity(0.7),
                //           fontWeight: FontWeight.w500,
                //           letterSpacing: -0.2),
                //   ),
                // ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Requests',
                      style: GoogleFonts.inter(
                          fontSize: 18,
                          color: darkModeColors().textButton,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.2),
                    )),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            const GridViewWidget(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
