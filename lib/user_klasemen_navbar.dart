import 'package:akhir/OOP_klasemen_navbar.dart';
import 'package:akhir/add_klasemen_futsal.dart';
import 'package:akhir/add_klasemen_navbar.dart';
import 'package:flutter/material.dart';
import 'package:akhir/oop_klasemen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserKlasemenNavbar extends StatefulWidget {
  const UserKlasemenNavbar({Key? key}) : super(key: key);

  @override
  _UserKlasemenNavbarState createState() => _UserKlasemenNavbarState();
}

class _UserKlasemenNavbarState extends State<UserKlasemenNavbar> {
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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff142D4C),
            toolbarHeight: 150,
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
                                        'k',
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
        logo: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              snapshot.data!.docs[i]['logo'],
            ),
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  color: const Color(0xff142D4C),
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            }),
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
