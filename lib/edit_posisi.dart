// import 'dart:html';

// ignore_for_file: must_be_immutable

import 'package:akhir/pilihan_atas.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPosisiAkl extends StatefulWidget {
  DocumentSnapshot docid;
  EditPosisiAkl({Key? key, required this.docid}) : super(key: key);

  @override
  _EditPosisiAklState createState() => _EditPosisiAklState();
}

class _EditPosisiAklState extends State<EditPosisiAkl> {
  TextEditingController futsalposisike = TextEditingController();
  TextEditingController futsalpoin = TextEditingController();
  TextEditingController futsalmain = TextEditingController();
  TextEditingController futsalmenang = TextEditingController();
  TextEditingController futsalseri = TextEditingController();
  TextEditingController futsalkalah = TextEditingController();
  TextEditingController basketposisike = TextEditingController();
  TextEditingController basketpoin = TextEditingController();
  TextEditingController basketmain = TextEditingController();
  TextEditingController basketmenang = TextEditingController();
  TextEditingController basketseri = TextEditingController();
  TextEditingController basketkalah = TextEditingController();
  TextEditingController voliposisike = TextEditingController();
  TextEditingController volipoin = TextEditingController();
  TextEditingController volimain = TextEditingController();
  TextEditingController volimenang = TextEditingController();
  TextEditingController voliseri = TextEditingController();
  TextEditingController volikalah = TextEditingController();
  TextEditingController caturposisike = TextEditingController();
  TextEditingController caturpoin = TextEditingController();
  TextEditingController caturmain = TextEditingController();
  TextEditingController caturmenang = TextEditingController();
  TextEditingController caturseri = TextEditingController();
  TextEditingController caturkalah = TextEditingController();
  TextEditingController bulutangkisposisike = TextEditingController();
  TextEditingController bulutangkispoin = TextEditingController();
  TextEditingController bulutangkismain = TextEditingController();
  TextEditingController bulutangkismenang = TextEditingController();
  TextEditingController bulutangkisseri = TextEditingController();
  TextEditingController bulutangkiskalah = TextEditingController();
  TextEditingController tenismejaposisike = TextEditingController();
  TextEditingController tenismejapoin = TextEditingController();
  TextEditingController tenismejamain = TextEditingController();
  TextEditingController tenismejamenang = TextEditingController();
  TextEditingController tenismejaseri = TextEditingController();
  TextEditingController tenismejakalah = TextEditingController();

  @override
  void initState() {
    futsalposisike =
        TextEditingController(text: widget.docid.get('futsal')['posisiKe']);
    futsalpoin =
        TextEditingController(text: widget.docid.get('futsal')['poin']);
    futsalmain =
        TextEditingController(text: widget.docid.get('futsal')['main']);
    futsalmenang =
        TextEditingController(text: widget.docid.get('futsal')['menang']);
    futsalseri =
        TextEditingController(text: widget.docid.get('futsal')['seri']);
    futsalkalah =
        TextEditingController(text: widget.docid.get('futsal')['kalah']);
    basketposisike =
        TextEditingController(text: widget.docid.get('basket')['posisiKe']);
    basketpoin =
        TextEditingController(text: widget.docid.get('basket')['poin']);
    basketmain =
        TextEditingController(text: widget.docid.get('basket')['main']);
    basketmenang =
        TextEditingController(text: widget.docid.get('basket')['menang']);
    basketseri =
        TextEditingController(text: widget.docid.get('basket')['seri']);
    basketkalah =
        TextEditingController(text: widget.docid.get('basket')['kalah']);
    voliposisike =
        TextEditingController(text: widget.docid.get('voli')['posisiKe']);
    volipoin = TextEditingController(text: widget.docid.get('voli')['poin']);
    volimain = TextEditingController(text: widget.docid.get('voli')['main']);
    volimenang =
        TextEditingController(text: widget.docid.get('voli')['menang']);
    voliseri = TextEditingController(text: widget.docid.get('voli')['seri']);
    volikalah = TextEditingController(text: widget.docid.get('voli')['kalah']);
    caturposisike =
        TextEditingController(text: widget.docid.get('catur')['posisiKe']);
    caturpoin = TextEditingController(text: widget.docid.get('catur')['poin']);
    caturmain = TextEditingController(text: widget.docid.get('catur')['main']);
    caturmenang =
        TextEditingController(text: widget.docid.get('catur')['menang']);
    caturseri = TextEditingController(text: widget.docid.get('catur')['seri']);
    caturkalah =
        TextEditingController(text: widget.docid.get('catur')['kalah']);
    bulutangkisposisike = TextEditingController(
        text: widget.docid.get('bulutangkis')['posisiKe']);
    bulutangkispoin =
        TextEditingController(text: widget.docid.get('bulutangkis')['poin']);
    bulutangkismain =
        TextEditingController(text: widget.docid.get('bulutangkis')['main']);
    bulutangkismenang =
        TextEditingController(text: widget.docid.get('bulutangkis')['menang']);
    bulutangkisseri =
        TextEditingController(text: widget.docid.get('bulutangkis')['seri']);
    bulutangkiskalah =
        TextEditingController(text: widget.docid.get('bulutangkis')['kalah']);
    tenismejaposisike =
        TextEditingController(text: widget.docid.get('tenismeja')['posisiKe']);
    tenismejapoin =
        TextEditingController(text: widget.docid.get('tenismeja')['poin']);
    tenismejamain =
        TextEditingController(text: widget.docid.get('tenismeja')['main']);
    tenismejamenang =
        TextEditingController(text: widget.docid.get('tenismeja')['menang']);
    tenismejaseri =
        TextEditingController(text: widget.docid.get('tenismeja')['seri']);
    tenismejakalah =
        TextEditingController(text: widget.docid.get('tenismeja')['kalah']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: TextButton(
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
        actions: [
          MaterialButton(
            onPressed: () {
              if (futsalposisike.text.isNotEmpty &&
                  futsalmain.text.isNotEmpty &&
                  futsalpoin.text.isNotEmpty &&
                  futsalmenang.text.isNotEmpty &&
                  futsalseri.text.isNotEmpty &&
                  futsalkalah.text.isNotEmpty &&
                  basketposisike.text.isNotEmpty &&
                  basketmain.text.isNotEmpty &&
                  basketpoin.text.isNotEmpty &&
                  basketmenang.text.isNotEmpty &&
                  basketseri.text.isNotEmpty &&
                  basketkalah.text.isNotEmpty &&
                  voliposisike.text.isNotEmpty &&
                  volimain.text.isNotEmpty &&
                  volipoin.text.isNotEmpty &&
                  volimenang.text.isNotEmpty &&
                  voliseri.text.isNotEmpty &&
                  volikalah.text.isNotEmpty &&
                  caturposisike.text.isNotEmpty &&
                  caturmain.text.isNotEmpty &&
                  caturpoin.text.isNotEmpty &&
                  caturmenang.text.isNotEmpty &&
                  caturseri.text.isNotEmpty &&
                  caturkalah.text.isNotEmpty &&
                  bulutangkisposisike.text.isNotEmpty &&
                  bulutangkismain.text.isNotEmpty &&
                  bulutangkispoin.text.isNotEmpty &&
                  bulutangkismenang.text.isNotEmpty &&
                  bulutangkisseri.text.isNotEmpty &&
                  bulutangkiskalah.text.isNotEmpty &&
                  tenismejaposisike.text.isNotEmpty &&
                  tenismejamain.text.isNotEmpty &&
                  tenismejapoin.text.isNotEmpty &&
                  tenismejamenang.text.isNotEmpty &&
                  tenismejaseri.text.isNotEmpty &&
                  tenismejakalah.text.isNotEmpty) {
                widget.docid.reference.update({
                  'futsal': {
                    'posisiKe': futsalposisike.text,
                    'poin': futsalpoin.text,
                    'main': futsalmain.text,
                    'menang': futsalmenang.text,
                    'seri': futsalseri.text,
                    'kalah': futsalkalah.text,
                  },
                  'basket': {
                    'posisiKe': basketposisike.text,
                    'poin': basketpoin.text,
                    'main': basketmain.text,
                    'menang': basketmenang.text,
                    'seri': basketseri.text,
                    'kalah': basketkalah.text,
                  },
                  'voli': {
                    'posisiKe': voliposisike.text,
                    'poin': volipoin.text,
                    'main': volimain.text,
                    'menang': volimenang.text,
                    'seri': voliseri.text,
                    'kalah': volikalah.text,
                  },
                  'catur': {
                    'posisiKe': caturposisike.text,
                    'poin': caturpoin.text,
                    'main': caturmain.text,
                    'menang': caturmenang.text,
                    'seri': caturseri.text,
                    'kalah': caturkalah.text,
                  },
                  'bulutangkis': {
                    'posisiKe': bulutangkisposisike.text,
                    'poin': bulutangkispoin.text,
                    'main': bulutangkismain.text,
                    'menang': bulutangkismenang.text,
                    'seri': bulutangkisseri.text,
                    'kalah': bulutangkiskalah.text,
                  },
                  'tenismeja': {
                    'posisiKe': tenismejaposisike.text,
                    'poin': tenismejapoin.text,
                    'main': tenismejamain.text,
                    'menang': tenismejamenang.text,
                    'seri': tenismejaseri.text,
                    'kalah': tenismejakalah.text,
                  }
                }).whenComplete(() {
                  Navigator.pop(
                    context,
                  );
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Inputan tidak boleh kosong, silahkan kembali'),
                  backgroundColor: Color(0xff142D4C),
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
                      'Futsal',
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
                  maxLength: 35,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: futsalposisike,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: futsalposisike.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Cth. Futsal : Posisi Ke-1',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: futsalpoin,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: futsalpoin.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Poin :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: futsalmain,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: futsalmain.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Main :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: futsalmenang,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: futsalmenang.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Menang :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: futsalseri,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: futsalseri.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Seri :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: futsalkalah,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: futsalkalah.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Kalah :',
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
                      'Basket',
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
                  maxLength: 35,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: basketposisike,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: basketposisike.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Cth. Basket : Posisi Ke-1',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: basketpoin,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: basketpoin.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Poin :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: basketmain,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: basketmain.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Main :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: basketmenang,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: basketmenang.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Menang :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: basketseri,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: basketseri.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Seri :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: basketkalah,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: basketkalah.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Kalah :',
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
                      'Voli',
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
                  maxLength: 35,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: voliposisike,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: voliposisike.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Cth. Voli : Posisi Ke-1',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: volipoin,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: volipoin.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Poin :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: volimain,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: volimain.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Main :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: volimenang,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: volimenang.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Menang :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: voliseri,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: voliseri.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Seri :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: volikalah,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: volikalah.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Kalah :',
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
                      'Catur',
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
                  maxLength: 35,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: caturposisike,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: caturposisike.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Cth. Catur : Posisi Ke-2',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: caturpoin,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: caturpoin.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Poin :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: caturmain,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: caturmain.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Main :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: caturmenang,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: caturmenang.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Menang :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: caturseri,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: caturseri.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Seri :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: caturkalah,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: caturkalah.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Kalah :',
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
                      'Bulutangkis',
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
                  maxLength: 35,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: bulutangkisposisike,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: bulutangkisposisike.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Cth. Bulutangkis : Posisi Ke-1',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: bulutangkispoin,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: bulutangkispoin.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Poin :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: bulutangkismain,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: bulutangkismain.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Main :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: bulutangkismenang,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: bulutangkismenang.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Menang :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: bulutangkisseri,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: bulutangkisseri.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Seri :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: bulutangkiskalah,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: bulutangkiskalah.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Kalah :',
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
                      'Tenis Meja',
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
                  maxLength: 35,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: tenismejaposisike,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: tenismejaposisike.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Cth. Tenis Meja : Posisi Ke-1',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: tenismejapoin,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: tenismejapoin.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Poin :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: tenismejamain,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: tenismejamain.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Main :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: tenismejamenang,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: tenismejamenang.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Menang :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: tenismejaseri,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: tenismejaseri.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Seri :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  maxLength: 2,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: tenismejakalah,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD7E9F7),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    suffixIcon: IconButton(
                      onPressed: tenismejakalah.clear,
                      icon: const Icon(Icons.clear),
                      color: const Color(0xff142D4C),
                    ),
                    hintText: 'Kalah :',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xff142D4C))),
                  ),
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
