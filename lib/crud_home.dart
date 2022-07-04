// ignore_for_file: use_key_in_widget_constructors

import 'package:akhir/edit_klasemen_futsal_fiks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "todo app",
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: const HomeCrud(),
    );
  }
}

class HomeCrud extends StatefulWidget {
  const HomeCrud({Key? key}) : super(key: key);

  @override
  _HomeCrudState createState() => _HomeCrudState();
}

class _HomeCrudState extends State<HomeCrud> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('notes').snapshots();

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

        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(
          //             builder: (_) =>
          //                 addnoteCrud(docid: snapshot.data!.docs[index])));
          //   },
          //   child: Icon(
          //     Icons.add,
          //   ),
          // ),
          body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => editnoteCrud(
                          docid: snapshot.data!.docs[index],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // OOPKlasemen(
                      //   no: snapshot.data!.docChanges[index].doc['no'],
                      //   logo: Image(
                      //     image: NetworkImage(
                      //       snapshot.data!.docs[index]['logo'],
                      //     ),
                      //   ),
                      //   jurusan:
                      //       snapshot.data!.docChanges[index].doc['jurusan'],
                      //   main: snapshot.data!.docChanges[index].doc['main'],
                      //   menang: snapshot.data!.docChanges[index].doc['menang'],
                      //   seri: snapshot.data!.docChanges[index].doc['seri'],
                      //   kalah: snapshot.data!.docChanges[index].doc['kalah'],
                      //   poin: snapshot.data!.docChanges[index].doc['poin'],
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
