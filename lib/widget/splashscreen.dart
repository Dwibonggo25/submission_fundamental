import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fundamental_submission1/widget/homescreen.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSpalshScreen();
  }

  _startSpalshScreen() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, _navigationPage);
  }

  void _navigationPage() {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: Center (
          child: Text (
            "Restaurant",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ) ,
    );
  }
}

