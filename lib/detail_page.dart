// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  //required artinya paramter wajib diisi saat dipanggil di halaman lain
  DetailPage({
    Key? key,
    required this.tim1,
    required this.tim2,
    required this.tanggal,
    required this.skor1,
    required this.skor2,
  }) : super(key: key);

  String tim1;
  String tim2;

  String tanggal;
  String skor1;
  String skor2;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //menampilkan nama

          //menampilkan alamat
          Text(widget.tanggal),
          Text(widget.tim1),
          Text(widget.tim2),
          Text(widget.skor1),
          Text(widget.skor2),
        ],
      )),
    );
  }
}
