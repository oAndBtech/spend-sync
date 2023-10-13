import 'package:flutter/material.dart';
import 'package:spend_sync/widget/split_bill/split_history_var1.dart';

class SplitBillScreen extends StatelessWidget {
  const SplitBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24,left: 16,right: 16), // Add padding if needed
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF222831),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true, // This will make the ListView take only the space it needs
                itemCount: 6,
                itemBuilder: (tx, index) {
                  return SplitHistory1(
                    billAmount: '\$ 45.0',
                    date: '08/04/2023',
                    onTap: () {},
                    paidNum: 5,
                    splitTitle: 'Bhaskar\'s Birthday',
                    totalPayee: 21,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
