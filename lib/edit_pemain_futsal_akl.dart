// ignore_for_file: must_be_immutable


import 'package:akhir/pemain_akl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class EditPemainFutsalAkl extends StatelessWidget {
  DocumentSnapshot docid;
  EditPemainFutsalAkl({Key? key, required this.docid}) : super(key: key);
  TextEditingController pemainfutsal1 = TextEditingController();
  TextEditingController posisifutsal1 = TextEditingController();
  TextEditingController nopunggungfutsal1 = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('aklPemain');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          MaterialButton(
            onPressed: () {
              ref.add({
                'pemainFutsal1': pemainfutsal1.text,
                'posisiFutsal1': posisifutsal1.text,
                'noPunggungFutsal1': nopunggungfutsal1.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) =>  PemainAKL(tim1: '', tim2: '',)));
              });
            },
            child: const Text(
              "Simpan",
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          const SizedBox(width: 20),
          const Icon(
            Icons.add_photo_alternate,
            color: Color(0xff142D4C),
          ),
          Container(
            width: 130,
            height: 55,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              controller: pemainfutsal1,
              decoration: InputDecoration(
                fillColor: const Color(0xffD7E9F7),
                filled: true,
                contentPadding: const EdgeInsets.only(left: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xff142D4C))),
              ),
            ),
          ),
          Container(
            width: 130,
            height: 55,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              controller: posisifutsal1,
              decoration: InputDecoration(
                fillColor: const Color(0xffD7E9F7),
                filled: true,
                contentPadding: const EdgeInsets.only(left: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xff142D4C))),
              ),
            ),
          ),
          Container(
            width: 55,
            height: 55,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TextFormField(
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              keyboardType: const TextInputType.numberWithOptions(),
              controller: nopunggungfutsal1,
              decoration: InputDecoration(
                fillColor: const Color(0xffD7E9F7),
                filled: true,
                contentPadding: const EdgeInsets.only(left: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(color: Color(0xff142D4C))),
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Icon(
            Icons.delete,
            color: Color(0xff142D4C),
          ),
        ],
      ),
    );
  }
}
