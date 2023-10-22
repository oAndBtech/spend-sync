import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/activity/transaction_element.dart';
import 'package:spend_sync/widget/app_bar.dart';
import 'package:spend_sync/widget/graph_widget.dart';
import 'package:spend_sync/widget/home/histogram_widget.dart';
import 'package:spend_sync/widget/see_more_button.dart';
import 'package:spend_sync/widget/split_bill/split_history_var1.dart';
import 'package:spend_sync/widget/split_bill/split_history_var2.dart';
import 'package:spend_sync/widget/split_bill/split_history_var3.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  List<Widget> transactionList = [
    TransactionHistElement(
        categoryIcon: Icon(
          FontAwesomeIcons.wineGlass,
          color: darkModeColors().textColor,
        ),
        amount: '\$ 25',
        categoryName: 'Cold Drinks',
        date: '12/12/2023'),
    TransactionHistElement(
        categoryIcon: Icon(
          FontAwesomeIcons.shirtsinbulk,
          color: darkModeColors().textColor,
        ),
        amount: '\$ 125',
        categoryName: 'Clothes',
        date: '21/12/2023'),
    TransactionHistElement(
        categoryIcon: Icon(
          FontAwesomeIcons.bottleWater,
          color: darkModeColors().textColor,
        ),
        amount: '\$ 7',
        categoryName: 'Fuel',
        date: '31/12/2023'),
  ];

  List<Widget> splitList = [
    SplitHistory1(
      billAmount: '\$ 45.0',
      date: '08/04/2023',
      onTap: () {},
      paidNum: 5,
      splitTitle: 'Bhaskar\'s Birthday',
      totalPayee: 21,
      // whoRequested: 'Omkar',
    ),
    SplitHistory2(
      billAmount: '\$ 45.0',
      date: '08/04/2023',
      onTap: () {},
      paidNum: 5,
      splitTitle: 'Bhaskar\'s Birthday',
      totalPayee: 21,
      whoRequested: 'Omkar',
    ),
    SplitHistory3(
      billAmount: '\$ 45.0',
      date: '08/04/2023',
      onTap: () {},
      paidNum: 5,
      splitTitle: 'Bhaskar\'s Birthday',
      totalPayee: 21,
      whoRequested: 'Omkar',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //  App Bar
          const NewAppBar(
              isNotification: true, title: 'Activity', leadingIcon: 1),

          // Body
          Expanded(
              child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  // pie chart

                  // transaction history
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
                              'Transaction History',
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
                                return transactionList.elementAt(index % 3);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: SeeMoreButton(onTap: () {}),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  // graphical represntation
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
                              'Graphical Representation',
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
                            const GraphWidget(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // last 3 splits
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
                              'Last Splits',
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
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return splitList.elementAt(index % 3);
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Center(
                              child: SeeMoreButton(onTap: () {}),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  // average spending
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
                                  'Average Spending',
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

                  const SizedBox(
                    height: 28.0,
                  ),
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
