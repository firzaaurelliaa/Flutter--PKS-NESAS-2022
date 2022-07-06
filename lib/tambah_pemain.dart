// ignore_for_file: must_be_immutable

import 'package:akhir/pemain_akl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

// ignore: camel_case_types
class TambahPemain extends StatefulWidget {
  const TambahPemain({Key? key}) : super(key: key);

  @override
  State<TambahPemain> createState() => _TambahPemainState();
}

class _TambahPemainState extends State<TambahPemain> {
  TextEditingController pemainfutsal1 = TextEditingController();
  TextEditingController posisifutsal1 = TextEditingController();
  TextEditingController nopunggungfutsal1 = TextEditingController();

  CollectionReference ref =
      FirebaseFirestore.instance.collection('playerDatas');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'namaPemain': pemainfutsal1.text,
                'noPemain': posisifutsal1.text,
                'posisiPemain': posisifutsal1.text,
              }).whenComplete(() {
                // Navigator.pop(context,
                //     MaterialPageRoute(builder: (_) =>  PemainAKL(tim1: '', tim2: '',  dataJurusan: docData, id: '',)));
              });
            },
            child: const Text(
              "Simpan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              const Icon(
                Icons.add_photo_alternate,
                color: Color(0xff142D4C),
              ),
              Container(
                width: 130,
                height: 55,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: TextFormField(
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: pemainfutsal1,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 55,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: TextFormField(
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: posisifutsal1,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              Container(
                width: 55,
                height: 55,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: TextFormField(
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: nopunggungfutsal1,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              IconButton(
                  onPressed: () {
                    // ignore: prefer_typing_uninitialized_variables
                    var widget;
                    widget.docid.reference.delete().whenComplete(() {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (_) =>  PemainAKL(tim1: '', tim2: '', dataJurusan: docData,)));
                    });
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          // Container(
          //   decoration: BoxDecoration(border: Border.all()),
          //   child: TextField(
          //     controller: title,
          //     decoration: const InputDecoration(
          //       hintText: 'title',
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(border: Border.all()),
          //     child: TextField(
          //       controller: content,
          //       expands: true,
          //       maxLines: null,
          //       decoration: const InputDecoration(
          //         hintText: 'content',
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
