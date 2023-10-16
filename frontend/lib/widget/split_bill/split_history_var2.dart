import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';

// Someone requested

// bugs - when title/whopaid etc is longer, doesn't work
//      - button, horizontal lines

// not responsive 

class SplitHistory2 extends StatefulWidget {
  const SplitHistory2(
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
  State<SplitHistory2> createState() => _SplitHistoryState();
}

class _SplitHistoryState extends State<SplitHistory2> {
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
                  color: darkModeColors().textColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:  s ,right: 16),
            child: Text(
              '${widget.whoRequested} requested for ${widget.splitTitle}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.2,
                fontSize: 16.0,
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
                fontSize: 16.0,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding:  EdgeInsets.only(left: s),
            child: Text(
              widget.billAmount,
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.2,
                fontSize: 24.0,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding:  EdgeInsets.only(left: s),
            child: Text(
              '${widget.paidNum}/${widget.totalPayee} Paid',
              style: GoogleFonts.inter(
                color: darkModeColors().textColor,
                fontWeight: FontWeight.w300,
                letterSpacing: -0.2,
                fontSize: 16.0,
              ),
            ),
          ),
          Center(
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: widget.onTap,
              child: Container(
                height: 40,
                width: 82,
                decoration: BoxDecoration(
                    color: darkModeColors().textColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                    ),
                    Text(
                      'Pay',
                      style: GoogleFonts.inter(
                        color: darkModeColors().cardColor,
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.2,
                        fontSize: 18.0,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Icon(
                        FontAwesomeIcons.chevronRight,
                        color: darkModeColors().cardColor,
                        size: 10.8,
                      ),
                    ),
                  ],
                ),
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
                  color: darkModeColors().textColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
