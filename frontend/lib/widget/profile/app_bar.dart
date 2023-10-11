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
    return Container(
      height: 72.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0xff131921),
      ),
      child: Row(children: [
        leadingIcon == 1
            ? Padding(
                padding: const EdgeInsets.only(left: 28),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.bars,
                    size: 26,
                  ),
                  color: const Color(0xffEEEEEE),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 28),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.arrowLeft),
                  color: const Color(0xffEEEEEE),
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
              color: const Color(0xffEEEEEE),
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
                      FontAwesomeIcons.solidBell), // icon should be changed
                  color: const Color(0xffEEEEEE),
                ),
              )
            : const SizedBox.shrink(),
      ]),
    );
  }
}
