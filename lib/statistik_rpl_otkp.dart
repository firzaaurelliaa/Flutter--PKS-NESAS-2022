import 'package:akhir/form_statistik.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatistikRPLOTKP extends StatefulWidget {
  final String docId;
  const StatistikRPLOTKP({Key? key, required this.docId}) : super(key: key);

  @override
  State<StatistikRPLOTKP> createState() => _StatistikRPLOTKPState();
}

class _StatistikRPLOTKPState extends State<StatistikRPLOTKP> {
  final tim1tendangankegawang = TextEditingController();
  final tim1penguasaanbola = TextEditingController();
  final tim1pelanggaran = TextEditingController();
  final tim1kartukuning = TextEditingController();
  final tim1kartumerah = TextEditingController();
  final tim1tendangan = TextEditingController();
  final tim2tendangankegawang = TextEditingController();
  final tim2penguasaanbola = TextEditingController();
  final tim2pelanggaran = TextEditingController();
  final tim2kartukuning = TextEditingController();
  final tim2kartumerah = TextEditingController();
  final tim2tendangan = TextEditingController();
  Future<void> update([DocumentSnapshot? snapshot]) async {
    if (snapshot != null) {
      tim1tendangankegawang.text = snapshot['tim1']['tendanganKeGawang'];
      tim1penguasaanbola.text = snapshot['tim1']['penguasaanBola'];
      tim1pelanggaran.text = snapshot['tim1']['pelanggaran'];
      tim1kartukuning.text = snapshot['tim1']['kartuKuning'];
      tim1kartumerah.text = snapshot['tim1']['kartuMerah'];
      tim1tendangan.text = snapshot['tim1']['tendangan'];
      tim2tendangankegawang.text = snapshot['tim2']['tendanganKeGawang'];
      tim2penguasaanbola.text = snapshot['tim2']['penguasaanBola'];
      tim2pelanggaran.text = snapshot['tim2']['pelanggaran'];
      tim2kartukuning.text = snapshot['tim2']['kartuKuning'];
      tim2kartumerah.text = snapshot['tim2']['kartuMerah'];
      tim2tendangan.text = snapshot['tim2']['tendangan'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('statistikPertandingan')
            .where('caborId', isEqualTo: widget.docId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD7E9F7),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.only(left: 50),
                                child: const Text(
                                  'STATISTIK PERTANDINGAN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => (FormStatistik(
                                              docid:
                                                  snapshot.data!.docs[index])),
                                        ),
                                      ),
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 22,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim1')['tendanganKeGawang'],
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: Image.asset(
                                                'assets/images/shotson.png')),
                                        const Text(
                                          'TENDANGAN KE GAWANG',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim2')['tendanganKeGawang'],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim1')['penguasaanBola'],
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: Image.asset(
                                                'assets/images/ballpo.png')),
                                        const Text(
                                          'PENGUASAN BOLA',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim2')['penguasaanBola'],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim1')['pelanggaran'],
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: Image.asset(
                                                'assets/images/fouls.png')),
                                        const Text(
                                          'PELANGGARAN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim2')['pelanggaran'],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim1')['kartuKuning'],
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: Image.asset(
                                                'assets/images/yellow.png')),
                                        const Text(
                                          'KARTU KUNING',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim2')['kartuKuning'],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim1')['kartuMerah'],
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: Image.asset(
                                                'assets/images/red.png')),
                                        const Text(
                                          'KARTU MERAH',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim2')['kartuMerah'],
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim1')['tendangan'],
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.all(4),
                                            child: Image.asset(
                                                'assets/images/shots.png')),
                                        const Text(
                                          'TENDANGAN',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
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
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xff142D4C)),
                                  child: Center(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tim2')['tendangan'],
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     const SizedBox(width: 4),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim1')['penguasaanBola'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 235,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //                 margin: const EdgeInsets.all(4),
                          //                 child: Image.asset(
                          //                     'assets/images/ballpo.png')),
                          //             const Text(
                          //               'PENGUASAAN BOLA',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ]),
                          //     ),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim2')['penguasaanBola'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 14,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 4),
                          //   ],
                          // ),
                          // const SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     const SizedBox(width: 4),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim1')['pelanggaran'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 235,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //                 margin: const EdgeInsets.all(7),
                          //                 child: Image.asset(
                          //                     'assets/images/fouls.png')),
                          //             const Text(
                          //               'PELANGGARAN',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ]),
                          //     ),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim2')['pelanggaran'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 4),
                          //   ],
                          // ),
                          // const SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     const SizedBox(width: 4),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim1')['kartuKuning'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 235,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //                 margin: const EdgeInsets.all(4),
                          //                 child: Image.asset(
                          //                     'assets/images/yellow.png')),
                          //             const Text(
                          //               'KARTU KUNING',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ]),
                          //     ),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim2')['kartuKuning'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 4),
                          //   ],
                          // ),
                          // const SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     const SizedBox(width: 4),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim1')['kartuMerah'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 235,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //                 margin: const EdgeInsets.all(4),
                          //                 child: Image.asset(
                          //                     'assets/images/red.png')),
                          //             const Text(
                          //               'KARTU MERAH',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ]),
                          //     ),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim2')['kartuMerah'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 4),
                          //   ],
                          // ),
                          // const SizedBox(height: 10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     const SizedBox(width: 4),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim1')['tendangan'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       width: 235,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //             Container(
                          //                 margin: const EdgeInsets.all(4),
                          //                 child: Image.asset(
                          //                     'assets/images/shots.png')),
                          //             const Text(
                          //               'TENDANGAN',
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontSize: 12,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //           ]),
                          //     ),
                          //     Container(
                          //       width: 35,
                          //       height: 35,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: const Color(0xff142D4C)),
                          //       child: Center(
                          //         child: Text(
                          //           snapshot.data!.docs[index]
                          //               .get('tim2')['tendangan'],
                          //           style: const TextStyle(
                          //               color: Colors.white,
                          //               fontSize: 17,
                          //               fontWeight: FontWeight.bold),
                          //         ),
                          //       ),
                          //     ),
                          //     const SizedBox(width: 4),
                          //   ],
                          // ),
                          // const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
