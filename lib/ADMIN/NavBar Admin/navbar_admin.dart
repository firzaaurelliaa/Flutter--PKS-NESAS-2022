import 'package:akhir/Admin/NavBar%20Admin/home_admin.dart';
import 'package:akhir/Admin/NavBar%20Admin/klasemen_navbar_admin.dart';
import 'package:akhir/Admin/Profil%20Admin/profil_admin.dart';
import 'package:flutter/material.dart';

class NavBarAdmin extends StatelessWidget {
  const NavBarAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBarBottomAdmin(),
    );
  }
}

class NavBarBottomAdmin extends StatefulWidget {
  const NavBarBottomAdmin({Key? key}) : super(key: key);

  @override
  State<NavBarBottomAdmin> createState() => _NavBarBottomAdminState();
}

class _NavBarBottomAdminState extends State<NavBarBottomAdmin> {
  int _pilihanBottom = 0;

  final List<Widget> _children = [
     HomeAdmin(),
    const KlasemenNavbar(),
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
