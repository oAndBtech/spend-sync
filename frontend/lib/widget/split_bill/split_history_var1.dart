import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// You requested

// bugs - when title/whopaid etc is longer, doesn't work
//      - button, horizontal lines

// not responsive 

class SplitHistory1 extends StatefulWidget {
  const SplitHistory1(
      {required this.billAmount,
      required this.date,
      required this.onTap,
      required this.paidNum,
      required this.splitTitle,
      required this.totalPayee,
      super.key});

  final String splitTitle;
  final String date;
  final String billAmount;
  final int paidNum;
  final int totalPayee;
  final VoidCallback onTap;

  @override
  State<SplitHistory1> createState() => _SplitHistory1State();
}

class _SplitHistory1State extends State<SplitHistory1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 16),
            child: Container(
              height: 1,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: const Color(0xffEEEEEE).withOpacity(0.8),
              ),
            ),
          ),
          Text(
            'You requested for ${widget.splitTitle}',
            style: GoogleFonts.inter(
              color: const Color(0xffEEEEEE),
              fontWeight: FontWeight.w300,
              letterSpacing: -0.2,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            widget.date,
            style: GoogleFonts.inter(
              color: const Color(0xffEEEEEE),
              fontWeight: FontWeight.w300,
              letterSpacing: -0.2,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.billAmount,
            style: GoogleFonts.inter(
              color: const Color(0xffEEEEEE),
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${widget.paidNum}/${widget.totalPayee} Paid',
            style: GoogleFonts.inter(
              color: const Color(0xffEEEEEE),
              fontWeight: FontWeight.w300,
              letterSpacing: -0.2,
              fontSize: 16.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 54),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: widget.onTap,
              child: Container(
                height: 40,
                width: 178,
                decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 40),
                    ),
                    Text(
                      'See Details',
                      style: GoogleFonts.inter(
                        color: const Color(0xff222831),
                        fontWeight: FontWeight.w300,
                        letterSpacing: -0.2,
                        fontSize: 18.0,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(right: 18),
                      child: Icon(
                        FontAwesomeIcons.chevronRight,
                        color: Color(0xff222831),
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
            child: Container(
              height: 1,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: const Color(0xffEEEEEE).withOpacity(0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}