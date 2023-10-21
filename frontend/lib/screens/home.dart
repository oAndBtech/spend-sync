import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/services/user_model.dart';
import 'package:spend_sync/widget/app_bar.dart';
import 'package:spend_sync/widget/home/give_take_widget.dart';
import 'package:spend_sync/widget/home/histogram_widget.dart';
import 'package:spend_sync/widget/home/top_expenses_widget.dart';
import 'package:spend_sync/widget/see_more_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      TopExpensesElement(
          amount: '\$ 25',
          categoryIcon: Icon(
            FontAwesomeIcons.wineBottle,
            color: darkModeColors().textColor,
          ),
          categoryName: 'Cold Drinks'),
      TopExpensesElement(
          amount: '\$ 52',
          categoryIcon:
              Icon(FontAwesomeIcons.shirt, color: darkModeColors().textColor),
          categoryName: 'Clothes'),
      TopExpensesElement(
          amount: '\$ 6',
          categoryIcon: Icon(FontAwesomeIcons.bottleWater,
              color: darkModeColors().textColor),
          categoryName: 'Fuel')
    ];

    Map<UserModel, String> sampleData = {
      UserModel(
          name: "User 1",
          email: "user1@example.com",
          pic: "url_to_image",
          isFriend: true,
          phone: "1234567890"): "\$ 100",
      UserModel(
          name: "User 2",
          email: "user2@example.com",
          pic: "url_to_image",
          isFriend: true,
          phone: "9876543210"): "\$ 50",
      UserModel(
          name: "User 3",
          email: "user3@example.com",
          pic: "url_to_image",
          isFriend: false,
          phone: "1234567890"): "\$ 100",
      UserModel(
          name: "User 4",
          email: "user4@example.com",
          pic: "url_to_image",
          isFriend: true,
          phone: "9876543210"): "\$ 50",
      UserModel(
          name: "User 5",
          email: "user5@example.com",
          pic: "url_to_image",
          isFriend: false,
          phone: "1234567890"): "\$ 100",
      UserModel(
          name: "User 6",
          email: "user6@example.com",
          pic: "url_to_image",
          isFriend: true,
          phone: "9876543210"): "\$ 50",
    };

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        //===========================================================
        //            App Bar
        //===========================================================
        const NewAppBar(isNotification: true, title: 'Home', leadingIcon: 1),

        //===========================================================
        //            Body
        //===========================================================
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 18, right: 18),
                    child: Row(
                      children: [
                        //===========================================================
                        //            Current balance
                        //===========================================================
                        Expanded(
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              color: darkModeColors().cardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Current balance',
                                     maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      color: darkModeColors().textColor,
                                      fontSize: 18.0,
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '\$ 200',
                                    style: GoogleFonts.inter(
                                      color: darkModeColors().textColor,
                                      fontSize: 18.0,
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),

                        //===========================================================
                        //            Month's Balance
                        //===========================================================
                        Expanded(
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              color: darkModeColors().cardColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Column(
                                children: [
                                  Text(
                                    'This Month\'s Expense',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      color: darkModeColors().textColor,
                                      fontSize: 18.0,
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '\$ 200',
                                    style: GoogleFonts.inter(
                                      color: darkModeColors().textColor,
                                      fontSize: 18.0,
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //===========================================================
                  //            Top Expenses
                  //===========================================================

                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 18, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkModeColors().cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Top Expenses',
                              style: GoogleFonts.inter(
                                color: darkModeColors().textColor,
                                fontSize: 21.0,
                                letterSpacing: -0.2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 7,
                              itemBuilder: (context, index) {
                                return list.elementAt(index % 3);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Center(
                                child: Container(
                                  height: 1,
                                  width: width * 0.75,
                                  decoration: BoxDecoration(
                                    color: darkModeColors()
                                        .secondary
                                        .withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(child: SeeMoreButton(onTap: () {})),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //===========================================================
                  //            Histogram
                  //===========================================================
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 18, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkModeColors().cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Visual Representation',
                                  style: GoogleFonts.inter(
                                    color: darkModeColors().textColor,
                                    fontSize: 21.0,
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                // weekly/daily button
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const HistogramWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //===========================================================
                  //            Give money to
                  //===========================================================
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 18, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkModeColors().cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Give Money to :',
                                  style: GoogleFonts.inter(
                                    color: darkModeColors().textColor,
                                    fontSize: 21.0,
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GiveTakeListWidget(isTake: false, data: sampleData),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(child: SeeMoreButton(onTap: () {})),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //===========================================================
                  //            Take money from
                  //===========================================================
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 18, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: darkModeColors().cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Take Money from :',
                                  style: GoogleFonts.inter(
                                    color: darkModeColors().textColor,
                                    fontSize: 21.0,
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GiveTakeListWidget(isTake: true, data: sampleData),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(child: SeeMoreButton(onTap: () {})),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 28.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ))

        // current balance and this month expense
        // top expenses
        // Visual Rep
        // give money to
        // take money from

        );
  }
}
