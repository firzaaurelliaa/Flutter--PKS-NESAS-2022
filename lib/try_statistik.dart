// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TryStatistik extends StatelessWidget {
  //required artinya paramter wajib diisi saat dipanggil di halaman lain
  TryStatistik({
    Key? key,
    required this.tim1tendangankegawang,
    required this.tim1penguasaanbola,
    required this.tim1pelanggaran,
    required this.tim1kartukuning,
    required this.tim1kartumerah,
    required this.tim1tendangan,
    required this.tim1skor,
    required this.tim2tendangankegawang,
    required this.tim2penguasaanbola,
    required this.tim2pelanggaran,
    required this.tim2kartukuning,
    required this.tim2kartumerah,
    required this.tim2tendangan,
    required this.tim2skor,
  }) : super(key: key);

  String tim1tendangankegawang;
  String tim1penguasaanbola;
  String tim1pelanggaran;
  String tim1kartukuning;
  String tim1kartumerah;
  String tim1tendangan;
  String tim1skor;
  String tim2tendangankegawang;
  String tim2penguasaanbola;
  String tim2pelanggaran;
  String tim2kartukuning;
  String tim2kartumerah;
  String tim2tendangan;
  String tim2skor;

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
          Text(tim1tendangankegawang),
          //menampilkan alamat
          Text(tim1penguasaanbola),
          Text(tim1pelanggaran),
          Text(tim1kartukuning),
          Text(tim1kartumerah),
          Text(tim1tendangan),
          Text(tim1skor),
          Text(tim2tendangankegawang),

          Text(tim2penguasaanbola),
          Text(tim2pelanggaran),
          Text(tim2kartukuning),
          Text(tim2kartumerah),
          Text(tim2tendangan),
          Text(tim2skor),
        ],
      )),
    );
  }
}
