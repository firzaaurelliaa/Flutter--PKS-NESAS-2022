
// import 'package:akhir/form_list_futsal.dart';

// import 'package:akhir/oop_list_pertandingan_terakhir.dart';
// import 'package:akhir/page_belum_diatur.dart';
// import 'package:flutter/material.dart';

// class ListPertandinganTerakhir extends StatelessWidget {
//   const ListPertandinganTerakhir({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff142D4C),
//         elevation: 0,
//       ),
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               // ignore: avoid_unnecessary_containers

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 25, top: 30),
//                     child: const Text(
//                       'Daftar Pertandingan',
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xff142D4C)),
//                     ),
//                   ),
//                 ],
//               ),

//               InkWell(
//                 onTap: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const FormListFutsal()),
//                   ),
//                 },
//                 child: const OopListPertandinganTerakhir(
//                   skor: '4 - 1',
//                   tanggal: 'Kamis, 20 Februari 2022',
//                   tim: 'RPL Vs OTKP',
//                   cabor: 'Futsal',
//                 ),
//               ),
//               InkWell(
//                 onTap: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const FormListFutsal()),
//                   ),
//                 },
//                 child: const OopListPertandinganTerakhir(
//                   skor: '101 - 106',
//                   tanggal: 'Kamis, 20 Februari 2022',
//                   tim: 'RPL Vs OTKP',
//                   cabor: 'Basket',
//                 ),
//               ),
//               InkWell(
//                 onTap: () => {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const FormListFutsal()),
                  // ),
//                 },
//                 child: const OopListPertandinganTerakhir(
//                   skor: '25 - 19',
//                   tanggal: 'Kamis, 20 Februari 2022',
//                   tim: 'RPL Vs OTKP',
//                   cabor: 'Voli',
//                 ),
//               ),
//               InkWell(
//                 onTap: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const FormListFutsal()),
//                   ),
//                 },
//                 child: const OopListPertandinganTerakhir(
//                   skor: '2 - 0',
//                   tanggal: 'Kamis, 20 Februari 2022',
//                   tim: 'RPL Vs OTKP',
//                   cabor: 'Catur',
//                 ),
//               ),
//               InkWell(
//                 onTap: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const FormListFutsal()),
//                   ),
//                 },
//                 child: const OopListPertandinganTerakhir(
//                   skor: '21 - 19',
//                   tanggal: 'Kamis, 20 Februari 2022',
//                   tim: 'RPL Vs OTKP',
//                   cabor: 'Bulutangkis',
//                 ),
//               ),
//               InkWell(
//                 onTap: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const FormListFutsal()),
//                   ),
//                 },
//                 child: const OopListPertandinganTerakhir(
//                   skor: '2 - 1',
//                   tanggal: 'Kamis, 20 Februari 2022',
//                   tim: 'RPL Vs OTKP',
//                   cabor: 'Tenis Meja',
//                 ),
//               ),
//               InkWell(
//                 onTap: () => {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const PageBelumDiatur()),
//                   ),
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(25),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 175,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: const Color(0xff142D4C),
//                         ),
//                         child: Container(
//                           margin: const EdgeInsets.all(5),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             // ignore: prefer_const_literals_to_create_immutables
//                             children: [
//                               const Icon(
//                                 Icons.add_circle_outline_rounded,
//                                 color: Colors.white,
//                               ),
//                               const SizedBox(width: 3),
//                               const Text(
//                                 'Tambah pertandingan',
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
