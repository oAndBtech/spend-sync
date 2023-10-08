import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  icon: const Icon(
                    FontAwesomeIcons.gear,
                    color: Color(0xffEEEEEE),
                  )),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'About',
                  buttonType: 4,
                  icon: const Icon(
                    FontAwesomeIcons.circleQuestion,
                    color: Color(0xffEEEEEE),
                  )),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Share',
                  buttonType: 3,
                  icon: const Icon(
                    FontAwesomeIcons.share,
                    color: Color(0xffEEEEEE),
                  )),
              const SizedBox(
                height: 28.0,
              ),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Contact Us',
                  buttonType: 2,
                  icon: const Icon(
                    Icons.contact_support,
                    color: Color(0xffEEEEEE),
                  )),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Feedback',
                  buttonType: 4,
                  icon: const Icon(
                    Icons.rate_review_rounded,
                    color: Color(0xffEEEEEE),
                  )),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Report a bug',
                  buttonType: 4,
                  icon: const Icon(
                    FontAwesomeIcons.bug,
                    color: Color(0xffEEEEEE),
                  )),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Rate our app',
                  buttonType: 3,
                  icon: const Icon(
                    FontAwesomeIcons.thumbsUp,
                    color: Color(0xffEEEEEE),
                  )),
              const SizedBox(
                height: 28.0,
              ),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Logout',
                  buttonType: 1,
                  icon: const Icon(
                    FontAwesomeIcons.rightFromBracket,
                    color: Color(0xffEEEEEE),
                  )),
                  const SizedBox(
                height: 28.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
