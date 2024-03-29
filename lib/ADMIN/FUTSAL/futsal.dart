// ignore_for_file: unused_field
import 'package:akhir/Admin/FUTSAL/Lihat%20Detail/lihat_detail.dart';
import 'package:akhir/Admin/FUTSAL/add_futsal.dart';
import 'package:akhir/Admin/FUTSAL/edit_futsal.dart';
import 'package:akhir/Admin/FUTSAL/futsal_model.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Futsal extends StatefulWidget {
  const Futsal({Key? key}) : super(key: key);

  @override
  _FutsalState createState() => _FutsalState();
}

class _FutsalState extends State<Futsal> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('cabor').snapshots();
  final MediaType _mediaType = MediaType.image;
  String? imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbfbfb),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const AddFutsal(
                        id: 'id',
                      )));
        },
        backgroundColor: const Color(0xff142D4C),
        child: const Icon(Icons.add),
      ),
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
              FutsalModel futsalModel =
                  FutsalModel.fromJson(snapshot.data!.docs[index]);
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
                                  'F U L L   T I M E',
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
                                      builder: (context) => TabbarLihatDetail(
                                        id: snapshot.data!.docs[index].id,
                                        doc: snapshot.data!.docs[index],
                                        logo1: futsalModel.logo1,
                                        logo2: futsalModel.logo2,
                                        skor1: futsalModel.skor1,
                                        skor2: futsalModel.skor2,
                                        tim1: futsalModel.tim1,
                                        tim2: futsalModel.tim2,
                                      ),
                                    ),
                                  ),
                                },
                            child: const Text(
                              'Lihat Detail',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            )),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => EditFutsal(
                                      docid: snapshot.data!.docs[index],
                                      id: snapshot.data!.docs[index].id,
                                      // imageUrl: '',
                                    )));
                      },
                      child: Container(
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
                                    width: 70,
                                    height: 70,
                                    child: (futsalModel.logo1.toString() !=
                                            'null')
                                        ? Image.network(
                                            futsalModel.logo1,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color:
                                                      const Color(0xff142D4C),
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
                                        // ? CircleAvatar(
                                        //     backgroundImage: NetworkImage(
                                        //       futsalModel.logo1,
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
                                const SizedBox(height: 10),
                                Text(
                                  futsalModel.tim1.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  futsalModel.skor1.toString(),
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
                                  futsalModel.skor2.toString(),
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
                                    width: 70,
                                    height: 70,
                                    child: (futsalModel.logo2.toString() !=
                                            'null')
                                        ? Image.network(
                                            futsalModel.logo2,
                                            fit: BoxFit.cover,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color:
                                                      const Color(0xff142D4C),
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
                                const SizedBox(height: 10),
                                Text(
                                  futsalModel.tim2.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

