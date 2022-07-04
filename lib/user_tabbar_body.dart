import 'package:akhir/deskripsi_rpl_otkp.dart';

import 'package:akhir/klasemen_futsal.dart';

import 'package:akhir/papan_skor.dart';

import 'package:akhir/statistik_rpl_otkp.dart';

import 'package:akhir/tim_futsal.dart';
import 'package:akhir/user_statistik.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserTabbarBody extends StatefulWidget {
  final DocumentSnapshot doc;
  const UserTabbarBody({Key? key, required this.doc}) : super(key: key);

  @override
  _UserTabbarBodyState createState() => _UserTabbarBodyState();
}

final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance.collection('cabor').snapshots();

class _UserTabbarBodyState extends State<UserTabbarBody> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Ada yang salah");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff142D4C),
            ),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xff142D4C),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 200,
            title: Column(
              children: [
                const Text('F U L L   T I M E'),
                const SizedBox(height: 20),
                Container(
                  width: 365,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffD7E9F7),
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 15,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                widget.doc.get('futsal')['logo1'],
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 70,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    widget.doc.get('futsal')['tim1'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.doc.get('futsal')['skor1'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '-',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.doc.get('futsal')['skor2'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.doc.get('futsal')['tim2'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 1.5,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // const Text(
                                  //   "Firza 5'",
                                  //   style: TextStyle(
                                  //     color: Colors.black45,
                                  //     fontSize: 10.0,
                                  //   ),
                                  // ),
                                  Text(
                                    widget.doc.get('futsal')['tanggal'],
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  // const Text(
                                  //   "Orel 12'",
                                  //   style: TextStyle(
                                  //     color: Colors.black45,
                                  //     fontSize: 10.0,
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 15,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                widget.doc.get('futsal')['logo2'],
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
            centerTitle: true,
            backgroundColor: const Color(0xff142D4C),
            elevation: 0,
          ),
          body: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(text: 'Statistik'),
                      Tab(text: 'Tim'),
                      Tab(text: 'Deskripsi'),
                      Tab(text: 'Klasemen'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      UserStatistik(docId: widget.doc.id),
                      TimFutsalRplOtkp(
                        tim1: '',
                        tim2: '',
                      ),
                      const DeskripsiRplOtkp(),
                      const KlasemenFutsalNoAppbar(),
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
}
