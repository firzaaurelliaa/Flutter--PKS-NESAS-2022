import 'package:akhir/deskripsi_rpl_otkp.dart';
import 'package:akhir/edit_profil_admin.dart';
import 'package:akhir/home_admin.dart';
import 'package:akhir/klasemen_futsal.dart';
import 'package:akhir/pemaintes.dart';
import 'package:akhir/profil_admin.dart';
import 'package:akhir/statistik_rpl_otkp.dart';
import 'package:akhir/tentang_profil_jurusan.dart';
import 'package:akhir/tim_futsal_rpl_otkp.dart';
import 'package:flutter/material.dart';

class TabbarBody extends StatefulWidget {
  @override
  _TabbarBodyState createState() => _TabbarBodyState();
}

class _TabbarBodyState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      appBar: AppBar(
        title: const Text("F U L L   T I M E"),
        centerTitle: true,
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              child: const TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                tabs: [
                  const Tab(text: 'Statistik'),
                  Tab(text: 'Tim'),
                  Tab(text: 'Deskripsi'),
                  const Tab(text: 'Klasemen'),
                ],
              ),
            ),
            const Expanded(
              child: const TabBarView(
                children: [
                  StatistikRPLOTKP(),
                  TimFutsalRplOtkp(),
                  const DeskripsiRplOtkp(),
                  KlasemenFutsal(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
