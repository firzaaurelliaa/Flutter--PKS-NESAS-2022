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

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
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
                TextFormField(
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
                SizedBox(height: 30),
                loading
                    ? const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xff142D4C)))
                    : SizedBox(
                        height: 38,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: const Color(0xff142D4C),
                            onPrimary: Colors.white,
                          ),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                              const Center(
                                child: const CircularProgressIndicator(
                                    color: Color(0xff142D4C)),
                              );
                            });
                            if (deskripsi.text.isNotEmpty) {
                              widget.docid.reference
                                  .update({"deskripsi": deskripsi.text});

                              Navigator.pop(
                                context,
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Inputan tidak boleh kosong!'),
                                backgroundColor: Colors.red,
                              ));
                            }
                            setState(() {
                              loading = false;
                            });
                          },
                          child: const Text(
                            "SIMPAN",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
