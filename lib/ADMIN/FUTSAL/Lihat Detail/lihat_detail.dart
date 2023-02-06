// ignore_for_file: avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers, duplicate_ignore

import 'package:akhir/Admin/FUTSAL/Lihat%20Detail/deskripsi.dart';
import 'package:akhir/Admin/FUTSAL/Lihat%20Detail/klasemen_futsal.dart';
import 'package:akhir/Admin/FUTSAL/Lihat%20Detail/statistik.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TabbarLihatDetail extends StatefulWidget {
  final DocumentSnapshot doc;
  final String id;
  final String logo1;
  final String logo2;
  final String skor1;
  final String skor2;
  final String tim1;
  final String tim2;

  const TabbarLihatDetail({
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
  _TabbarLihatDetailState createState() => _TabbarLihatDetailState();
}

final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance.collection('cabor').snapshots();

class _TabbarLihatDetailState extends State<TabbarLihatDetail> {
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
            automaticallyImplyLeading: true,
            title: const Text('F U L L  T I M E'),
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
                            child: (widget.logo1.toString() != 'null')
                                ? Image.network(
                                    widget.logo1,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: const Color(0xff142D4C),
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  )

                                // CircleAvatar(
                                //     backgroundImage: NetworkImage(
                                //       futsalModel.logo2,

                                //     ),
                                //   )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[300]!,
                                    ),
                                    width: 150,
                                    height: 150,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 50,
                                    ),
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
                                // ignore: prefer_const_literals_to_create_immutables
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
                        child: SizedBox(
                            width: 50,
                            height: 50,
                            child: (widget.logo2.toString() != 'null')
                                ? Image.network(
                                    widget.logo2,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: const Color(0xff142D4C),
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  )

                                // CircleAvatar(
                                //     backgroundImage: NetworkImage(
                                //       futsalModel.logo2,

                                //     ),
                                //   )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[300]!,
                                    ),
                                    width: 150,
                                    height: 150,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  )),
                      ),
                      // child: Container(
                      //     width: 50,
                      //     height: 50,
                      //     child: Image.network(
                      // widget.logo2,
                      //       fit: BoxFit.cover,
                      //     ))),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
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
                      Statistik(id: widget.id),
                      // TimFutsalRplOtkp(id: widget.id),
                      Deskripsi(id: widget.id),
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
