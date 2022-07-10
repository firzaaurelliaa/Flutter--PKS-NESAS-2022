// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditDeskripsi extends StatefulWidget {
  DocumentSnapshot docid;
  final String id;
  EditDeskripsi({Key? key, required this.docid, required this.id})
      : super(key: key);

  @override
  State<EditDeskripsi> createState() => _EditDeskripsiState();
}

class _EditDeskripsiState extends State<EditDeskripsi> {
  TextEditingController deskripsi = TextEditingController();

  @override
  void initState() {
    deskripsi = TextEditingController(text: widget.docid.get('deskripsi'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: TextButton(
                onPressed: () {
                  widget.docid.reference.update({
                    'deskripsi': deskripsi.text,
                  }).whenComplete(() {
                    Navigator.pop(
                      context,
                    );
                  });
                },
                child: const Text(
                  'Simpan',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'Deskripsi pertandingan',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  maxLength: null,
                  maxLines: null,
                  controller: deskripsi,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: deskripsi.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.all(20),
                    hintText: 'Tambahkan deskripsi pertandingan',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
