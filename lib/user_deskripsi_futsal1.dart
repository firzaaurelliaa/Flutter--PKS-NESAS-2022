import 'package:akhir/edit_deskripsi_rpl_otkp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserDeskripsiFutsal1 extends StatefulWidget {
  final String id;
  const UserDeskripsiFutsal1({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<UserDeskripsiFutsal1> createState() => _UserDeskripsiFutsal1State();
}

class _UserDeskripsiFutsal1State extends State<UserDeskripsiFutsal1> {
  final deskripsi = TextEditingController();
  Future<void> update([DocumentSnapshot? snapshot]) async {
    if (snapshot != null) {
      deskripsi.text = snapshot['deskripsi'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff142D4C),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('deskripsiFutsal')
            .where('caborId', isEqualTo: widget.id)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
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
          return ListView(
            shrinkWrap: true,
            // itemCount: snapshot.data!.docs.length,
            children: [
              ...snapshot.data!.docs.map((e) {
                return Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffD7E9F7),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                child: const Text('DESKRIPSI PERTANDINGAN',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17)),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    e.get('deskripsi'),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              })
            ],
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class UserDeskripsiFutsal1 extends StatelessWidget {
//   const UserDeskripsiFutsal1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff142D4C),
//       body: Center(
//         child: Container(
//           width: 358,
//           height: 401,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: const Color(0xffD7E9F7),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.all(20),
//                     child: const Text('DESKRIPSI PERTANDINGAN',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w900, fontSize: 17)),
//                   ),
                  
//                 ],
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: const Text(
//                   'Pertandingan futsal antara jurusan RPL melawan OTKP yang berlangsung pada sore hari tadi berjalan begitu sengit. \n \nKedua tim enggan mengalah dan terus menancapkan gas kemenangan. \nPada babak pertama OTKP memimpin score dengan mencetak gol pada menit ke 5 berkat tendangan jarak jauh FIrza. \n \nNamun tim lawan tak tinggal diam, RPL mulai memanas setelah gol itu terjadi. Serangan demi serangan mulai diluncurkan. Hingga pada akhirnya RPL menyamakan kedudukan pada menit ke 12. Skor pun tak berubah hingga berakhirnya pertandingan.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
