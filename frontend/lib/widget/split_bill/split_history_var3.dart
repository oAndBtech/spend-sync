import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';

// Someone requested and you paid

// bugs - when title/whopaid etc is longer, doesn't work
//      - button, horizontal lines

// not responsive 

class SplitHistory3 extends StatefulWidget {
  const SplitHistory3(
      {required this.billAmount,
      required this.whoRequested,
      required this.date,
      required this.onTap,
      required this.paidNum,
      required this.splitTitle,
      required this.totalPayee,
      super.key});

  final String splitTitle;
  final String whoRequested;
  final String date;
  final String billAmount;
  final int paidNum;
  final int totalPayee;
  final VoidCallback onTap;

  @override
  State<SplitHistory3> createState() => _SplitHistoryState();
}

class _SplitHistoryState extends State<SplitHistory3> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double s = width*0.08;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 16),
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
            padding:  EdgeInsets.only(left:  s ,right: 16),
            child: Text(
              '${widget.whoRequested} requested for ${widget.splitTitle}',
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.2,
                fontSize: fontSizes().infoLineSplitHistory,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding:  EdgeInsets.only(left:  s ,right: 16),
            child: Text(
              widget.date,
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.2,
                fontSize: fontSizes().dateSplitHistory,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding:  EdgeInsets.only(left:  s ,right: 16),
            child: Text(
              widget.billAmount,
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
                fontSize: fontSizes().billAmountSplitHistory,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding:  EdgeInsets.only(left:  s ,right: 16),
            child: Text(
              '${widget.paidNum}/${widget.totalPayee} Paid',
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.2,
                fontSize: fontSizes().noOfPaidSplitHistory,
              ),
            ),
          ),
          Center(
            child: Text(
              'You Paid!',
              style: GoogleFonts.inter(
              color: darkModeColors().textColor,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
              fontSize: fontSizes().youPaidSplit3,
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 6),
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
