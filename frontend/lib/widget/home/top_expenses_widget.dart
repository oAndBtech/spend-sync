import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';

class TopExpensesElement extends StatelessWidget {
  const TopExpensesElement(
      {required this.amount,
      required this.categoryIcon,
      required this.categoryName,
      super.key});

  final Icon categoryIcon;
  final String categoryName;
  final String amount;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      // color: darkModeColors().cardColor,
      height: 36,
      width: width * 0.8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Center(
              child: Container(
                height: 1,
                width: width * 0.75,
                decoration: BoxDecoration(
                  color: darkModeColors().secondary.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.08, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                categoryIcon,
                const SizedBox(
                  width: 12,
                ),
                Text(
                  categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                          color: darkModeColors().textColor,
                          fontSize: fontSizes().topExpensesCategory,
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text(
                      amount,
                      style: GoogleFonts.inter(
                          color: darkModeColors().textColor,
                          fontSize: fontSizes().topExpensesAmount,
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w500),
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
