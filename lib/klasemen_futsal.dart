
import 'package:akhir/add_klasemen_futsal.dart';
import 'package:flutter/material.dart';
import 'package:akhir/oop_klasemen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KlasemenFutsalNoAppbar extends StatefulWidget {
  const KlasemenFutsalNoAppbar({Key? key}) : super(key: key);

  @override
  _KlasemenFutsalNoAppbarState createState() => _KlasemenFutsalNoAppbarState();
}

class _KlasemenFutsalNoAppbarState extends State<KlasemenFutsalNoAppbar> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('klasemenFutsal').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Text("something is wrong");
        }

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xff142D4C),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AddKlasemenFutsal()));
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          body: SingleChildScrollView(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                flex: 25,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'No.',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text('Jurusan',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                              ),
                              const Expanded(
                                flex: 8,
                                child: SizedBox(width: 15),
                              ),
                              Expanded(
                                  flex: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        'M',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'M',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'S',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'K',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'Poin',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 10),
                ...generateBody(snapshot),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Keterangan :'),
                          Text('M = Main'),
                          Text('M = Menang'),
                          Text('S = Seri'),
                          Text('K = Kalah'),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> generateBody(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Widget> body = [];
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      body.add(OOPKlasemen(
        no: snapshot.data!.docs[i]['no'],
        // logo: Image(
        //     fit: BoxFit.cover,
        //     image: NetworkImage(
        //       snapshot.data!.docs[i]['logo'],
        //     ),
        //     loadingBuilder: (BuildContext context, Widget child,
        //         ImageChunkEvent? loadingProgress) {
        //       if (loadingProgress == null) {
        //         return child;
        //       }
        //       return Center(
        //         child: CircularProgressIndicator(
        //           color: const Color(0xff142D4C),
        //           value: loadingProgress.expectedTotalBytes != null
        //               ? loadingProgress.cumulativeBytesLoaded /
        //                   loadingProgress.expectedTotalBytes!
        //               : null,
        //         ),
        //       );
            // }),
        jurusan: snapshot.data!.docs[i]['jurusan'],
        main: snapshot.data!.docs[i]['main'],
        menang: snapshot.data!.docs[i]['menang'],
        seri: snapshot.data!.docs[i]['seri'],
        kalah: snapshot.data!.docs[i]['kalah'],
        poin: snapshot.data!.docs[i]['poin'],
        id: snapshot.data!.docs[i],
      ));
    }
    return body;
  }
}
