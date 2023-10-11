import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xff393E46),
      appBar: AppBar(
        backgroundColor: const Color(0xff131921),
        title: Text(
          title,
          style: const TextStyle(color: Color(0xffEEEEEE)),
        ),
        leading: leadingIcon == 1
            ? IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: const Color(0xffEEEEEE),
              )
            : IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.arrowLeft),
                color: const Color(0xffEEEEEE),
              ),
        actions: <Widget>[
          isNotification
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.bell), // icon should be changed
                  color: const Color(0xffEEEEEE),
                )
              : IconButton(              // try to remove this
                  onPressed: () {},
                  icon: const Icon(Icons.adb_outlined),
                  color: const Color(0xff131921),
                ),
        ],
      ),
    );
  }
}
