import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/const/fontSizes.dart';
import 'package:spend_sync/services/user_model.dart';

class GiveTakeListWidget extends StatefulWidget {
  final bool isTake;
  final Map<UserModel, String> data; //usermodel , amount
  const GiveTakeListWidget(
      {super.key, required this.isTake, required this.data});

  @override
  State<GiveTakeListWidget> createState() => _GiveTakeListWidgetState();
}

class _GiveTakeListWidgetState extends State<GiveTakeListWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      //add padding and color/decoration while making the screen page ,

      // padding: const EdgeInsets.only(top: 12, bottom: 12),
      // decoration: BoxDecoration(
      //   color: darkModeColors().buttonColor,
      //   borderRadius: BorderRadius.circular(18),
      // ),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.data.length,
        itemBuilder: (ctx, index) {
          var entry = widget.data.entries.elementAt(index);
          var user = entry.key;
          var amount = entry.value;

          return boundByLines(
            isTop: index == 0,
            width: width,
            widget: Container(
              // padding: EdgeInsets.all(5),
              child: widget.isTake
                  ? takeMoneyComponent(
                      image: user.pic, name: user.name, amount: amount)
                  : giveMoneyComponent(
                      image: user.pic, name: user.name, amount: amount),
            ),
          );
        },
      ),
    );
  }

  Widget giveMoneyComponent({
    required String image,
    required String name,
    required String amount,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 14,
        ),
        const SizedBox(width: 12),
        const SizedBox(width: 12),
        Expanded(
          flex: 9,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
                fontSize: fontSizes().giveTakeName,
                color: darkModeColors().textColor,
                letterSpacing: -0.2,
                fontWeight: FontWeight.w400),
          ),
        ),
        // const Spacer(),
        Expanded(
          flex: 3,
          child: Text(
            amount,
            style: GoogleFonts.inter(
                fontSize: fontSizes().giveTakeAmount,
                color: darkModeColors().textColor,
                letterSpacing: -0.2,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget takeMoneyComponent({
    required String image,
    required String name,
    required String amount,
  }) {
    return Row(
      children: [
        // const SizedBox(
        //   width: 12,
        // ),
        CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 14,
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 6,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
                fontSize: fontSizes().giveTakeName,
                color: darkModeColors().textColor,
                letterSpacing: -0.2,
                fontWeight: FontWeight.w400),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 4,
          child: Text(
            amount,
            style: GoogleFonts.inter(
                fontSize: fontSizes().giveTakeAmount,
                color: darkModeColors().textColor,
                letterSpacing: -0.2,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(width: 20),
        // ElevatedButton(
        //   onPressed: () {},
        //   child: Text(
        //     'Request',
        //     style: GoogleFonts.inter(
        //         color: darkModeColors().primary, fontWeight: FontWeight.w300),
        //   ),
        // ),
        InkWell(
          onTap: () {
            print('Request Clicked');
          },
          child: Container(
            height: 28,
            decoration: BoxDecoration(
                color: darkModeColors().textColor,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 1),
                child: Text(
                  'Request',
                  style: GoogleFonts.inter(
                      color: darkModeColors().primary,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget boundByLines(
      {required Widget widget, bool isTop = false, required double width}) {
    return Column(
      children: [
        if (isTop)
          Container(
            height: 1,
            width: width * 0.9,
            decoration: BoxDecoration(
              color: darkModeColors().secondary.withOpacity(0.8),
            ),
          ),
        Padding(
          padding: EdgeInsets.only(
              left: width * 0.05, right: width * 0.05, top: 6, bottom: 6),
          child: widget,
        ),
        Container(
          height: 1,
          width: width * 0.9,
          decoration: BoxDecoration(
            color: darkModeColors().secondary.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
