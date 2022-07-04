// ignore_for_file: must_be_immutable

import 'package:akhir/page_belum_diatur.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditKlasemen extends StatefulWidget {
  DocumentSnapshot docid;

  EditKlasemen({Key? key, required this.docid}) : super(key: key);

  @override
  _EditKlasemenState createState() => _EditKlasemenState();
}

class _EditKlasemenState extends State<EditKlasemen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController no = TextEditingController();
  TextEditingController jurusan = TextEditingController();
  TextEditingController main = TextEditingController();
  TextEditingController menang = TextEditingController();
  TextEditingController seri = TextEditingController();
  TextEditingController kalah = TextEditingController();

  @override
  void initState() {
    no = TextEditingController(text: widget.docid["no"]);
    jurusan = TextEditingController(text: widget.docid["jurusan"]);
    main = TextEditingController(text: widget.docid["main"]);
    menang = TextEditingController(text: widget.docid["menang"]);
    seri = TextEditingController(text: widget.docid["seri"]);
    kalah = TextEditingController(text: widget.docid["kalah"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (const PageBelumDiatur())))
                  },
              icon: const Icon(Icons.access_alarm))
        ],
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
      ),
      // untuk membuat form input tambahakan widget form()
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Image(
                          image: NetworkImage(widget.docid["logo"]),
                        ),
                      ),
                      // const Text(
                      //   'VS',
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 20,
                      //     color: Color(0xff142D4C),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 80,
                      //   height: 80,
                      //   child: Image(
                      //     image: NetworkImage(widget.docid["logo2"]),
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: no,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. Kamis, 20 Februari 2022',
                      labelText: 'No. :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: no.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff142D4C)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    //memberikan validasi jika form kosong
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tanggal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    controller: jurusan,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.people,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. RPL VS OTKP',
                      labelText: 'Jurusan :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: jurusan.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff142D4C)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    //memberikan validasi jika form kosong
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tim tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    controller: main,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.people,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. OTKP',
                      labelText: 'Main :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: main.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff142D4C)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    //memberikan validasi jika form kosong
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tim tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    controller: menang,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. 2',
                      labelText: 'Menang:',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: menang.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff142D4C)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    //memberikan validasi jika form kosong
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Skor tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    controller: seri,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. 1',
                      labelText: 'Seri :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: seri.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff142D4C)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    //memberikan validasi jika form kosong
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Skor tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    controller: kalah,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. 1',
                      labelText: 'Kalah :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: kalah.clear,
                        icon: const Icon(Icons.clear),
                        color: const Color(0xff142D4C),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff142D4C)),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    //memberikan validasi jika form kosong
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Skor tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff142D4C)),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          //jika data lengkap maka kirim data ke halaman selanjutnya
                          // if (_formKey.currentState!.validate()) {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (_) => ListFutsal(
                          //         tim1: tim1.text,
                          //         tim2: tim1.text,
                          //         tanggal: tanggal.text,
                          //         skor1: skor1.text,
                          //         skor2: skor2.text,
                          //       ),
                          //     ),
                          //   );
                          // }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
