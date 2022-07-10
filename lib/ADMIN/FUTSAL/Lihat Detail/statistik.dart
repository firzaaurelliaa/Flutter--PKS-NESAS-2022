// ignore_for_file: avoid_print

import 'package:akhir/Admin/FUTSAL/Lihat%20Detail/edit_statistik.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Statistik extends StatefulWidget {
  final String id;
  const Statistik({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Statistik> createState() => _StatistikState();
}

class _StatistikState extends State<Statistik> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('statistikPertandingan')
            .where('caborId', isEqualTo: widget.id)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff142D4C),
              ),
            );
          }
          if (snapshot.hasError) {
            return const Text("Tunggu sebentar, ada yang salah");
          } else {
            return ListView(
              shrinkWrap: true,
              // itemCount: snapshot.data!.length,
              children: [
                ...snapshot.data!.docs.map((e) {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffD7E9F7),
                                ),
                                child: IconButton(
                                  onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => (EditStatistik(
                                          docid: e,
                                          id: e.id,
                                        )),
                                      ),
                                    ),
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 360,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffD7E9F7),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(20),
                                      child: const Text(
                                        'STATISTIK PERTANDINGAN',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim1')['tendanganKeGawang'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 83,
                                      child: Container(
                                        width: 235,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  child: Image.asset(
                                                      'assets/images/shotson.png')),
                                              const Text(
                                                'TENDANGAN KE GAWANG',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim2')['tendanganKeGawang'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim1')['penguasaanBola'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 83,
                                      child: Container(
                                        width: 235,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  child: Image.asset(
                                                      'assets/images/ballpo.png')),
                                              const Text(
                                                'PENGUASAN BOLA',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim2')['penguasaanBola'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim1')['pelanggaran'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 83,
                                      child: Container(
                                        width: 235,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  child: Image.asset(
                                                      'assets/images/fouls.png')),
                                              const Text(
                                                'PELANGGARAN',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim2')['pelanggaran'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim1')['kartuKuning'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 83,
                                      child: Container(
                                        width: 235,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  child: Image.asset(
                                                      'assets/images/yellow.png')),
                                              const Text(
                                                'KARTU KUNING',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim2')['kartuKuning'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim2')['kartuMerah'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 83,
                                      child: Container(
                                        width: 235,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  child: Image.asset(
                                                      'assets/images/red.png')),
                                              const Text(
                                                'KARTU MERAH',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim2')['kartuMerah'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim1')['tendangan'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 83,
                                      child: Container(
                                        width: 235,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  margin:
                                                      const EdgeInsets.all(4),
                                                  child: Image.asset(
                                                      'assets/images/shots.png')),
                                              const Text(
                                                'TENDANGAN',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 5,
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      flex: 15,
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color(0xff142D4C)),
                                        child: Center(
                                          child: Text(
                                            e.get('tim2')['tendangan'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 6,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  );
                })
              ],
            );
          }
        },
      ),
    );
  }
}
