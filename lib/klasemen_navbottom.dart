// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:akhir/edit_klasemen.dart';

import 'package:flutter/material.dart';

class KlasemenNavBottom extends StatelessWidget {
  const KlasemenNavBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (EditKlasemen()),
                ),
              ),
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
        title: const Text(
          'Klasemen',
          // ignore: unnecessary_const
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logopks.png'),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    ItemCabangOlahraga(
                      no: 'No.',
                      jurusan: "Tim Jurusan",
                      logo: "",
                    ),
                    ItemCabangOlahraga(
                      no: '1',
                      jurusan: "Akutansi dan Keuangan Lembaga",
                      logo: "assets/images/AKL.png",
                    ),
                    ItemCabangOlahraga(
                      no: '2',
                      jurusan: "Bisnis Daring dan Pemasaran",
                      logo: "assets/images/BDP.png",
                    ),
                    ItemCabangOlahraga(
                      no: '3',
                      jurusan: "Desain Grafis",
                      logo: "assets/images/DG.png",
                    ),
                    ItemCabangOlahraga(
                      no: '4',
                      jurusan: "Otomatisasi Tata Kelola Perkantoran",
                      logo: "assets/images/OKTP.png",
                    ),
                    ItemCabangOlahraga(
                      no: '5',
                      jurusan: "Rekayasa Perangka Lunak",
                      logo: "assets/images/TKI.png",
                    ),
                    ItemCabangOlahraga(
                      no: '6',
                      jurusan: "Tata Boga",
                      logo: "assets/images/TB.png",
                    ),
                    ItemCabangOlahraga(
                      no: '7',
                      jurusan: "Teknik Logistik",
                      logo: "assets/images/TL.png",
                    ),
                    ItemCabangOlahraga(
                      no: '8',
                      jurusan: "Teknik Pemesinan",
                      logo: "assets/images/TPM.png",
                    ),
                    ItemCabangOlahraga(
                      no: '9',
                      jurusan: "Teknik Komputer Jaringan",
                      logo: "assets/images/TKI.png",
                    ),
                    ItemCabangOlahraga(
                      no: '2',
                      jurusan: "Teknik dan Bisnis Sepeda Motor",
                      logo: "assets/images/TBSM.png",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCabangOlahraga extends StatelessWidget {
  const ItemCabangOlahraga({
    Key? key,
    required this.no,
    required this.jurusan,
    required this.logo,
  }) : super(key: key);

  final String no;
  final String jurusan;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 715,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffD7E9F7),
          ),
          child: Row(
            children: [
              Container(
                child: Text(
                  no,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: const EdgeInsets.all(6),
              ),
              Image.asset(
                logo,
              ),
              Container(
                child: Text(
                  jurusan,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: const EdgeInsets.all(6),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
