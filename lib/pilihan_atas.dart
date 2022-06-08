// ignore_for_file: avoid_unnecessary_containers

import 'package:akhir/pemaintes.dart';
import 'package:akhir/pertandingan_akl.dart';
import 'package:akhir/posisi_profil_jurusan.dart';
import 'package:akhir/tentang_profil_jurusan.dart';

import 'package:flutter/material.dart';

class PilihanAtas extends StatelessWidget {
  const PilihanAtas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          title: Image(image: AssetImage("assets/images/logopks.png")),
          centerTitle: true,
          backgroundColor: const Color(0xff142D4C),
          elevation: 0,

          // actions: [
          //   IconButton(
          //     onPressed: () => {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const EditPemainAKL(),
          //         ),
          //       ),
          //     },
          //     icon: const Icon(
          //       Icons.edit,
          //       color: Colors.white,
          //     ),
          //   ),
          // ],
          bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'Tentang'),
                Tab(text: 'Pertandingan'),
                Tab(text: 'Pemain'),
                Tab(text: 'Posisi'),
              ]),
        ),
        body: const TabBarView(children: [
          TentangAKL(),
          PertandinganAKL(),
          PemainTes(),
          PosisiAkl(),
        ]),
      ),
    );
  }
}
