import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'edit_profil_admin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tutor',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
