import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/app_bar.dart';
import 'package:spend_sync/widget/profile/profile_button.dart';
import 'package:spend_sync/widget/profile/user_details.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String image =
        "https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1697914018~exp=1697914618~hmac=b3ec7887b1e0980e9cebfed564addfa7f44e50d0aecfae54c934fdfa2ec8880b";

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
                      height: 30.0,
                    ),
                    UserDetails(
                        imageLink: image,
                        usersName: 'O & B Tech',
                        usersMailId: 'oandb.tech@gmail.com',
                        upiId: 'oandbtech45@ybl'),
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
