import 'package:akhir/deskripsi_rpl_otkp.dart';

import 'package:akhir/klasemen_futsal.dart';

import 'package:akhir/papan_skor.dart';

import 'package:akhir/statistik_rpl_otkp.dart';

import 'package:akhir/tim_futsal.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TabbarBody extends StatefulWidget {
  final DocumentSnapshot doc;
  final String id;
  final String logo1;
  final String logo2;
  final String skor1;
  final String skor2;
  final String tim1;
  final String tim2;

  const TabbarBody({
    Key? key,
    required this.id,
    required this.doc,
    required this.logo1,
    required this.logo2,
    required this.skor1,
    required this.skor2,
    required this.tim1,
    required this.tim2,
  }) : super(key: key);

  @override
  _TabbarBodyState createState() => _TabbarBodyState();
}

final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance.collection('cabor').snapshots();

class _TabbarBodyState extends State<TabbarBody> {
  @override
  Widget build(BuildContext context) {
    print(widget.id);
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
                            child: Image.network(
                              widget.logo1,
                              fit: BoxFit.cover,
                            )),
                      ),
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
                                    widget.tim1,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.skor1,
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
                                    widget.skor2,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.tim2,
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
                                  // Text(
                                  //   "d",
                                  //   style: const TextStyle(
                                  //     color: Colors.black45,
                                  //     fontSize: 10.0,
                                  //   ),
                                  // ),
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
                          child: Container(
                              width: 50,
                              height: 50,
                              child: Image.network(
                                widget.logo2,
                                fit: BoxFit.cover,
                              ))),
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
            length: 3,
            child: Column(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: const TabBar(
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(text: 'Statistik'),
                      // Tab(text: 'Tim'),
                      Tab(text: 'Deskripsi'),
                      Tab(text: 'Klasemen'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      StatistikRPLOTKP(id: widget.id),
                      // TimFutsalRplOtkp(id: widget.id),
                      DeskripsiRplOtkp(id: widget.id),
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
