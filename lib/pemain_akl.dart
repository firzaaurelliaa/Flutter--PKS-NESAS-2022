// ignore_for_file: avoid_unnecessary_containers

import 'package:akhir/edit_pemain_akl.dart';
import 'package:akhir/home_admin.dart';
import 'package:flutter/material.dart';

class PemainAKL extends StatelessWidget {
  const PemainAKL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        leading: IconButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeAdmin(),
              ),
            ),
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditPemainAKL(),
                ),
              ),
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: const Color(0xff142D4C),
                  ),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          width: 110,
                          height: 110,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/images/AKL.png'),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'AKUTANSI DAN KEUANGAN LEMBAGA',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DefaultTabController(
                initialIndex: 2,
                length: 4,
                child: Column(
                  children: [
                    Container(
                      child: const TabBar(
                        labelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Tentang'),
                          Tab(text: 'Pertandingan'),
                          Tab(text: 'Pemain'),
                          Tab(text: 'Posisi'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Pemain Futsal',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const KartuPemainFutsal(),
                Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 180,
                      decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(15),

                          ),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage('assets/images/atep.jpg'),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: const Text(
                                  'Atep',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: const Text(
                                  'Gelandang',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff142D4C),
                                ),
                                child: const Center(
                                    child: Text(
                                  '7',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class KartuPemainFutsal extends StatelessWidget {
  const KartuPemainFutsal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          width: 120,
          height: 180,
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(15),

              ),
          child: Column(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage('assets/images/atep.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text(
                      'Atep',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text(
                      'Gelandang',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff142D4C),
                    ),
                    child: const Center(
                        child: Text(
                      '7',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    )),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
