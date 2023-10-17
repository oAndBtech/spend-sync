import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

class TransactionHistElement extends StatelessWidget {
  const TransactionHistElement(
      {required this.categoryIcon,
      required this.amount,
      required this.categoryName,
      required this.date,
      super.key});

  final Icon categoryIcon;
  final String categoryName;
  final String date;
  final String amount;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 60,
      width: width * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            categoryIcon,
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryName, // color: 0xffEEEEEE, size 28
                  style: GoogleFonts.inter(
                      color: darkModeColors().textColor,
                      fontSize: 18.0,
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox.shrink(),
                Text(
                  date,
                  style: GoogleFonts.inter(
                      color: darkModeColors().secondaryTextColor,
                      fontSize: 14.0,
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                amount,
                style: GoogleFonts.inter(
                    color: darkModeColors().textColor,
                    fontSize: 18.0,
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
