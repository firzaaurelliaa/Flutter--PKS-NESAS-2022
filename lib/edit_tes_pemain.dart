// import 'dart:html';

// import 'dart:html';

// ignore_for_file: camel_case_types, must_be_immutable

import 'package:akhir/pilihan_atas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class add extends StatefulWidget {
  DocumentSnapshot docid;
  add({Key? key, required this.docid}) : super(key: key);

  @override
  _addState createState() => _addState();
}

class _addState extends State<add> {


  TextEditingController kejuaraanyangpernahdiraih = TextEditingController();
  TextEditingController pa10 = TextEditingController();
  TextEditingController pi10 = TextEditingController();


  @override
  void initState() {
    
    kejuaraanyangpernahdiraih = TextEditingController(
        text: widget.docid.get('namaPemain'));
    pa10 = TextEditingController(text: widget.docid.get('noPemain'));
    pi10 = TextEditingController(text: widget.docid.get('posisiPemain'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff142D4C),

        elevation: 0,
        // leading: MaterialButton(
        //   onPressed: () {
        //     widget.docid.reference.delete().whenComplete(() {
        //       Navigator.pushReplacement(context,
        //           MaterialPageRoute(builder: (_) => const PilihanAtas()));
        //     });
        //   },
        //   child: Icon(
        //     Icons.delete,
        //     color: Colors.white,
        //   ),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text(
                "Batal",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PilihanAtas()),
                );
              },
            ),
            MaterialButton(
              onPressed: () {
                widget.docid.reference.update({
                 
                  'kejuaraanYangPernahDiraih': kejuaraanyangpernahdiraih.text,
                  '10pa': pa10.text,
                  '10pi': pi10.text,
               
                }).whenComplete(() {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const PilihanAtas()));
                });
              },
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        // actions: [
        //   MaterialButton(
        //     onPressed: () {
        //       widget.docid.reference.update({
        //         'namaJurusan': namajurusan.text,
        //         'tentangJurusan': tentangjurusan.text,
        //         'kejuaraanYangPernahDiraih': kejuaraanyangpernahdiraih.text,
        //         '10pa': pa10.text,
        //         '10pi': pi10.text,
        //         '11pa': pa11.text,
        //         '11pi': pi11.text,
        //         '12pa': pa12.text,
        //         '12pi': pi12.text,
        //       }).whenComplete(() {
        //         Navigator.pushReplacement(
        //             context, MaterialPageRoute(builder: (_) => PilihanAtas()));
        //       });
        //     },
        //     child: const Text(
        //       "Simpan",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ],
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
                      'posisi yang pernah diraih',
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
                  maxLength: 50,
                  maxLines: 4,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: kejuaraanyangpernahdiraih,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    suffixIcon: IconButton(
                      onPressed: kejuaraanyangpernahdiraih.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    hintText: 'Tambahkan posisi yang pernah diraih',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: const Text(
                      'no punggung',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 343,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffD7E9F7),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/images/man.png'),
                        ),
                        const Text('no'),
                        const SizedBox(width: 175),
                        SizedBox(
                          width: 45,
                          height: 35,
                          child: TextFormField(
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: pa10,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffD7E9F7),
                              filled: true,
                              // contentPadding: const EdgeInsets.only(left: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xff142D4C))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
