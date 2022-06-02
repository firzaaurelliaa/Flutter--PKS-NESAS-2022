import 'dart:async';

import 'package:akhir/edit_profil_admin.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profil_admin.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff142D4C),
      body: Center(
        child: Container(
          width: 290,
          height: 108,
          child: Image.asset('assets/images/logo-splash.png'),
        ),
      ),
    );
  }
}
