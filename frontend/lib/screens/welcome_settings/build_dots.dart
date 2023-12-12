import 'package:flutter/material.dart';
import 'package:spend_sync/const/colors.dart';

Widget buildDotsIndicator(int currentPage, int questions) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
      questions,
      (index) => Container(
        margin: EdgeInsets.all(4),
        width: currentPage == index ? 10 : 5,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == index
              ? darkModeColors().textButton
              : Colors.grey,
        ),
      ),
    ),
  );
}
