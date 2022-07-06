import 'package:akhir/edit_deskripsi_rpl_otkp.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeskripsiRplOtkp extends StatefulWidget {
  final String id;
  const DeskripsiRplOtkp({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DeskripsiRplOtkp> createState() => _DeskripsiRplOtkpState();
}

class _DeskripsiRplOtkpState extends State<DeskripsiRplOtkp> {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                child: const Text('DESKRIPSI PERTANDINGAN',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 17)),
                              ),
                              IconButton(
                                onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          (EditDeskripsiRplOtkp(
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
