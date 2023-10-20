import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

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
      height: 40,
      width: width * 0.8,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Center(
              child: Container(
                height: 1,
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: darkModeColors().secondary.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                categoryIcon,
                const SizedBox(
                  width: 8,
                ),
                Text(
                  categoryName,
                  style: GoogleFonts.inter(
                          color: darkModeColors().textColor,
                          fontSize: 18.0,
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text(
                      amount,
                      style: GoogleFonts.inter(
                          color: darkModeColors().textColor,
                          fontSize: 18.0,
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.w500),
                    )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Center(
              child: Container(
                height: 1,
                width: width * 0.8,
                decoration: BoxDecoration(
                  color: darkModeColors().secondary.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}