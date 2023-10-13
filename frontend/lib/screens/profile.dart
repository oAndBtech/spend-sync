import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/profile/app_bar.dart';
import 'package:spend_sync/widget/profile/profile_button.dart';
import 'package:spend_sync/widget/profile/user_details.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String image =
        "https://e1.pxfuel.com/desktop-wallpaper/810/988/desktop-wallpaper-dani-daniels-by-kimo006-danny-daniel.jpg";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const NewAppBar(isNotification: true, title: 'Profile', leadingIcon: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 55.0,
                    ),
                    UserDetails(
                        imageLink: image,
                        usersName: 'Dani Daniels',
                        usersMailId: 'danidaniels.business@gmail.com',
                        upiId: 'danidaniels69@ybl'),
                    const SizedBox(
                      height: 22.0,
                    ),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'Settings',
                        buttonType: 2,
                        icon:  Icon(
                          FontAwesomeIcons.gear,
                          color: darkModeColors().textColor,
                        )),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'About',
                        buttonType: 4,
                        icon:  Icon(
                          FontAwesomeIcons.circleQuestion,
                          color: darkModeColors().textColor,
                        )),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'Share',
                        buttonType: 3,
                        icon: Icon(
                          FontAwesomeIcons.share,
                          color: darkModeColors().textColor,
                        )),
                    const SizedBox(
                      height: 28.0,
                    ),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'Contact Us',
                        buttonType: 2,
                        icon: Icon(
                          Icons.contact_support,
                          color: darkModeColors().textColor,
                        )),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'Feedback',
                        buttonType: 4,
                        icon: Icon(
                          Icons.rate_review_rounded,
                          color: darkModeColors().textColor,
                        )),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'Report a bug',
                        buttonType: 4,
                        icon: Icon(
                          FontAwesomeIcons.bug,
                          color: darkModeColors().textColor,
                        )),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'Rate our app',
                        buttonType: 3,
                        icon: Icon(
                          FontAwesomeIcons.thumbsUp,
                          color: darkModeColors().textColor,
                        )),
                    const SizedBox(
                      height: 28.0,
                    ),
                    ProfileButton(
                        onTap: () {},
                        buttonText: 'Logout',
                        buttonType: 1,
                        icon: Icon(
                          FontAwesomeIcons.rightFromBracket,
                          color: darkModeColors().textColor,
                        )),
                        const SizedBox(
                      height: 28.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
