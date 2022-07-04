// ignore_for_file: unused_field
import 'package:akhir/OOP_card_score.dart';
import 'package:akhir/add_futsal.dart';
import 'package:akhir/form_list_futsal.dart';
import 'package:akhir/tab_bar_futsal.dart';
import 'package:akhir/user_tabbar_body.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserFutsal extends StatefulWidget {
  const UserFutsal({Key? key}) : super(key: key);

  @override
  _UserFutsalState createState() => _UserFutsalState();
}

class _UserFutsalState extends State<UserFutsal> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('cabor').snapshots();
  final MediaType _mediaType = MediaType.image;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff142D4C),
        title: const Text(
          'FUTSAL HARI INI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
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
          if (!snapshot.hasData) {
            return const CircularProgressIndicator(
              color: Color(0xff142D4C),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xff142D4C),
                              ),
                              padding: const EdgeInsets.all(3),
                              width: 110,
                              height: 30,
                              child: const Center(
                                child: Text(
                                  'F U  L L   T I M E',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(width: 7),
                            // Text(
                            //   DateFormat('EEEE, dd MMMM yyyy', 'id').format(
                            //       (snapshot.data!.docs[0]
                            //                   .get('tanggalPertandingan')
                            //               as Timestamp)
                            //           .toDate()),
                            //   // snapshot.data!.docs[index].get('futsal')['tanggal'],
                            //   style: const TextStyle(
                            //     fontSize: 13,
                            //     fontWeight: FontWeight.bold,
                            //     color: Color.fromARGB(255, 53, 53, 53),
                            //   ),
                            // ),
                            // Text(
                            //   snapshot.data!.docs[index]
                            //       .get('futsal')['tanggal'],
                            //   style: TextStyle(
                            // color: Color.fromARGB(255, 53, 53, 53),
                            // fontWeight: FontWeight.bold),
                            // ),
                          ],
                        ),
                        TextButton(
                            onPressed: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserTabbarBody(
                                          doc: snapshot.data!.docs[index]),
                                    ),
                                  ),
                                },
                            child: const Text(
                              'Lihat detail',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            )),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 144,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      snapshot.data!.docs[index]
                                          .get('futsal')['logo1'],
                                    ),
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
                                    }),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snapshot.data!.docs[index]
                                    .get('futsal')['tim1'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                snapshot.data!.docs[index]
                                    .get('futsal')['skor1'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                snapshot.data!.docs[index]
                                    .get('futsal')['skor2'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Image(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      snapshot.data!.docs[index]
                                          .get('futsal')['logo2'],
                                    ),
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
                                    }),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snapshot.data!.docs[index]
                                    .get('futsal')['tim2'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  List<Widget> generateBody(AsyncSnapshot<QuerySnapshot> snapshot) {
    List<Widget> body = [];
    for (int i = 0; i < snapshot.data!.docs.length; i++) {
      body.add(OOPCardScore(
        tim1: snapshot.data!.docs[i]['tim1'],
        logo1: snapshot.data!.docs[i]['logo1'],
        logo2: snapshot.data!.docs[i]['logo2'],
        tim2: snapshot.data!.docs[i]['tim2'],
        tanggal: snapshot.data!.docs[i]['tanggal'],
        skor1: snapshot.data!.docs[i]['skor1'],
        skor2: snapshot.data!.docs[i]['skor2'],
        documentSnapshot: snapshot.data!.docs[i][DocumentSnapshot],
        id: snapshot.data!.docs[i].id,
      ));
    }
    return body;
  }
}
