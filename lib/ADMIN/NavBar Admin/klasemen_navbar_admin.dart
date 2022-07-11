import 'package:akhir/OOP_Custom_Widgets.dart/oop_klasemen_navbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KlasemenNavbar extends StatefulWidget {
  const KlasemenNavbar({Key? key}) : super(key: key);

  @override
  _KlasemenNavbarState createState() => _KlasemenNavbarState();
}

class _KlasemenNavbarState extends State<KlasemenNavbar> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('klasemen').snapshots();
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
            child: CircularProgressIndicator(
              color: Color(0xff142D4C),
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Text("something is wrong");
        }

        return Scaffold(
          
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff142D4C),
            toolbarHeight: 200,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('assets/images/logopks.png'),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
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
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text('Keterangan :'),
                          const Text('M = Main'),
                          const Text('M = Menang'),
                          const Text('S = Seri'),
                          const Text('K = Kalah'),
                        ],
                      ),
                    ],
                  ),
                ),
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
      body.add(OOPKlasemenNavbar(
        no: snapshot.data!.docs[i]['no'],
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
