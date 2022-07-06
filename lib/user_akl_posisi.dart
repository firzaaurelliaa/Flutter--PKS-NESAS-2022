// ignore_for_file: avoid_unnecessary_containers

import 'package:akhir/edit_posisi.dart';
import 'package:akhir/klasemen_futsal.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserPosisiAKL extends StatefulWidget {
  final DocumentSnapshot? dataJurusan;
  const UserPosisiAKL({Key? key, this.dataJurusan}) : super(key: key);

  @override
  State<UserPosisiAKL> createState() => _UserPosisiAKLState();
}

class _UserPosisiAKLState extends State<UserPosisiAKL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (_) => addnote()));
      //   },
      //   child: Icon(
      //     Icons.add,
      //   ),
      // ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('positionDatas')
            .where('kelasPemain',
                isEqualTo: widget.dataJurusan!.get('identifierJurusan'))
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Tunggu sebentar, ada yang salah");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff142D4C),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 35, right: 35),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              snapshot.data!.docs[index]
                                  .get('futsal')['posisiKe'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          
                          // Container(
                          //   margin: const EdgeInsets.only(right: 25),
                          //   child: IconButton(
                          //     onPressed: () => {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) => (const EditPosisiAKL())))
                          //     },
                          //     icon: const Icon(Icons.edit, size: 22),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffD7E9F7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Poin :',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Main :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Menang :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Seri :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Kalah :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('futsal')['poin'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('futsal')['main'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('futsal')['menang'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('futsal')['seri'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('futsal')['kalah'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              snapshot.data!.docs[index]
                                  .get('basket')['posisiKe'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffD7E9F7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Poin :',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Main :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Menang :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Seri :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Kalah :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('basket')['poin'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('basket')['main'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('basket')['menang'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('basket')['seri'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('basket')['kalah'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              snapshot.data!.docs[index]
                                  .get('voli')['posisiKe'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffD7E9F7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Poin :',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Main :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Menang :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Seri :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Kalah :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('voli')['poin'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('voli')['main'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('voli')['menang'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('voli')['seri'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('voli')['kalah'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              snapshot.data!.docs[index]
                                  .get('catur')['posisiKe'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffD7E9F7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Poin :',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Main :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Menang :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Seri :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Kalah :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('catur')['poin'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('catur')['main'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('catur')['menang'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('catur')['seri'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('catur')['kalah'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              snapshot.data!.docs[index]
                                  .get('bulutangkis')['posisiKe'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffD7E9F7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Poin :',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Main :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Menang :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Seri :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Kalah :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('bulutangkis')['poin'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('bulutangkis')['main'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('bulutangkis')['menang'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('bulutangkis')['seri'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('bulutangkis')['kalah'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              snapshot.data!.docs[index]
                                  .get('tenismeja')['posisiKe'],
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xffD7E9F7),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Text(
                                    'Poin :',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Main :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Menang :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Seri :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                const Text(
                                  'Kalah :',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .get('tenismeja')['poin'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('tenismeja')['main'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('tenismeja')['menang'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('tenismeja')['seri'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]
                                        .get('tenismeja')['kalah'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 50),
                  ],
                ),
              );
            },
          );
          // return ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: snapshot.data!.docs.length,
          //   itemBuilder: (_, index) {
          //     return Padding(
          //       padding: const EdgeInsets.only(left: 35, right: 35),
          //       child: Column(
          //         children: [
          //           const SizedBox(height: 10),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 margin: const EdgeInsets.all(10),
          //                 child: const Text(
          //                   'Tes Futsal Posisi jurusan',
          //                   style: TextStyle(
          //                     fontSize: 17,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //               Container(
          //                 child: IconButton(
          //                   onPressed: () {
          //                     Navigator.pushReplacement(
          //                         context,
          //                         MaterialPageRoute(
          //                             builder: (_) => editnote(
          //                                 docid:
          //                                     snapshot.data!.docs[index])));
          //                   },
          //                   icon: const Icon(Icons.edit, size: 22),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Container(
          //             padding: const EdgeInsets.all(11),
          //             width: MediaQuery.of(context).size.width,
          //             height: 118,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(5),
          //               color: const Color(0xffD7E9F7),
          //             ),
          //             child: Text(
          //               snapshot.data!.docChanges[index].doc['tentangJurusan'],
          //               style: const TextStyle(
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(height: 10),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Row(
          //                 children: [
          //                   Container(
          //                     margin: const EdgeInsets.all(10),
          //                     child: const Text(
          //                       'Kejuaraan yang pernah diraih',
          //                       style: TextStyle(
          //                         fontSize: 17,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //           Container(
          //             padding: const EdgeInsets.all(11),
          //             width: MediaQuery.of(context).size.width,
          //             height: 118,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(5),
          //               color: const Color(0xffD7E9F7),
          //             ),
          //             child: Text(
          //               snapshot.data!.docChanges[index]
          //                   .doc['kejuaraanYangPernahDiraih'],
          //               style: const TextStyle(
          //                 fontSize: 15,
          //               ),
          //             ),
          //           ),
          //           const SizedBox(height: 10),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 margin: const EdgeInsets.all(10),
          //                 child: const Text(
          //                   'Kelas 10',
          //                   style: TextStyle(
          //                     fontSize: 17,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Container(
          //             width: MediaQuery.of(context).size.width,
          //             height: 118,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(5),
          //               color: const Color(0xffD7E9F7),
          //             ),
          //             child: Column(
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       child: Row(
          //                         children: [
          //                           Container(
          //                             margin: const EdgeInsets.only(left: 10),
          //                             width: 40,
          //                             height: 40,
          //                             child:
          //                                 Image.asset('assets/images/man.png'),
          //                           ),
          //                           const Text(
          //                             'Putra',
          //                             style: TextStyle(fontSize: 15),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Container(
          //                       margin: const EdgeInsets.all(20),
          //                       child: Text(
          //                         snapshot.data!.docChanges[index].doc['10pa'],
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       child: Row(
          //                         children: [
          //                           Container(
          //                             margin: const EdgeInsets.only(left: 10),
          //                             width: 40,
          //                             height: 40,
          //                             child:
          //                                 Image.asset('assets/images/man.png'),
          //                           ),
          //                           const Text(
          //                             'Putri',
          //                             style: TextStyle(fontSize: 15),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Container(
          //                       margin: const EdgeInsets.all(20),
          //                       child: Text(
          //                         snapshot.data!.docChanges[index].doc['10pi'],
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(height: 20),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 margin: const EdgeInsets.all(10),
          //                 child: const Text(
          //                   'Kelas 11',
          //                   style: TextStyle(
          //                     fontSize: 17,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Container(
          //             width: MediaQuery.of(context).size.width,
          //             height: 118,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(5),
          //               color: const Color(0xffD7E9F7),
          //             ),
          //             child: Column(
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       child: Row(
          //                         children: [
          //                           Container(
          //                             margin: const EdgeInsets.only(left: 10),
          //                             width: 40,
          //                             height: 40,
          //                             child:
          //                                 Image.asset('assets/images/man.png'),
          //                           ),
          //                           const Text(
          //                             'Putra',
          //                             style: TextStyle(fontSize: 15),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Container(
          //                       margin: const EdgeInsets.all(20),
          //                       child: Text(
          //                         snapshot.data!.docChanges[index].doc['11pa'],
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       child: Row(
          //                         children: [
          //                           Container(
          //                             margin: const EdgeInsets.only(left: 10),
          //                             width: 40,
          //                             height: 40,
          //                             child:
          //                                 Image.asset('assets/images/man.png'),
          //                           ),
          //                           const Text(
          //                             'Putri',
          //                             style: TextStyle(fontSize: 15),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Container(
          //                       margin: const EdgeInsets.all(20),
          //                       child: Text(
          //                         snapshot.data!.docChanges[index].doc['11pi'],
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(height: 20),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Container(
          //                 margin: const EdgeInsets.all(10),
          //                 child: const Text(
          //                   'Kelas 12',
          //                   style: TextStyle(
          //                     fontSize: 17,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Container(
          //             width: MediaQuery.of(context).size.width,
          //             height: 118,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(5),
          //               color: const Color(0xffD7E9F7),
          //             ),
          //             child: Column(
          //               children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       child: Row(
          //                         children: [
          //                           Container(
          //                             margin: const EdgeInsets.only(left: 10),
          //                             width: 40,
          //                             height: 40,
          //                             child:
          //                                 Image.asset('assets/images/man.png'),
          //                           ),
          //                           const Text(
          //                             'Putra',
          //                             style: TextStyle(fontSize: 15),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Container(
          //                       margin: const EdgeInsets.all(20),
          //                       child: Text(
          //                         snapshot.data!.docChanges[index].doc['12pa'],
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Container(
          //                       child: Row(
          //                         children: [
          //                           Container(
          //                             margin: const EdgeInsets.only(left: 10),
          //                             width: 40,
          //                             height: 40,
          //                             child:
          //                                 Image.asset('assets/images/man.png'),
          //                           ),
          //                           const Text(
          //                             'Putri',
          //                             style: TextStyle(fontSize: 15),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     Container(
          //                       margin: const EdgeInsets.all(20),
          //                       child: Text(
          //                         snapshot.data!.docChanges[index].doc['12pi'],
          //                         style: const TextStyle(
          //                             fontWeight: FontWeight.bold,
          //                             fontSize: 15),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const SizedBox(height: 50),
          //         ],
          //       ),
          //     );
          //   },
          // );
          // return ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: snapshot.data!.docs.length,
          //     itemBuilder: (_, index) {
          //       return Padding(
          //         padding: const EdgeInsets.only(left: 35, right: 35),
          //         child: Column(
          //           children: [
          //             const SizedBox(height: 10),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   child: Text(
          //                     snapshot
          //                         .data!.docChanges[index].doc['aklFutsalPosisi'],
          //                     style: const TextStyle(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //                 Container(
          //                   child: IconButton(
          //                     onPressed: () {
          //                       Navigator.pushReplacement(
          //                           context,
          //                           MaterialPageRoute(
          //                               builder: (_) => EditPosisiAkl(
          //                                   docid: snapshot.data!.docs[index])));
          //                     },
          //                     icon: const Icon(Icons.edit, size: 22),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(11),
          //               width: MediaQuery.of(context).size.width,
          //               height: 130,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: const Color(0xffD7E9F7),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Container(
          //                         child: const Text(
          //                           'Poin :',
          //                           style: TextStyle(
          //                             fontSize: 15,
          //                           ),
          //                         ),
          //                       ),
          //                       const Text(
          //                         'mo :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Menang :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Seri :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Kalah :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Container(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Container(
          //                           child: Text(
          //                             snapshot.data!.docChanges[index]
          //                                 .doc['aklFutsalPoin'],
          //                             style: const TextStyle(
          //                               fontSize: 15,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklFutsalMain'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklFutsalMenang'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklFutsalSeri'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklFutsalKalah'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   margin: const EdgeInsets.all(10),
          //                   // padding: const EdgeInsets.symmetric(horizontal: 25),
          //                   child: Text(
          //                     snapshot
          //                         .data!.docChanges[index].doc['aklBasketPosisi'],
          //                     style: const TextStyle(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(11),
          //               width: MediaQuery.of(context).size.width,
          //               height: 130,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: const Color(0xffD7E9F7),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Container(
          //                         child: const Text(
          //                           'Poin :',
          //                           style: TextStyle(
          //                             fontSize: 15,
          //                           ),
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Main :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Menang :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Seri :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Kalah :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Container(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Container(
          //                           child: Text(
          //                             snapshot.data!.docChanges[index]
          //                                 .doc['aklBasketPoin'],
          //                             style: const TextStyle(
          //                               fontSize: 15,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBasketMain'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBasketMenang'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBasketSeri'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBasketKalah'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   margin: const EdgeInsets.all(10),
          //                   // padding: const EdgeInsets.symmetric(horizontal: 25),
          //                   child: Text(
          //                     snapshot
          //                         .data!.docChanges[index].doc['aklVoliPosisi'],
          //                     style: const TextStyle(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(11),
          //               width: MediaQuery.of(context).size.width,
          //               height: 130,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: const Color(0xffD7E9F7),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Container(
          //                         child: const Text(
          //                           'Poin :',
          //                           style: TextStyle(
          //                             fontSize: 15,
          //                           ),
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Main :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Menang :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Seri :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Kalah :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Container(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Container(
          //                           child: Text(
          //                             snapshot.data!.docChanges[index]
          //                                 .doc['aklVoliPoin'],
          //                             style: const TextStyle(
          //                               fontSize: 15,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklVoliMain'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklVoliMenang'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklVoliSeri'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklVoliKalah'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   margin: const EdgeInsets.all(10),
          //                   // padding: const EdgeInsets.symmetric(horizontal: 25),
          //                   child: Text(
          //                     snapshot
          //                         .data!.docChanges[index].doc['aklCaturPosisi'],
          //                     style: const TextStyle(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(11),
          //               width: MediaQuery.of(context).size.width,
          //               height: 130,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: const Color(0xffD7E9F7),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Container(
          //                         child: const Text(
          //                           'Poin :',
          //                           style: TextStyle(
          //                             fontSize: 15,
          //                           ),
          //                         ),
          //                       ),
          //                       const Text(
          //                         'mo :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Menang :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Seri :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Kalah :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Container(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Container(
          //                           child: Text(
          //                             snapshot.data!.docChanges[index]
          //                                 .doc['aklCaturPoin'],
          //                             style: const TextStyle(
          //                               fontSize: 15,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklCaturMain'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklCaturMenang'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklCaturSeri'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklCaturKalah'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   margin: const EdgeInsets.all(10),
          //                   // padding: const EdgeInsets.symmetric(horizontal: 25),
          //                   child: Text(
          //                     snapshot.data!.docChanges[index]
          //                         .doc['aklBulutangkisPosisi'],
          //                     style: const TextStyle(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(11),
          //               width: MediaQuery.of(context).size.width,
          //               height: 130,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: const Color(0xffD7E9F7),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Container(
          //                         child: const Text(
          //                           'Poin :',
          //                           style: TextStyle(
          //                             fontSize: 15,
          //                           ),
          //                         ),
          //                       ),
          //                       const Text(
          //                         'mo :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Menang :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Seri :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Kalah :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Container(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Container(
          //                           child: Text(
          //                             snapshot.data!.docChanges[index]
          //                                 .doc['aklBulutangkisPoin'],
          //                             style: const TextStyle(
          //                               fontSize: 15,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBulutangkisMain'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBulutangkisMenang'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBulutangkisSeri'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklBulutangkisKalah'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   margin: const EdgeInsets.all(10),
          //                   // padding: const EdgeInsets.symmetric(horizontal: 25),
          //                   child: Text(
          //                     snapshot.data!.docChanges[index]
          //                         .doc['aklTenismejaPosisi'],
          //                     style: const TextStyle(
          //                       fontSize: 17,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Container(
          //               padding: const EdgeInsets.all(11),
          //               width: MediaQuery.of(context).size.width,
          //               height: 130,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(5),
          //                 color: const Color(0xffD7E9F7),
          //               ),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Column(
          //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Container(
          //                         child: const Text(
          //                           'Poin :',
          //                           style: TextStyle(
          //                             fontSize: 15,
          //                           ),
          //                         ),
          //                       ),
          //                       const Text(
          //                         'mo :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Menang :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Seri :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                       const Text(
          //                         'Kalah :',
          //                         style: TextStyle(
          //                           fontSize: 15,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                   Container(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.end,
          //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Container(
          //                           child: Text(
          //                             snapshot.data!.docChanges[index]
          //                                 .doc['aklTenismejaPoin'],
          //                             style: const TextStyle(
          //                               fontSize: 15,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklTenismejaMain'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklTenismejaMenang'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklTenismejaSeri'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                         Text(
          //                           snapshot.data!.docChanges[index]
          //                               .doc['aklTenismejaKalah'],
          //                           style: const TextStyle(
          //                             fontSize: 15,
          //                             fontWeight: FontWeight.bold,
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //             const SizedBox(height: 20),

          //             // /batas
          //             // Container(
          //             //   padding: const EdgeInsets.all(11),
          //             //   width: 343,
          //             //   height: 118,
          //             //   decoration: BoxDecoration(
          //             //     borderRadius: BorderRadius.circular(5),
          //             //     color: const Color(0xffD7E9F7),
          //             //   ),
          //             //   child: Text(
          //             //     snapshot
          //             //         .data!.docChanges[index].doc['basketPosisiKe'],
          //             //     style: const TextStyle(
          //             //       fontSize: 15,
          //             //     ),
          //             //   ),
          //             // ),
          //             // const SizedBox(height: 10),
          //             // Row(
          //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             //   children: [
          //             //     Container(
          //             //       margin: const EdgeInsets.all(10),
          //             //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //             //       child: const Text(
          //             //         'Voli : Posisi Ke-10',
          //             //         style: TextStyle(
          //             //           fontSize: 17,
          //             //           fontWeight: FontWeight.bold,
          //             //         ),
          //             //       ),
          //             //     ),
          //             //   ],
          //             // ),
          //             // Container(
          //             //   padding: const EdgeInsets.all(11),
          //             //   width: 343,
          //             //   height: 130,
          //             //   decoration: BoxDecoration(
          //             //     borderRadius: BorderRadius.circular(5),
          //             //     color: const Color(0xffD7E9F7),
          //             //   ),
          //             //   child: Text(
          //             //     snapshot.data!.docChanges[index].doc['voliPosisiKe'],
          //             //     style: const TextStyle(
          //             //       fontSize: 15,
          //             //     ),
          //             //   ),
          //             // ),
          //             // const SizedBox(height: 10),
          //             // Row(
          //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             //   children: [
          //             //     Container(
          //             //       margin: const EdgeInsets.all(10),
          //             //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //             //       child: const Text(
          //             //         'Catur : Posisi Ke-10',
          //             //         style: TextStyle(
          //             //           fontSize: 17,
          //             //           fontWeight: FontWeight.bold,
          //             //         ),
          //             //       ),
          //             //     ),
          //             //   ],
          //             // ),
          //             // Container(
          //             //   padding: const EdgeInsets.all(11),
          //             //   width: 343,
          //             //   height: 130,
          //             //   decoration: BoxDecoration(
          //             //     borderRadius: BorderRadius.circular(5),
          //             //     color: const Color(0xffD7E9F7),
          //             //   ),
          //             //   child: Text(
          //             //     snapshot.data!.docChanges[index].doc['caturPosisiKe'],
          //             //     style: const TextStyle(
          //             //       fontSize: 15,
          //             //     ),
          //             //   ),
          //             // ),
          //             // const SizedBox(height: 10),
          //             // Row(
          //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             //   children: [
          //             //     Container(
          //             //       margin: const EdgeInsets.all(10),
          //             //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //             //       child: const Text(
          //             //         'Bulutangkis : Posisi Ke-10',
          //             //         style: TextStyle(
          //             //           fontSize: 17,
          //             //           fontWeight: FontWeight.bold,
          //             //         ),
          //             //       ),
          //             //     ),
          //             //   ],
          //             // ),
          //             // Container(
          //             //   padding: const EdgeInsets.all(11),
          //             //   width: 343,
          //             //   height: 130,
          //             //   decoration: BoxDecoration(
          //             //     borderRadius: BorderRadius.circular(5),
          //             //     color: const Color(0xffD7E9F7),
          //             //   ),
          //             //   child: Text(
          //             //     snapshot.data!.docChanges[index]
          //             //         .doc['bulutangkisPosisiKe'],
          //             //     style: const TextStyle(
          //             //       fontSize: 15,
          //             //     ),
          //             //   ),
          //             // ),
          //             // const SizedBox(height: 10),
          //             // Row(
          //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             //   children: [
          //             //     Container(
          //             //       margin: const EdgeInsets.all(10),
          //             //       padding: const EdgeInsets.symmetric(horizontal: 25),
          //             //       child: const Text(
          //             //         'Tenis Meja : Posisi Ke-10',
          //             //         style: TextStyle(
          //             //           fontSize: 17,
          //             //           fontWeight: FontWeight.bold,
          //             //         ),
          //             //       ),
          //             //     ),
          //             //   ],
          //             // ),
          //             // Container(
          //             //   padding: const EdgeInsets.all(11),
          //             //   width: 343,
          //             //   height: 130,
          //             //   decoration: BoxDecoration(
          //             //     borderRadius: BorderRadius.circular(5),
          //             //     color: const Color(0xffD7E9F7),
          //             //   ),
          //             //   child: Text(
          //             //     snapshot
          //             //         .data!.docChanges[index].doc['tenismejaPosisiKe'],
          //             //     style: const TextStyle(
          //             //       fontSize: 15,
          //             //     ),
          //             //   ),
          //             // ),
          //             const SizedBox(height: 10),
          //           ],
          //         ),
          //       );
          //     });
        },
      ),
    );
  }
}












// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'package:akhir/edit_posisi.dart';
// import 'package:akhir/klasemen_basket.dart';
// import 'package:akhir/klasemen_bulutangkis.dart';
// import 'package:akhir/klasemen_catur.dart';
// import 'package:akhir/klasemen_futsal.dart';

// import 'package:akhir/klasemen_pake_appbar.dart';
// import 'package:akhir/klasemen_tenismeja.dart';
// import 'package:akhir/klasemen_voli.dart';
// import 'package:akhir/page_belum_diatur.dart';

// import 'package:flutter/material.dart';

// class PosisiAkl extends StatelessWidget {
//   const PosisiAkl({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               Container(
//                 width: 343,
//                 height: 30,
//                 color: Colors.transparent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Container(
//                       child: IconButton(
//                         onPressed: () => {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => (const EditPosisi())))
//                         },
//                         icon: const Icon(Icons.edit, size: 22),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              // Container(
              //   width: 343,
              //   height: 50,
              //   color: Colors.transparent,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         child: Text(
              //           ' Futsal : Posisi Ke-19',
              //           style: TextStyle(
              //             fontSize: 17,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),

              //       TextButton(
              //           onPressed: () => {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => const KlasemenFutsalNoAppbar(),
              //                   ),
              //                 ),
              //               },
              //           child: const Text(
              //             'Lihat detail',
              //             style: TextStyle(color: Colors.grey, fontSize: 15),
              //           )),
              //       // Container(
              //       //   margin: const EdgeInsets.only(right: 25),
              //       //   child: IconButton(
              //       //     onPressed: () => {
              //       //       Navigator.push(
              //       //           context,
              //       //           MaterialPageRoute(
              //       //               builder: (context) => (const EditPosisiAKL())))
              //       //     },
              //       //     icon: const Icon(Icons.edit, size: 22),
              //       //   ),
              //       // ),
              //     ],
              //   ),
              // ),
//               Container(
//                   padding: EdgeInsets.all(15),
//                   width: 343,
//                   height: 130,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: const Color(0xffD7E9F7),
//                   ),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Column(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Container(
                  //           child: Text(
                  //             'Poin :',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //             ),
                  //           ),
                  //         ),
                  //         Text(
                  //           'mo :',
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //           ),
                  //         ),
                  //         Text(
                  //           'Menang :',
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //           ),
                  //         ),
                  //         Text(
                  //           'Seri :',
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //           ),
                  //         ),
                  //         Text(
                  //           'Kalah :',
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Container(
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           Container(
                  //             child: Text(
                  //               '9',
                  //               style: TextStyle(
                  //                 fontSize: 15,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //           Text(
                  //             '3',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           Text(
                  //             '2',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           Text(
                  //             '-',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           Text(
                  //             '1',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // )),
//               const SizedBox(height: 20),
//               Container(
//                 width: 343,
//                 height: 50,
//                 color: Colors.transparent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         ' Basket : Posisi Ke-7',
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                     TextButton(
//                         onPressed: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const KlasemenBasket(),
//                                 ),
//                               ),
//                             },
//                         child: const Text(
//                           'Lihat detail',
//                           style: TextStyle(color: Colors.grey, fontSize: 15),
//                         )),
//                     // Container(
//                     //   margin: const EdgeInsets.only(right: 25),
//                     //   child: IconButton(
//                     //     onPressed: () => {
//                     //       Navigator.push(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => (const EditPosisiAKL())))
//                     //     },
//                     //     icon: const Icon(Icons.edit, size: 22),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
              // Container(
              //     padding: EdgeInsets.all(15),
              //     width: 343,
              //     height: 130,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       color: const Color(0xffD7E9F7),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               child: Text(
              //                 'Poin :',
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                 ),
              //               ),
              //             ),
              //             Text(
              //               'Main :',
              //               style: TextStyle(
              //                 fontSize: 15,
              //               ),
              //             ),
              //             Text(
              //               'Menang :',
              //               style: TextStyle(
              //                 fontSize: 15,
              //               ),
              //             ),
              //             Text(
              //               'Seri :',
              //               style: TextStyle(
              //                 fontSize: 15,
              //               ),
              //             ),
              //             Text(
              //               'Kalah :',
              //               style: TextStyle(
              //                 fontSize: 15,
              //               ),
              //             ),
              //           ],
              //         ),
              //         Container(
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Container(
              //                 child: Text(
              //                   '9',
              //                   style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //               ),
              //               Text(
              //                 '3',
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               Text(
              //                 '2',
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               Text(
              //                 '-',
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //               Text(
              //                 '1',
              //                 style: TextStyle(
              //                   fontSize: 15,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ],
              //     )),
//               const SizedBox(height: 20),
//               Container(
//                 width: 343,
//                 height: 50,
//                 color: Colors.transparent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         ' Voli : Posisi Ke-9',
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                     TextButton(
//                         onPressed: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const KlasemenVoli(),
//                                 ),
//                               ),
//                             },
//                         child: const Text(
//                           'Lihat detail',
//                           style: TextStyle(color: Colors.grey, fontSize: 15),
//                         )),
//                     // Container(
//                     //   margin: const EdgeInsets.only(right: 25),
//                     //   child: IconButton(
//                     //     onPressed: () => {
//                     //       Navigator.push(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => (const EditPosisiAKL())))
//                     //     },
//                     //     icon: const Icon(Icons.edit, size: 22),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.all(15),
//                   width: 343,
//                   height: 130,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: const Color(0xffD7E9F7),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Text(
//                               'Poin :',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Main :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Menang :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Seri :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Kalah :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               child: Text(
//                                 '9',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               '3',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '2',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '-',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '1',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//               SizedBox(height: 20),
//               Container(
//                 width: 343,
//                 height: 50,
//                 color: Colors.transparent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         ' Catur : Posisi Ke-3',
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                     TextButton(
//                         onPressed: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const KlasemenCatur(),
//                                 ),
//                               ),
//                             },
//                         child: const Text(
//                           'Lihat detail',
//                           style: TextStyle(color: Colors.grey, fontSize: 15),
//                         )),
//                     // Container(
//                     //   margin: const EdgeInsets.only(right: 25),
//                     //   child: IconButton(
//                     //     onPressed: () => {
//                     //       Navigator.push(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => (const EditPosisiAKL())))
//                     //     },
//                     //     icon: const Icon(Icons.edit, size: 22),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.all(15),
//                   width: 343,
//                   height: 130,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: const Color(0xffD7E9F7),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Text(
//                               'Poin :',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Main :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Menang :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Seri :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Kalah :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               child: Text(
//                                 '9',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               '3',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '2',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '-',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '1',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//               SizedBox(height: 20),
//               Container(
//                 width: 343,
//                 height: 50,
//                 color: Colors.transparent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         ' Bulutangkis : Posisi Ke-7',
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                     TextButton(
//                         onPressed: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       const KlasemenBulutangkis(),
//                                 ),
//                               ),
//                             },
//                         child: const Text(
//                           'Lihat detail',
//                           style: TextStyle(color: Colors.grey, fontSize: 15),
//                         )),
//                     // Container(
//                     //   margin: const EdgeInsets.only(right: 25),
//                     //   child: IconButton(
//                     //     onPressed: () => {
//                     //       Navigator.push(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => (const EditPosisiAKL())))
//                     //     },
//                     //     icon: const Icon(Icons.edit, size: 22),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.all(15),
//                   width: 343,
//                   height: 130,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: const Color(0xffD7E9F7),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Text(
//                               'Poin :',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Main :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Menang :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Seri :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Kalah :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               child: Text(
//                                 '9',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               '3',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '2',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '-',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '1',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//               SizedBox(height: 20),
//               Container(
//                 width: 343,
//                 height: 50,
//                 color: Colors.transparent,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       child: Text(
//                         ' Tenis Meja : Posisi Ke-7',
//                         style: TextStyle(
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                     TextButton(
//                         onPressed: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       const KlasemenTenismeja(),
//                                 ),
//                               ),
//                             },
//                         child: const Text(
//                           'Lihat detail',
//                           style: TextStyle(color: Colors.grey, fontSize: 15),
//                         )),
//                     // Container(
//                     //   margin: const EdgeInsets.only(right: 25),
//                     //   child: IconButton(
//                     //     onPressed: () => {
//                     //       Navigator.push(
//                     //           context,
//                     //           MaterialPageRoute(
//                     //               builder: (context) => (const EditPosisiAKL())))
//                     //     },
//                     //     icon: const Icon(Icons.edit, size: 22),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.all(15),
//                   width: 343,
//                   height: 130,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: const Color(0xffD7E9F7),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             child: Text(
//                               'Poin :',
//                               style: TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                           Text(
//                             'Main :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Menang :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Seri :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'Kalah :',
//                             style: TextStyle(
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Container(
//                               child: Text(
//                                 '9',
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               '3',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '2',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '-',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               '1',
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//               SizedBox(height: 20),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
