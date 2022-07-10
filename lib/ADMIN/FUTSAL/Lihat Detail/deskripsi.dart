import 'package:akhir/Admin/FUTSAL/Lihat%20Detail/edit_deskripsi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Deskripsi extends StatefulWidget {
  final String id;
  const Deskripsi({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Deskripsi> createState() => _DeskripsiState();
}

class _DeskripsiState extends State<Deskripsi> {
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
                                      builder: (context) =>
                                          (EditDeskripsi(
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
                          padding: const EdgeInsets.only(bottom: 30),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffD7E9F7),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
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
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
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
                              ),
                             
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
        },
      ),
    );
  }
}
