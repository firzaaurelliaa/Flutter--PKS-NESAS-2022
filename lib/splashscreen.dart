import 'dart:async';

import 'package:akhir/home_admin.dart';
import 'package:akhir/tab_bar_futsal.dart';
import 'package:akhir/navbar.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      body: Center(
        child: SizedBox(
          width: 290,
          height: 108,
          child: Image.asset('assets/images/logo-splash.png'),
        ),
      ),
    );
  }
}
