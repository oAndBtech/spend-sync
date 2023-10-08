import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({
    required this.onTap,
    required this.buttonText,
    required this.buttonType,
    required this.icon,
    this.isArrow = true,
    Key? key,
  }) : super(key: key);

  bool isArrow;
  final VoidCallback onTap;
  final String buttonText;
  final Icon icon;
  final int
      buttonType; // 1 -> all rounded, 2 -> top rounded, 3 -> bottom rounded, 4 -> corners

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      borderRadius: BorderRadius.circular(36),
      child: Container(
        height: 61,
        width: width * 0.85,
        decoration: BoxDecoration(
            color: const Color(0xff222831).withOpacity(0.6),
            borderRadius: buttonType == 1
                ? BorderRadius.circular(36)
                : buttonType == 2
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36))
                    : buttonType == 3
                        ? const BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36))
                        : BorderRadius.circular(0)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
    
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: icon,
            ),
            const SizedBox(width: 12),
            Text(
              buttonText,
              style: GoogleFonts.inter(
                  color: const Color(0xffEEEEEE),
                  fontSize: 18.0,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            isArrow
                ? const Padding(
                  padding:  EdgeInsets.only(right: 24),
                  child:  Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Color(0xffEEEEEE),
                      size: 16,
                    ),
                )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
