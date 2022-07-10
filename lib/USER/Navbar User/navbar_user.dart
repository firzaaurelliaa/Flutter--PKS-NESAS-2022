import 'package:akhir/USER/Navbar%20User/klasemen_navbar_user.dart';
import 'package:akhir/User/Navbar%20User/home_user.dart';

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
