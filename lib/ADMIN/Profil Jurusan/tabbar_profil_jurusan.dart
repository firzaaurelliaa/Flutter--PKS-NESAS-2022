// ignore_for_file: avoid_unnecessary_containers
import 'package:akhir/Admin/Profil%20Jurusan/posisi.dart';
import 'package:akhir/Admin/Profil%20Jurusan/tentang.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TabbarProfilJurusan extends StatelessWidget {
  final DocumentSnapshot? docData;
  const TabbarProfilJurusan({Key? key, this.docData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff142D4C),
        automaticallyImplyLeading: true,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Center(
              child: Stack(
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
            ),
            const SizedBox(height: 20),
            Text(
              docData!.get('namaJurusan').toUpperCase(),
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 20),
            Container(
              child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  tabs: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Tab(text: 'Tentang')),

                    // Tab(text: 'Pertandingan'),
                    // Tab(text: 'Pemain'),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3,
                        child: const Tab(text: 'Posisi')),

                    // Tab(text: 'Pertandingan'),
                    // Tab(text: 'Pemain'),
                  ]),
            ),
            Expanded(
              child: TabBarView(children: [
                Tentang(
                  dataJurusan: docData,
                ),
                // PilihanPertandingan(
                //   dataJurusan: docData,
                // ),
                // NyobainPemainAkl(dataJurusan: docData, tim1: '', tim2: '', id: ''),
                // PemainAKL(
                //   tim1: '',
                //   tim2: '',
                //   dataJurusan: docData,
                //   id: '',
                // ),
                Posisi(
                  dataJurusan: docData,
                ),

                // PilihanPertandingan(
                //   dataJurusan: docData,
                // ),
                // NyobainPemainAkl(dataJurusan: docData, tim1: '', tim2: '', id: ''),
                // PemainAKL(
                //   tim1: '',
                //   tim2: '',
                //   dataJurusan: docData,
                //   id: '',
                // ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
