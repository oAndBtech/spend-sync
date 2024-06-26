import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';
import 'package:spend_sync/services/user_model.dart';
import 'package:spend_sync/widget/friends/grid_view.dart';

class FriendsTab extends StatefulWidget {
  const FriendsTab({super.key});

  @override
  State<FriendsTab> createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  // final count = 45; 
 //TODO:change this according to user
  List<UserModel> dummydata = List.generate(20, (index) => UserModel(name: "Apple Don", email: "email", pic: "pic"));

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
                          fontSize: fontSizes().requestsFriendsTab,
                          color: darkModeColors().textButton,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.2),
                    )),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Center(
              child: GridViewWidget(
                listOfData: dummydata,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
