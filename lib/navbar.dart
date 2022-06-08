import 'package:akhir/home_admin.dart';
import 'package:akhir/klasemen_navbottom.dart';
import 'package:akhir/profil_admin.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarBottom(),
    );
  }
}

class NavBarBottom extends StatefulWidget {
  const NavBarBottom({Key? key}) : super(key: key);

  @override
  State<NavBarBottom> createState() => _NavBarBottomState();
}

class _NavBarBottomState extends State<NavBarBottom> {
  int _pilihanBottom = 0;

  final List<Widget> _children = [
    const HomeAdmin(),
    const KlasemenNavBottom(),
    const ProfilAdmin(),
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
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
        currentIndex: _pilihanBottom,
        selectedItemColor: const Color(0xff142D4C),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
