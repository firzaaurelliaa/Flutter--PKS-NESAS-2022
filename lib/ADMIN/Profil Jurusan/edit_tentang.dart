// import 'dart:html';
// import 'dart:html';
// ignore_for_file: use_key_in_widget_constructors, camel_case_types, must_be_immutable, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditTentang extends StatefulWidget {
  DocumentSnapshot docid;
  EditTentang({required this.docid});

  @override
  _EditTentangState createState() => _EditTentangState();
}

class _EditTentangState extends State<EditTentang> {
  TextEditingController tentangjurusan = TextEditingController();
  TextEditingController kejuaraanyangpernahdiraih = TextEditingController();
  TextEditingController pa10 = TextEditingController();
  TextEditingController pi10 = TextEditingController();
  TextEditingController pa11 = TextEditingController();
  TextEditingController pi11 = TextEditingController();
  TextEditingController pa12 = TextEditingController();
  TextEditingController pi12 = TextEditingController();

  @override
  void initState() {
    tentangjurusan =
        TextEditingController(text: widget.docid.get('tentangJurusan'));
    kejuaraanyangpernahdiraih = TextEditingController(
        text: widget.docid.get('kejuaraanYangPernahDiraih'));
    pa10 = TextEditingController(text: widget.docid.get('10pa'));
    pi10 = TextEditingController(text: widget.docid.get('10pi'));
    pa11 = TextEditingController(text: widget.docid.get('11pa'));
    pi11 = TextEditingController(text: widget.docid.get('11pi'));
    pa12 = TextEditingController(text: widget.docid.get('12pa'));
    pi12 = TextEditingController(text: widget.docid.get('12pi'));
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
                Navigator.pop(
                  context,
                );
              },
            ),
            MaterialButton(
              onPressed: () {
                if (tentangjurusan.text.isNotEmpty &&
                    kejuaraanyangpernahdiraih.text.isNotEmpty &&
                    pa10.text.isNotEmpty &&
                    pa11.text.isNotEmpty &&
                    pi10.text.isNotEmpty &&
                    pi11.text.isNotEmpty &&
                    pa12.text.isNotEmpty &&
                    pi12.text.isNotEmpty) {
                  widget.docid.reference.update({
                    'tentangJurusan': tentangjurusan.text,
                    'kejuaraanYangPernahDiraih': kejuaraanyangpernahdiraih.text,
                    '10pa': pa10.text,
                    '10pi': pi10.text,
                    '11pa': pa11.text,
                    '11pi': pi11.text,
                    '12pa': pa12.text,
                    '12pi': pi12.text,
                  }).whenComplete(() {
                    Navigator.pop(
                      context,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Data berhasil diperbarui!'),
                      backgroundColor: Color(0xff142D4C),
                    ));
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Inputan tidak boleh kosong!'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const Text(
                "Simpan",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Tentang jurusan',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    maxLength: null,
                    maxLines: null,
                    controller: tentangjurusan,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: tentangjurusan.clear,
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
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Kejuaraan yang pernah diraih',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    maxLength: null,
                    maxLines: null,
                    controller: kejuaraanyangpernahdiraih,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: kejuaraanyangpernahdiraih.clear,
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
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Kelas 10',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    controller: pa10,
                    decoration: InputDecoration(
                      labelText: 'Putra :',
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: pa10.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      fillColor: const Color(0xffD7E9F7),
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Putra :',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    controller: pi10,
                    decoration: InputDecoration(
                      labelText: 'Putri :',
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: pi10.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      fillColor: const Color(0xffD7E9F7),
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Putri :',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Kelas 11',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    controller: pa11,
                    decoration: InputDecoration(
                      labelText: 'Putra :',
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: pa11.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      fillColor: const Color(0xffD7E9F7),
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Putra :',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    controller: pi11,
                    decoration: InputDecoration(
                      labelText: 'Putri :',
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: pi11.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      fillColor: const Color(0xffD7E9F7),
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'Putri :',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        'Kelas 12',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  child: TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    controller: pa12,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: pa12.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      fillColor: const Color(0xffD7E9F7),
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),
                      labelText: 'Putra :',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: 'Putra :',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  child: TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    controller: pi12,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: pi12.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      fillColor: const Color(0xffD7E9F7),
                      filled: true,
                      contentPadding: const EdgeInsets.all(20),
                      labelText: 'Putri :',
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: 'Putri :',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xff142D4C))),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
