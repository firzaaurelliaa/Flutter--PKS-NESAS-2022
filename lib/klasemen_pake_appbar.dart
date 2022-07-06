// import 'package:akhir/add_klasemen_navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:akhir/oop_klasemen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class KlasemenPakeAppbar extends StatefulWidget {
//   const KlasemenPakeAppbar({Key? key}) : super(key: key);

//   @override
//   _KlasemenPakeAppbarState createState() => _KlasemenPakeAppbarState();
// }

// class _KlasemenPakeAppbarState extends State<KlasemenPakeAppbar> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('klasemen').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return const Text("something is wrong");
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (!snapshot.hasData) {
//           return const Text("something is wrong");
//         }

//         return Scaffold(
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: const Color(0xff142D4C),
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (_) => AddKlasemenNavbar()));
//             },
//             child: const Icon(
//               Icons.add,
//             ),
//           ),
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: const Color(0xff142D4C),
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
                // Stack(
                //   children: [
                //     Container(
                //       width: MediaQuery.of(context).size.width,
                //       height: 150,
                //       color: const Color(0xff142D4C),
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         SizedBox(
                //           width: 200,
                //           height: 150,
                //           child: Image.asset('assets/images/logopks.png'),
                //         ),
                //       ],
                //     )
                //   ],
                // ),
//                 SingleChildScrollView(
//                   child: Container(
//                       margin: const EdgeInsets.all(10),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 flex: 25,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   // ignore: prefer_const_literals_to_create_immutables
//                                   children: [
//                                     const SizedBox(
//                                       width: 5,
//                                     ),
//                                     const Text(
//                                       'No.',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     const Text('Jurusan',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               const Expanded(
//                                 flex: 7,
//                                 child: SizedBox(width: 15),
//                               ),
//                               Expanded(
//                                   flex: 60,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceEvenly,
//                                     // ignore: prefer_const_literals_to_create_immutables
//                                     children: [
//                                       const Text(
//                                         'M',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       const Text(
//                                         'M',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       const Text(
//                                         'S',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       const Text(
//                                         'K',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       const Text(
//                                         'Poin',
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   )),
//                             ],
//                           )
//                         ],
//                       )),
//                 ),
//                 const SizedBox(height: 10),
//                 ...generateBody(snapshot),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   List<Widget> generateBody(AsyncSnapshot<QuerySnapshot> snapshot) {
//     List<Widget> body = [];
//     for (int i = 0; i < snapshot.data!.docs.length; i++) {
//       body.add(OOPKlasemen(
//         no: snapshot.data!.docs[i]['no'],
//         logo: Image(
//           image: NetworkImage(
//             snapshot.data!.docs[i]['logo'],
//           ),
//         ),
//         jurusan: snapshot.data!.docs[i]['jurusan'],
//         main: snapshot.data!.docs[i]['main'],
//         menang: snapshot.data!.docs[i]['menang'],
//         seri: snapshot.data!.docs[i]['seri'],
//         kalah: snapshot.data!.docs[i]['kalah'],
//         poin: snapshot.data!.docs[i]['poin'],
//         id: snapshot.data!.docs[i],
//       ));
//     }
//     return body;
//   }
// }
