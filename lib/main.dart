import 'package:flutter/material.dart';
import 'package:fundamental_submission1/widget/detailrestaurantscreen.dart';
import 'package:fundamental_submission1/widget/homescreen.dart';
import 'package:fundamental_submission1/widget/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Restaurant App",
      theme: ThemeData (
        primarySwatch: Colors.yellow,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        DetailResturant.routeName: (context) => DetailResturant(),
      },
    );
  }
}
