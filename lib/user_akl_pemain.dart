// ignore_for_file: avoid_unnecessary_containers



import 'package:flutter/material.dart';

class UserAKLPemain extends StatelessWidget {
  const UserAKLPemain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                'Pemain Futsal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Card(
                    nama: 'Dadan',
                    posisi: 'Gelandang',
                    no: '7',
                    foto: Image.asset('assets/images/atep.jpg'),
                  ),
                  Card(
                    nama: 'Atep',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: const Text(
                  'Pemain Basket',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Card(
                    nama: 'Dadan',
                    posisi: 'Gelandang',
                    no: '7',
                    foto: Image.asset('assets/images/atep.jpg'),
                  ),
                  Card(
                    nama: 'Atep',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: const Text(
                  'Pemain Voli',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  Card(
                    nama: 'Dadan',
                    posisi: 'Gelandang',
                    no: '7',
                    foto: Image.asset('assets/images/atep.jpg'),
                  ),
                  Card(
                    nama: 'Atep',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                  Card(
                    nama: 'Atetp',
                    foto: Image.asset('assets/images/atep.jpg'),
                    posisi: 'Bek',
                    no: '9',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: const Text(
                  'Pemain Catur',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 15),
                Card(
                  nama: 'Dadan',
                  posisi: 'Gelandang',
                  no: '7',
                  foto: Image.asset('assets/images/atep.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: const Text(
                  'Pemain Bulutangkis',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 15),
                Card(
                  nama: 'Dadan',
                  posisi: 'Gelandang',
                  no: '7',
                  foto: Image.asset('assets/images/atep.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                child: const Text(
                  'Pemain Tenis Meja',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 15),
                Card(
                  nama: 'Awwrarwlie',
                  posisi: 'Gelandang',
                  no: '7',
                  foto: Image.asset('assets/images/teniss.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.nama,
    required this.foto,
    required this.posisi,
    required this.no,
  }) : super(key: key);

  final String nama;
  final Image foto;
  final String posisi;
  final String no;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: foto,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  posisi,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff142D4C),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        no,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
