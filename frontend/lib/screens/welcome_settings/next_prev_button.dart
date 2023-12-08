import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';

class NextPrevButton extends StatelessWidget {
  const NextPrevButton({
    required this.onTap,
    required this.buttonText,
    required this.icon,
    this.start = true,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final String buttonText;
  final Icon icon;
  final bool start;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      borderRadius: BorderRadius.circular(36),
      child: Container(
        height: 52,
        width: width * 0.3,
        decoration: BoxDecoration(
          color: darkModeColors().buttonColor,
          borderRadius: BorderRadius.circular(36),
        ),
        child: start
            ? Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: icon, // size 26
                  ),
                  const SizedBox(width: 10),
                  Text(
                    buttonText,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: darkModeColors().textColor,
                        fontSize: fontSizes().loginButtonFontSize,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0),
                    child: Text(
                      buttonText,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                          color: darkModeColors().textColor,
                          fontSize: fontSizes().loginButtonFontSize,
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: icon, // size 26
                  ),
                ],
              ),
      ),
    );
    ;
  }
}
