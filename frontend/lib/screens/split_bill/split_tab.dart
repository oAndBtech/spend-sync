import 'package:flutter/material.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/profile/profile_button.dart';
import 'package:spend_sync/widget/split_bill/split_history_var1.dart';
import 'package:spend_sync/widget/split_bill/split_history_var2.dart';
import 'package:spend_sync/widget/split_bill/split_history_var3.dart';

class SplitTab extends StatefulWidget {
  const SplitTab({super.key});

  @override
  State<SplitTab> createState() => _SplitTabState();
}

class _SplitTabState extends State<SplitTab> {
  List<Widget> list = [
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Split a bill',
                  buttonType: 2,
                  icon: Icon(
                    Icons.call_split_rounded,
                    color: darkModeColors().textColor,
                  )),
              ProfileButton(
                  onTap: () {},
                  buttonText: 'Request from a friend',
                  buttonType: 3,
                  icon: Icon(
                    Icons.request_page_rounded,
                    color: darkModeColors().textColor,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
                child: Container(
                  decoration: BoxDecoration(
                    color: darkModeColors().buttonColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (tx, index) {
                      return list.elementAt(index % 3);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
