import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spend_sync/bottom_navbar.dart';
import 'package:spend_sync/const/colors.dart';
import 'package:spend_sync/widget/activity/pie_chart.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    //status bar color
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff131921),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spend Sync',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: darkModeColors().primary).copyWith(background: darkModeColors().secondary),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        body: PieCharWidget( dataMap: {
                                  'Food': 50,
                                  'Internet':  45,
                                  'Mobile Bill': 69,
                                  'Rent': 420,
                                  'Cloths': 10,
                                   'Food1': 50,
                                  'Internet1':  45,
                                  'Mobile Bill1': 69,
                                  'Rent1': 420,
                                  'Cloths1': 10,
                                },),
      ),
    );
  }
}

