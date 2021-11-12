import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: AppColor.appColor,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      checkTheUserSession();
    });
  }

  checkTheUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token") ?? "";
    if (token.isEmpty) {
      //navigate to login page
      Navigator.of(context).pushReplacementNamed("/loginScreen");
    } else {
      //navigate to home page
      Navigator.of(context).pushReplacementNamed("/getApiCall");
    }
    //login or home
  }
}
