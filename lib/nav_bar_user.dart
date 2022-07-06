
import 'package:akhir/home_user.dart';
import 'package:akhir/klasemen_navbar.dart';


import 'package:akhir/page_belum_diatur.dart';
import 'package:akhir/user_klasemen_navbar.dart';

import 'package:flutter/material.dart';

class NavBarUser extends StatelessWidget {
  const NavBarUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarBottomUser(),
    );
  }
}

class NavBarBottomUser extends StatefulWidget {
  const NavBarBottomUser({Key? key}) : super(key: key);

  @override
  State<NavBarBottomUser> createState() => _NavBarBottomUserState();
}

class _NavBarBottomUserState extends State<NavBarBottomUser> {
  int _pilihanBottom = 0;

  final List<Widget> _children = [
    const HomeUser(),
    const UserKlasemenNavbar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pilihanBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _children.elementAt(_pilihanBottom),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stairs_outlined), label: 'Klasemen'),
        ],
        currentIndex: _pilihanBottom,
        selectedItemColor: const Color(0xff142D4C),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
