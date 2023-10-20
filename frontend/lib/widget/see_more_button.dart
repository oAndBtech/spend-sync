import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    required this.onTap,
    super.key
    });

    final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Text(
        'See More',
        style: GoogleFonts.inter(
          color: darkModeColors().textColor,
          fontWeight: FontWeight.w300,
          fontSize: 16,
          letterSpacing: -0.2,
          decoration: TextDecoration.underline,
          decorationColor: darkModeColors().textColor
        ),
      ),
    );
  }
}