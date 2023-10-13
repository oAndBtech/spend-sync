import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spend_sync/bottom_navbar.dart';
import 'package:spend_sync/screens/profile.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff131921)).copyWith(background: Color(0xff393E46)),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: BottomNavBar(),
    );
  }
}

