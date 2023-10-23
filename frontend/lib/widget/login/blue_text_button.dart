import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

class BlueTextButton extends StatelessWidget {
  const BlueTextButton({
    required this.onTap,
    required this.buttonText,
    required this.custonFontSize,
    super.key
    });

    final VoidCallback onTap;
    final String buttonText;
    final double custonFontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Text(
        buttonText,
        style: GoogleFonts.inter(
          color: darkModeColors().blueTextButton,
          fontWeight: FontWeight.w500,
          fontSize: custonFontSize,
          letterSpacing: -0.2,
        ),
      ),
    );
  }
}