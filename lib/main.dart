import 'package:akhir/nav_bar_admin.dart';
import 'package:akhir/nav_bar_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:akhir/splashscreen.dart';
import 'package:akhir/auth_service.dart';
import 'auth_service.dart';
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
            return const NavBarAdmin();
          } else {
            return const NavBarUser();
          }
        },
      ),
      // home: SplashScreen(),
    );
  }
}
