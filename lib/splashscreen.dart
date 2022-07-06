import 'dart:async';

import 'package:akhir/logout.dart';
import 'package:akhir/nav_bar_admin.dart';
import 'package:akhir/nav_bar_user.dart';
import 'package:akhir/page_belum_diatur.dart';

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
          context, MaterialPageRoute(builder: (context) =>  NavBarUser()));
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
