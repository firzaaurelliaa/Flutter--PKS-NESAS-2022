// ignore_for_file: camel_case_types, must_be_immutable, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class addfiks extends StatelessWidget {
  TextEditingController namaPemain = TextEditingController();
  TextEditingController noPemain = TextEditingController();
  TextEditingController posisiPemain = TextEditingController();

  CollectionReference ref =
      FirebaseFirestore.instance.collection('playerDatas');

  addfiks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        // actions: [
        //   MaterialButton(
        //     onPressed: () {
        //       ref.add({
        //         'namaPemain': title.text,
        //         'noPemain': content.text,
        //         'posisiPemain': tim.text,
        //         'cabangOlahraga': cabangOlahraga.text,
        //         'kelasPemain': kelasPemain.text,
        //       }).whenComplete(() {
        //         Navigator.pushReplacement(
        //             context, MaterialPageRoute(builder: (_) => PemainAKL()));
        //       });
        //     },
        //     child: Text(
        //       "save",
        //     ),
        //   ),
        // ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: namaPemain,
              decoration: const InputDecoration(
                hintText: 'title',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: noPemain,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'content',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: posisiPemain,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'tim',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
