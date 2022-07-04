// import 'package:akhir/deskripsi_rpl_otkp.dart';
// import 'package:akhir/klasemen_futsal.dart';




// import 'package:akhir/statistik_rpl_otkp.dart';

// import 'package:akhir/tim_futsal_rpl_otkp.dart';
// import 'package:flutter/material.dart';

// class TabbarFutsalDgTkj extends StatefulWidget {
//   const TabbarFutsalDgTkj({Key? key}) : super(key: key);

//   @override
//   _TabbarBodyState createState() => _TabbarBodyState();
// }

// class _TabbarBodyState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff142D4C),
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 200,
//         title: Column(
//           children: [
//             const Text('F U L L   T I M E'),
//             const SizedBox(height: 20),
//             Container(
//               width: 365,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: const Color(0xffD7E9F7),
//               ),
//               padding: const EdgeInsets.all(15.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 15,
//                     child: Image.asset('assets/images/DG.png'),
//                   ),
//                   Expanded(
//                     flex: 70,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 12.0, right: 12.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: const <Widget>[
//                               Text(
//                                 'DG',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Text(
//                                 '1 - 0',
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 36.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 'TKJ',
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               )
//                             ],
//                           ),
//                           const Divider(
//                             color: Colors.black,
//                             thickness: 1.5,
//                           ),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               const Text(
//                                 "Firza 5'",
//                                 style: TextStyle(
//                                   color: Colors.black45,
//                                   fontSize: 10.0,
//                                 ),
//                               ),
//                               Column(
//                                 children: const [
//                                   Text(
//                                     'Carrera Futsal Subang',
//                                     style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: 10.0,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Kamis, 20 Mei 2022',
//                                     style: TextStyle(
//                                       color: Colors.black45,
//                                       fontSize: 10.0,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const Text(
//                                 "Orel 12'",
//                                 style: TextStyle(
//                                   color: Colors.black45,
//                                   fontSize: 10.0,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 15,
//                     child: Image.asset('assets/images/TKI.png'),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(0xff142D4C),
//         elevation: 0,
//       ),
//       body: DefaultTabController(
//         length: 4,
//         child: Column(
//           children: [
//             // ignore: avoid_unnecessary_containers
//             Container(
//               child: const TabBar(
//                 indicatorColor: Colors.white,
//                 labelColor: Colors.white,
//                 tabs: [
//                   Tab(text: 'Statistik'),
//                   Tab(text: 'Tim'),
//                   Tab(text: 'Deskripsi'),
//                   Tab(text: 'Klasemen'),
//                 ],
//               ),
//             ),
//              Expanded(
//               child: TabBarView(
//                 children: [
//                   StatistikRPLOTKP(),
//                   TimFutsalRplOtkp(tim1: '', tim2: '',),
//                   DeskripsiRplOtkp(),
//                   KlasemenFutsalNoAppbar(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
