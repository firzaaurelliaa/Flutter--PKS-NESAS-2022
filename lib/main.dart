import 'package:akhir/Admin/NavBar%20Admin/navbar_admin.dart';
import 'package:akhir/Penting/auth_services.dart';
import 'package:akhir/User/Navbar%20User/navbar_user.dart';
import 'package:akhir/page_belum_diatur.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:intl/date_symbol_data_local.dart';
// import 'register_screen.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('id', null);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthService().firebaseAuth.authStateChanges(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return const NavBarUser();
          } else {
            return const NavBarAdmin();
          }
        },
      ),
      // home: SplashScreen(),
    );
  }
}
