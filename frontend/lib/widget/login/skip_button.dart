import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    required this.buttonText,
    required this.onTap,
    super.key
    });

  final VoidCallback onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
       highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 56,
        width: width * 0.85,
        decoration: BoxDecoration(
          color: darkModeColors().skipButton,
          borderRadius: BorderRadius.circular(36),
          
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: GoogleFonts.inter(
                  color: darkModeColors().cardColor,
                  fontSize: 24.0,
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}