// ignore_for_file: avoid_unnecessary_containers, unnecessary_const

import 'package:akhir/X_KEPAKE%20NANTI/edit_pertandingan.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AKLPertandinganBasket extends StatefulWidget {
  final DocumentSnapshot? dataJurusan;

  AKLPertandinganBasket({Key? key, this.dataJurusan}) : super(key: key);

  @override
  State<AKLPertandinganBasket> createState() => _AKLPertandinganBasketState();
}

class _AKLPertandinganBasketState extends State<AKLPertandinganBasket> {
  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('matchData').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('matchData')
              // .where('kelasPemain',
              //     isEqualTo: widget.dataJurusan!.get('identifierJurusan'))
              .snapshots(),

          //  _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          // color: AppColors.hijau,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FormPertandingann(
                                    docid: snapshot.data!.docs[index],
                                  ),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 15,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        "Sabtu, 13 Juni 2022",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      // IconButton(
                                      //   onPressed: () {},
                                      //   icon: Icon(Icons.edit),
                                      //   iconSize: 22,
                                      //   padding: EdgeInsets.zero,
                                      //   constraints: BoxConstraints(),
                                      // ),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  flex: 10,
                                  child: SizedBox(height: 10),
                                ),
                                Expanded(
                                  flex: 75,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xffD7E9F7),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                flex: 85,
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 20,
                                                        child: SizedBox(
                                                          width: 45,
                                                          height: 45,
                                                          child: Image.asset(
                                                              'assets/images/AKL.png'),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        flex: 80,
                                                        child: Text(
                                                          (snapshot.data!.docs[
                                                                      index]
                                                                  ['futsal']
                                                              ['tim1']),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 15,
                                                child: Text(
                                                  (snapshot.data!.docs[index]
                                                      ['futsal']['skor1']),
                                                  textAlign: TextAlign.end,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 50,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                flex: 85,
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 20,
                                                        child: SizedBox(
                                                          width: 45,
                                                          height: 45,
                                                          child: Image.asset(
                                                              'assets/images/OKTP.png'),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Expanded(
                                                        flex: 85,
                                                        child: Text(
                                                          (snapshot.data!.docs[
                                                                      index]
                                                                  ['futsal']
                                                              ['tim2']),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 10,
                                                child: Text(
                                                  (snapshot.data!.docs[index]
                                                      ['futsal']['skor2']),
                                                  textAlign: TextAlign.end,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),

      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance
      //       .collection('aboutDatas')
      //       .where('kelasPemain',
      //           isEqualTo: widget.dataJurusan!.get('identifierJurusan'))
      //       .snapshots(),
      // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //   if (snapshot.hasError) {
      //     return const Text("Tunggu sebentar, ada yang salah");
      //   }
      //   if (snapshot.connectionState == ConnectionState.waiting) {
      //     return const Center(
      //       child: CircularProgressIndicator(
      //         color: Color(0xff142D4C),
      //       ),
      //     );
      //   }

      //     return ListView.builder(
      //       shrinkWrap: true,
      //       itemCount: snapshot.data!.docs.length,
      //       itemBuilder: (_, index) {
      //         return Padding(
      //           padding: const EdgeInsets.only(left: 35, right: 35),
      //           child: Column(
      //             children: [
      //               const SizedBox(height: 10),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Container(
      //                     margin: const EdgeInsets.all(10),
      //                     child: const Text(
      //                       'Tentang jurusan',
      //                       style: TextStyle(
      //                         fontSize: 17,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                   Container(
      //                     child: IconButton(
      //                       onPressed: () {
      //                         Navigator.push(
      //                             context,
      //                             MaterialPageRoute(
      //                                 builder: (_) => edittentangakl(
      //                                     docid: snapshot.data!.docs[index])));
      //                       },
      //                       icon: const Icon(Icons.edit, size: 22),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Container(
      //                 padding: const EdgeInsets.all(11),
      //                 width: MediaQuery.of(context).size.width,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5),
      //                   color: const Color(0xffD7E9F7),
      //                 ),
      //                 child: Expanded(
      //                   child: Text(
      //                     snapshot
      //                         .data!.docChanges[index].doc['tentangJurusan'],
      //                     style: const TextStyle(
      //                       fontSize: 15,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(height: 20),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Row(
      //                     children: [
      //                       Container(
      //                         margin: const EdgeInsets.all(10),
      //                         child: const Text(
      //                           'Kejuaraan yang pernah diraih',
      //                           style: TextStyle(
      //                             fontSize: 17,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //               Container(
      //                 padding: const EdgeInsets.all(11),
      //                 width: MediaQuery.of(context).size.width,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5),
      //                   color: const Color(0xffD7E9F7),
      //                 ),
      //                 child: Expanded(
      //                   child: Text(
      //                     snapshot.data!.docs[index]
      //                         ['kejuaraanYangPernahDiraih'],
      //                     style: const TextStyle(
      //                       fontSize: 15,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const SizedBox(height: 20),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Container(
      //                     margin: const EdgeInsets.all(10),
      //                     child: const Text(
      //                       'Kelas 10',
      //                       style: TextStyle(
      //                         fontSize: 17,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 height: 118,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5),
      //                   color: const Color(0xffD7E9F7),
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(
      //                           child: Row(
      //                             children: [
      //                               Container(
      //                                 margin: const EdgeInsets.only(left: 10),
      //                                 width: 40,
      //                                 height: 40,
      //                                 child:
      //                                     Image.asset('assets/images/man.png'),
      //                               ),
      //                               const Text(
      //                                 'Putra',
      //                                 style: TextStyle(fontSize: 15),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                           margin: const EdgeInsets.all(20),
      //                           child: Text(
      //                             snapshot.data!.docChanges[index].doc['10pa'],
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(
      //                           child: Row(
      //                             children: [
      //                               Container(
      //                                 margin: const EdgeInsets.only(left: 10),
      //                                 width: 40,
      //                                 height: 40,
      //                                 child:
      //                                     Image.asset('assets/images/man.png'),
      //                               ),
      //                               const Text(
      //                                 'Putri',
      //                                 style: TextStyle(fontSize: 15),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                           margin: const EdgeInsets.all(20),
      //                           child: Text(
      //                             snapshot.data!.docChanges[index].doc['10pi'],
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(height: 20),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Container(
      //                     margin: const EdgeInsets.all(10),
      //                     child: const Text(
      //                       'Kelas 11',
      //                       style: TextStyle(
      //                         fontSize: 17,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 height: 118,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5),
      //                   color: const Color(0xffD7E9F7),
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(
      //                           child: Row(
      //                             children: [
      //                               Container(
      //                                 margin: const EdgeInsets.only(left: 10),
      //                                 width: 40,
      //                                 height: 40,
      //                                 child:
      //                                     Image.asset('assets/images/man.png'),
      //                               ),
      //                               const Text(
      //                                 'Putra',
      //                                 style: TextStyle(fontSize: 15),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                           margin: const EdgeInsets.all(20),
      //                           child: Text(
      //                             snapshot.data!.docChanges[index].doc['11pa'],
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(
      //                           child: Row(
      //                             children: [
      //                               Container(
      //                                 margin: const EdgeInsets.only(left: 10),
      //                                 width: 40,
      //                                 height: 40,
      //                                 child:
      //                                     Image.asset('assets/images/man.png'),
      //                               ),
      //                               const Text(
      //                                 'Putri',
      //                                 style: TextStyle(fontSize: 15),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                           margin: const EdgeInsets.all(20),
      //                           child: Text(
      //                             snapshot.data!.docChanges[index].doc['11pi'],
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(height: 20),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Container(
      //                     margin: const EdgeInsets.all(10),
      //                     child: const Text(
      //                       'Kelas 12',
      //                       style: TextStyle(
      //                         fontSize: 17,
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Container(
      //                 width: MediaQuery.of(context).size.width,
      //                 height: 118,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(5),
      //                   color: const Color(0xffD7E9F7),
      //                 ),
      //                 child: Column(
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(
      //                           child: Row(
      //                             children: [
      //                               Container(
      //                                 margin: const EdgeInsets.only(left: 10),
      //                                 width: 40,
      //                                 height: 40,
      //                                 child:
      //                                     Image.asset('assets/images/man.png'),
      //                               ),
      //                               const Text(
      //                                 'Putra',
      //                                 style: TextStyle(fontSize: 15),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                           margin: const EdgeInsets.all(20),
      //                           child: Text(
      //                             snapshot.data!.docChanges[index].doc['12pa'],
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         Container(
      //                           child: Row(
      //                             children: [
      //                               Container(
      //                                 margin: const EdgeInsets.only(left: 10),
      //                                 width: 40,
      //                                 height: 40,
      //                                 child:
      //                                     Image.asset('assets/images/man.png'),
      //                               ),
      //                               const Text(
      //                                 'Putri',
      //                                 style: TextStyle(fontSize: 15),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                         Container(
      //                           margin: const EdgeInsets.all(20),
      //                           child: Text(
      //                             snapshot.data!.docChanges[index].doc['12pi'],
      //                             style: const TextStyle(
      //                                 fontWeight: FontWeight.bold,
      //                                 fontSize: 15),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //               const SizedBox(height: 50),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}




// ListView(
//                           children: [
//                             Column(
//                               children: [
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.all(10),
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 25),
//                                       child: const Text(
//                                         'Tentang jurusan',
//                                         style: TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
                                    // Container(
                                    //   margin: const EdgeInsets.only(right: 25),
                                    //   child: IconButton(
                                    //     onPressed: () {
                                    //       Navigator.pushReplacement(
                                    //           context,
                                    //           MaterialPageRoute(
                                    //               builder: (_) => addnote()));
                                    //     },
                                    //     icon: const Icon(Icons.edit, size: 22),
                                    //   ),
                                    // ),
//                                   ],
//                                 ),
//                                 Container(
//                                   width: 343,
//                                   height: 130,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: const Color(0xffD7E9F7),
//                                   ),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(10),
//                                     child: Text(
//                                       snapshot.data!.docChanges[index]
//                                           .doc['tentangJurusan'],
//                                       style: TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.all(10),
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 25),
//                                       child: const Text(
//                                         'Kejuaraan yang pernah diraih',
//                                         style: TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   width: 343,
//                                   height: 95,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: const Color(0xffD7E9F7),
//                                   ),
//                                   child: Container(
//                                       padding: const EdgeInsets.all(10),
//                                       child: Text(
                                        // snapshot.data!.docChanges[index]
                                        //     .doc['kejuaraanYangPernahDiraih'],
//                                         style: TextStyle(
//                                           fontSize: 15,
//                                         ),
//                                       )),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.all(10),
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 25),
//                                       child: const Text(
//                                         'Kelas 10',
//                                         style: TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
                                // Container(
                                //   width: 343,
                                //   height: 118,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(5),
                                //     color: const Color(0xffD7E9F7),
                                //   ),
                                //   child: Column(
                                //     children: [
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   margin: const EdgeInsets.only(
                                //                       left: 10),
                                //                   width: 40,
                                //                   height: 40,
                                //                   child: Image.asset(
                                //                       'assets/images/man.png'),
                                //                 ),
                                //                 const Text(
                                //                   'Putra',
                                //                   style:
                                //                       TextStyle(fontSize: 15),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: const EdgeInsets.all(20),
                                //             child: Text(
                                //               snapshot.data!.docChanges[index]
                                //                   .doc['10pa'],
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.bold,
                                //                   fontSize: 15),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.spaceBetween,
                                //         children: [
                                //           Container(
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   margin: const EdgeInsets.only(
                                //                       left: 10),
                                //                   width: 40,
                                //                   height: 40,
                                //                   child: Image.asset(
                                //                       'assets/images/man.png'),
                                //                 ),
                                //                 const Text(
                                //                   'Putri',
                                //                   style:
                                //                       TextStyle(fontSize: 15),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //           Container(
                                //             margin: const EdgeInsets.all(20),
                                //             child: Text(
                                //               snapshot.data!.docChanges[index]
                                //                   .doc['10pi'],
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.bold,
                                //                   fontSize: 15),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // const SizedBox(height: 20),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.all(10),
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 25),
//                                       child: const Text(
//                                         'Kelas 11',
//                                         style: TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   width: 343,
//                                   height: 118,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: const Color(0xffD7E9F7),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             child: Row(
//                                               children: [
//                                                 Container(
//                                                   margin: const EdgeInsets.only(
//                                                       left: 10),
//                                                   width: 40,
//                                                   height: 40,
//                                                   child: Image.asset(
//                                                       'assets/images/man.png'),
//                                                 ),
//                                                 const Text(
//                                                   'Putra',
//                                                   style:
//                                                       TextStyle(fontSize: 15),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.all(20),
//                                             child: const Text(
//                                               '32',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             child: Row(
//                                               children: [
//                                                 Container(
//                                                   margin: const EdgeInsets.only(
//                                                       left: 10),
//                                                   width: 40,
//                                                   height: 40,
//                                                   child: Image.asset(
//                                                       'assets/images/man.png'),
//                                                 ),
//                                                 const Text(
//                                                   'Putri',
//                                                   style:
//                                                       TextStyle(fontSize: 15),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.all(20),
//                                             child: const Text(
//                                               '18',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.all(10),
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 25),
//                                       child: const Text(
//                                         'Kelas 12',
//                                         style: TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   width: 343,
//                                   height: 118,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: const Color(0xffD7E9F7),
//                                   ),
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             child: Row(
//                                               children: [
//                                                 Container(
//                                                   margin: const EdgeInsets.only(
//                                                       left: 10),
//                                                   width: 40,
//                                                   height: 40,
//                                                   child: Image.asset(
//                                                       'assets/images/man.png'),
//                                                 ),
//                                                 const Text(
//                                                   'Putra',
//                                                   style:
//                                                       TextStyle(fontSize: 15),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.all(20),
//                                             child: const Text(
//                                               '32',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Container(
//                                             child: Row(
//                                               children: [
//                                                 Container(
//                                                   margin: const EdgeInsets.only(
//                                                       left: 10),
//                                                   width: 40,
//                                                   height: 40,
//                                                   child: Image.asset(
//                                                       'assets/images/man.png'),
//                                                 ),
//                                                 const Text(
//                                                   'Putri',
//                                                   style:
//                                                       TextStyle(fontSize: 15),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Container(
//                                             margin: const EdgeInsets.all(20),
//                                             child: const Text(
//                                               '18',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 15),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(height: 50),
//                               ],
//                             ),
//                           ],
//                         ),




// // ignore_for_file: avoid_unnecessary_containers

// import 'package:flutter/material.dart';

// import 'package:akhir/edit_tentang_akl.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class AKLPertandinganBaket extends StatefulWidget {
//   final DocumentSnapshot? dataJurusan;
//   const AKLPertandinganBaket({Key? key, this.dataJurusan}) : super(key: key);

//   @override
//   State<AKLPertandinganBaket> createState() => _AKLPertandinganBaketState();
// }

// class _AKLPertandinganBaketState extends State<AKLPertandinganBaket> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('matchData')
//             .where('kelasPemain',
//                 isEqualTo: widget.dataJurusan!.get('identifierJurusan'))
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Tunggu sebentar, ada yang salah");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xff142D4C),
//               ),
//             );
//           }

//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (_, index) {
//               return Padding(
//                 padding: const EdgeInsets.only(left: 35, right: 35),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.all(10),
//                           child: const Text(
//                             'Tentang jurusan',
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => edittentangakl(
//                                           docid: snapshot.data!.docs[index])));
//                             },
//                             icon: const Icon(Icons.edit, size: 22),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(11),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: const Color(0xffD7E9F7),
//                       ),
//                       child: Expanded(
//                         child: Text(
//                           snapshot.data!.docs[index]['futsal']['tim1'],
//                           style: const TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.all(10),
//                               child: const Text(
//                                 'Kejuaraan yang pernah diraih',
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(11),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: const Color(0xffD7E9F7),
//                       ),
//                       child: Expanded(
//                         child: Text(
//                           snapshot.data!.docs[index]['futsal']['tim2'],
//                           style: const TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.all(10),
//                           child: const Text(
//                             'Kelas 10',
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 118,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: const Color(0xffD7E9F7),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.only(left: 10),
//                                       width: 40,
//                                       height: 40,
//                                       child:
//                                           Image.asset('assets/images/man.png'),
//                                     ),
//                                     const Text(
//                                       'Putra',
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.all(20),
//                                 child: Text(
//                                   snapshot.data!.docs[index]['futsal']['poin1'],
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.only(left: 10),
//                                       width: 40,
//                                       height: 40,
//                                       child:
//                                           Image.asset('assets/images/man.png'),
//                                     ),
//                                     const Text(
//                                       'Putri',
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.all(20),
//                                 child: Text(
//                                   snapshot.data!.docs[index]['futsal']['poin2'],
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           margin: const EdgeInsets.all(10),
//                           child: const Text(
//                             'Kelas 11',
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 118,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: const Color(0xffD7E9F7),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.only(left: 10),
//                                       width: 40,
//                                       height: 40,
//                                       child:
//                                           Image.asset('assets/images/man.png'),
//                                     ),
//                                     const Text(
//                                       'Putra',
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.all(20),
//                                 child: Text(
//                                   snapshot.data!.docs[index]['futsal']['tim1'],
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       margin: const EdgeInsets.only(left: 10),
//                                       width: 40,
//                                       height: 40,
//                                       child:
//                                           Image.asset('assets/images/man.png'),
//                                     ),
//                                     const Text(
//                                       'Putri',
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.all(20),
//                                 child: Text(
//                                   snapshot.data!.docs[index]['futsal']['tim2'],
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //   children: [
//                     //     Container(
//                     //       margin: const EdgeInsets.all(10),
//                     //       child: const Text(
//                     //         'Kelas 12',
//                     //         style: TextStyle(
//                     //           fontSize: 17,
//                     //           fontWeight: FontWeight.bold,
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // Container(
//                     //   width: MediaQuery.of(context).size.width,
//                     //   height: 118,
//                     //   decoration: BoxDecoration(
//                     //     borderRadius: BorderRadius.circular(5),
//                     //     color: const Color(0xffD7E9F7),
//                     //   ),
//                     //   child: Column(
//                     //     children: [
//                     //       Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Container(
//                     //             child: Row(
//                     //               children: [
//                     //                 Container(
//                     //                   margin: const EdgeInsets.only(left: 10),
//                     //                   width: 40,
//                     //                   height: 40,
//                     //                   child:
//                     //                       Image.asset('assets/images/man.png'),
//                     //                 ),
//                     //                 const Text(
//                     //                   'Putra',
//                     //                   style: TextStyle(fontSize: 15),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //           ),
//                     //           Container(
//                     //             margin: const EdgeInsets.all(20),
//                     //             child: Text(
//                     //               snapshot.data!.docChanges[index].doc['12pa'],
//                     //               style: const TextStyle(
//                     //                   fontWeight: FontWeight.bold,
//                     //                   fontSize: 15),
//                     //             ),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //       Row(
//                     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //         children: [
//                     //           Container(
//                     //             child: Row(
//                     //               children: [
//                     //                 Container(
//                     //                   margin: const EdgeInsets.only(left: 10),
//                     //                   width: 40,
//                     //                   height: 40,
//                     //                   child:
//                     //                       Image.asset('assets/images/man.png'),
//                     //                 ),
//                     //                 const Text(
//                     //                   'Putri',
//                     //                   style: TextStyle(fontSize: 15),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //           ),
//                     //           Container(
//                     //             margin: const EdgeInsets.all(20),
//                     //             child: Text(
//                     //               snapshot.data!.docChanges[index].doc['12pi'],
//                     //               style: const TextStyle(
//                     //                   fontWeight: FontWeight.bold,
//                     //                   fontSize: 15),
//                     //             ),
//                     //           ),
//                     //         ],
//                     //       ),
//                     //   ],
//                     // ),
//                     // ),
//                     const SizedBox(height: 50),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }




// // ListView(
// //                           children: [
// //                             Column(
// //                               children: [
// //                                 const SizedBox(height: 10),
// //                                 Row(
// //                                   mainAxisAlignment:
// //                                       MainAxisAlignment.spaceBetween,
// //                                   children: [
// //                                     Container(
// //                                       margin: const EdgeInsets.all(10),
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 25),
// //                                       child: const Text(
// //                                         'Tentang jurusan',
// //                                         style: TextStyle(
// //                                           fontSize: 17,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ),
//                                     // Container(
//                                     //   margin: const EdgeInsets.only(right: 25),
//                                     //   child: IconButton(
//                                     //     onPressed: () {
//                                     //       Navigator.pushReplacement(
//                                     //           context,
//                                     //           MaterialPageRoute(
//                                     //               builder: (_) => addnote()));
//                                     //     },
//                                     //     icon: const Icon(Icons.edit, size: 22),
//                                     //   ),
//                                     // ),
// //                                   ],
// //                                 ),
// //                                 Container(
// //                                   width: 343,
// //                                   height: 130,
// //                                   decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(5),
// //                                     color: const Color(0xffD7E9F7),
// //                                   ),
// //                                   child: Container(
// //                                     padding: const EdgeInsets.all(10),
// //                                     child: Text(
// //                                       snapshot.data!.docChanges[index]
// //                                           .doc['tentangJurusan'],
// //                                       style: TextStyle(
// //                                         fontSize: 15,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                                 const SizedBox(height: 10),
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   children: [
// //                                     Container(
// //                                       margin: const EdgeInsets.all(10),
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 25),
// //                                       child: const Text(
// //                                         'Kejuaraan yang pernah diraih',
// //                                         style: TextStyle(
// //                                           fontSize: 17,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 Container(
// //                                   width: 343,
// //                                   height: 95,
// //                                   decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(5),
// //                                     color: const Color(0xffD7E9F7),
// //                                   ),
// //                                   child: Container(
// //                                       padding: const EdgeInsets.all(10),
// //                                       child: Text(
//                                         // snapshot.data!.docChanges[index]
//                                         //     .doc['kejuaraanYangPernahDiraih'],
// //                                         style: TextStyle(
// //                                           fontSize: 15,
// //                                         ),
// //                                       )),
// //                                 ),
// //                                 const SizedBox(height: 10),
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   children: [
// //                                     Container(
// //                                       margin: const EdgeInsets.all(10),
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 25),
// //                                       child: const Text(
// //                                         'Kelas 10',
// //                                         style: TextStyle(
// //                                           fontSize: 17,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
//                                 // Container(
//                                 //   width: 343,
//                                 //   height: 118,
//                                 //   decoration: BoxDecoration(
//                                 //     borderRadius: BorderRadius.circular(5),
//                                 //     color: const Color(0xffD7E9F7),
//                                 //   ),
//                                 //   child: Column(
//                                 //     children: [
//                                 //       Row(
//                                 //         mainAxisAlignment:
//                                 //             MainAxisAlignment.spaceBetween,
//                                 //         children: [
//                                 //           Container(
//                                 //             child: Row(
//                                 //               children: [
//                                 //                 Container(
//                                 //                   margin: const EdgeInsets.only(
//                                 //                       left: 10),
//                                 //                   width: 40,
//                                 //                   height: 40,
//                                 //                   child: Image.asset(
//                                 //                       'assets/images/man.png'),
//                                 //                 ),
//                                 //                 const Text(
//                                 //                   'Putra',
//                                 //                   style:
//                                 //                       TextStyle(fontSize: 15),
//                                 //                 ),
//                                 //               ],
//                                 //             ),
//                                 //           ),
//                                 //           Container(
//                                 //             margin: const EdgeInsets.all(20),
//                                 //             child: Text(
//                                 //               snapshot.data!.docChanges[index]
//                                 //                   .doc['10pa'],
//                                 //               style: TextStyle(
//                                 //                   fontWeight: FontWeight.bold,
//                                 //                   fontSize: 15),
//                                 //             ),
//                                 //           ),
//                                 //         ],
//                                 //       ),
//                                 //       Row(
//                                 //         mainAxisAlignment:
//                                 //             MainAxisAlignment.spaceBetween,
//                                 //         children: [
//                                 //           Container(
//                                 //             child: Row(
//                                 //               children: [
//                                 //                 Container(
//                                 //                   margin: const EdgeInsets.only(
//                                 //                       left: 10),
//                                 //                   width: 40,
//                                 //                   height: 40,
//                                 //                   child: Image.asset(
//                                 //                       'assets/images/man.png'),
//                                 //                 ),
//                                 //                 const Text(
//                                 //                   'Putri',
//                                 //                   style:
//                                 //                       TextStyle(fontSize: 15),
//                                 //                 ),
//                                 //               ],
//                                 //             ),
//                                 //           ),
//                                 //           Container(
//                                 //             margin: const EdgeInsets.all(20),
//                                 //             child: Text(
//                                 //               snapshot.data!.docChanges[index]
//                                 //                   .doc['10pi'],
//                                 //               style: TextStyle(
//                                 //                   fontWeight: FontWeight.bold,
//                                 //                   fontSize: 15),
//                                 //             ),
//                                 //           ),
//                                 //         ],
//                                 //       ),
//                                 //     ],
//                                 //   ),
//                                 // ),
//                                 // const SizedBox(height: 20),
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   children: [
// //                                     Container(
// //                                       margin: const EdgeInsets.all(10),
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 25),
// //                                       child: const Text(
// //                                         'Kelas 11',
// //                                         style: TextStyle(
// //                                           fontSize: 17,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 Container(
// //                                   width: 343,
// //                                   height: 118,
// //                                   decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(5),
// //                                     color: const Color(0xffD7E9F7),
// //                                   ),
// //                                   child: Column(
// //                                     children: [
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.spaceBetween,
// //                                         children: [
// //                                           Container(
// //                                             child: Row(
// //                                               children: [
// //                                                 Container(
// //                                                   margin: const EdgeInsets.only(
// //                                                       left: 10),
// //                                                   width: 40,
// //                                                   height: 40,
// //                                                   child: Image.asset(
// //                                                       'assets/images/man.png'),
// //                                                 ),
// //                                                 const Text(
// //                                                   'Putra',
// //                                                   style:
// //                                                       TextStyle(fontSize: 15),
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ),
// //                                           Container(
// //                                             margin: const EdgeInsets.all(20),
// //                                             child: const Text(
// //                                               '32',
// //                                               style: TextStyle(
// //                                                   fontWeight: FontWeight.bold,
// //                                                   fontSize: 15),
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.spaceBetween,
// //                                         children: [
// //                                           Container(
// //                                             child: Row(
// //                                               children: [
// //                                                 Container(
// //                                                   margin: const EdgeInsets.only(
// //                                                       left: 10),
// //                                                   width: 40,
// //                                                   height: 40,
// //                                                   child: Image.asset(
// //                                                       'assets/images/man.png'),
// //                                                 ),
// //                                                 const Text(
// //                                                   'Putri',
// //                                                   style:
// //                                                       TextStyle(fontSize: 15),
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ),
// //                                           Container(
// //                                             margin: const EdgeInsets.all(20),
// //                                             child: const Text(
// //                                               '18',
// //                                               style: TextStyle(
// //                                                   fontWeight: FontWeight.bold,
// //                                                   fontSize: 15),
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 const SizedBox(height: 20),
// //                                 Row(
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   children: [
// //                                     Container(
// //                                       margin: const EdgeInsets.all(10),
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 25),
// //                                       child: const Text(
// //                                         'Kelas 12',
// //                                         style: TextStyle(
// //                                           fontSize: 17,
// //                                           fontWeight: FontWeight.bold,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 Container(
// //                                   width: 343,
// //                                   height: 118,
// //                                   decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(5),
// //                                     color: const Color(0xffD7E9F7),
// //                                   ),
// //                                   child: Column(
// //                                     children: [
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.spaceBetween,
// //                                         children: [
// //                                           Container(
// //                                             child: Row(
// //                                               children: [
// //                                                 Container(
// //                                                   margin: const EdgeInsets.only(
// //                                                       left: 10),
// //                                                   width: 40,
// //                                                   height: 40,
// //                                                   child: Image.asset(
// //                                                       'assets/images/man.png'),
// //                                                 ),
// //                                                 const Text(
// //                                                   'Putra',
// //                                                   style:
// //                                                       TextStyle(fontSize: 15),
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ),
// //                                           Container(
// //                                             margin: const EdgeInsets.all(20),
// //                                             child: const Text(
// //                                               '32',
// //                                               style: TextStyle(
// //                                                   fontWeight: FontWeight.bold,
// //                                                   fontSize: 15),
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.spaceBetween,
// //                                         children: [
// //                                           Container(
// //                                             child: Row(
// //                                               children: [
// //                                                 Container(
// //                                                   margin: const EdgeInsets.only(
// //                                                       left: 10),
// //                                                   width: 40,
// //                                                   height: 40,
// //                                                   child: Image.asset(
// //                                                       'assets/images/man.png'),
// //                                                 ),
// //                                                 const Text(
// //                                                   'Putri',
// //                                                   style:
// //                                                       TextStyle(fontSize: 15),
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ),
// //                                           Container(
// //                                             margin: const EdgeInsets.all(20),
// //                                             child: const Text(
// //                                               '18',
// //                                               style: TextStyle(
// //                                                   fontWeight: FontWeight.bold,
// //                                                   fontSize: 15),
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 const SizedBox(height: 50),
// //                               ],
// //                             ),
// //                           ],
// //                         ),