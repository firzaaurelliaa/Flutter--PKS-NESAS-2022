// ignore_for_file: avoid_unnecessary_containers

import 'package:akhir/pemain_akl.dart';

import 'package:akhir/pilihan_pertandingan.dart';
import 'package:akhir/posisi_akl.dart';
import 'package:akhir/tentang_profil_jurusan.dart';
import 'package:akhir/user_akl_tentang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

class PilihanAtas extends StatelessWidget {
  final DocumentSnapshot? docData;
  const PilihanAtas({Key? key, this.docData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          toolbarHeight: 220,
          title: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    width: 90,
                    height: 90,
                    child: Image(
                      image: NetworkImage(docData!.get('logoJurusan')),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                docData!.get('namaJurusan').toUpperCase(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
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
                // Tab(text: 'Pertandingan'),
                Tab(text: 'Pemain'),
                Tab(text: 'Posisi'),
              ]),
        ),
        body: TabBarView(children: [
          TentangAKL(
            dataJurusan: docData,
          ),
          // PilihanPertandingan(
          //   dataJurusan: docData,
          // ),
          PemainAKL(
            tim1: '',
            tim2: '',
            dataJurusan: docData,
            id: '',
          ),
          PosisiAKL(
            dataJurusan: docData,
          ),
        ]),
      ),
    );
  }
}
