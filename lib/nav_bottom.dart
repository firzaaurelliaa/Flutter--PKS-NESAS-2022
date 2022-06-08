import 'package:akhir/home_admin.dart';
import 'package:akhir/klasemen_navbottom.dart';
import 'package:akhir/profil_admin.dart';
import 'package:flutter/material.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({Key? key}) : super(key: key);

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  int _pilihanbottom = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30);
  final List<Widget> _children = [
    const HomeAdmin(),
    const KlasemenNavBottom(),
    const ProfilAdmin(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pilihanbottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BOTOM NAVIGATION//
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _pilihanbottom,
        selectedItemColor: const Color(0xff142D4C),
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.stairs_outlined), label: 'Klasemen'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),
    );
  }
}
