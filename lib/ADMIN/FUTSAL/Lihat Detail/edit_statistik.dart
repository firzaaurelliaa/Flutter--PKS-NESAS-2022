// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditStatistik extends StatefulWidget {
  DocumentSnapshot docid;
  final String id;
  EditStatistik({Key? key, required this.docid, required this.id})
      : super(key: key);

  @override
  _EditStatistikState createState() => _EditStatistikState();
}

class _EditStatistikState extends State<EditStatistik> {
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  TextEditingController tim1tendangankegawang = TextEditingController();
  TextEditingController tim1penguasaanbola = TextEditingController();
  TextEditingController tim1pelanggaran = TextEditingController();
  TextEditingController tim1kartukuning = TextEditingController();
  TextEditingController tim1kartumerah = TextEditingController();
  TextEditingController tim1tendangan = TextEditingController();
  TextEditingController tim2tendangankegawang = TextEditingController();
  TextEditingController tim2penguasaanbola = TextEditingController();
  TextEditingController tim2pelanggaran = TextEditingController();
  TextEditingController tim2kartukuning = TextEditingController();
  TextEditingController tim2kartumerah = TextEditingController();
  TextEditingController tim2tendangan = TextEditingController();

  @override
  void initState() {
    tim1tendangankegawang = TextEditingController(
        text: widget.docid.get('tim1')['tendanganKeGawang']);
    tim1penguasaanbola =
        TextEditingController(text: widget.docid.get('tim1')['penguasaanBola']);
    tim1pelanggaran =
        TextEditingController(text: widget.docid.get('tim1')['pelanggaran']);
    tim1kartukuning =
        TextEditingController(text: widget.docid.get('tim1')['kartuKuning']);
    tim1kartumerah =
        TextEditingController(text: widget.docid.get('tim1')['kartuMerah']);
    tim1tendangan =
        TextEditingController(text: widget.docid.get('tim1')['tendangan']);
    tim2tendangankegawang = TextEditingController(
        text: widget.docid.get('tim2')['tendanganKeGawang']);
    tim2penguasaanbola =
        TextEditingController(text: widget.docid.get('tim2')['penguasaanBola']);
    tim2pelanggaran =
        TextEditingController(text: widget.docid.get('tim2')['pelanggaran']);
    tim2kartukuning =
        TextEditingController(text: widget.docid.get('tim2')['kartuKuning']);
    tim2kartumerah =
        TextEditingController(text: widget.docid.get('tim2')['kartuMerah']);
    tim2tendangan =
        TextEditingController(text: widget.docid.get('tim2')['tendangan']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
      ),
      // untuk membuat form input tambahakan widget form()
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, top: 30),
            child: const Text(
              'Tim 1',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff142D4C)),
            ),
          ),
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: false,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim1tendangankegawang,
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/images/shotson.png'),
                      ),
                      labelText: 'Tendangan ke gawang :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: tim1tendangankegawang.clear,
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
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim1penguasaanbola,
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/images/ballpo.png'),
                      ),
                      labelText: 'Penguasaan bola :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: tim1penguasaanbola.clear,
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
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim1pelanggaran,
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/images/fouls.png',
                          color: Colors.black,
                        ),
                      ),
                      labelText: 'Pelanggaran :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: tim1pelanggaran.clear,
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
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim1kartukuning,
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/images/yellow.png'),
                      ),
                      labelText: 'Kartu kuning :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: tim1kartukuning.clear,
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
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim1kartumerah,
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/images/red.png'),
                      ),
                      labelText: 'Kartu merah :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: tim1kartumerah.clear,
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
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim1tendangan,
                    decoration: InputDecoration(
                      icon: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/images/shots.png'),
                      ),
                      labelText: 'Tendangan :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: tim1tendangan.clear,
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
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Tim 2',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff142D4C)),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        toolbarOptions: const ToolbarOptions(
                          copy: true,
                          cut: false,
                          paste: false,
                          selectAll: true,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: tim2tendangankegawang,
                        decoration: InputDecoration(
                          icon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/images/shotson.png'),
                          ),
                          labelText: 'Tendangan ke gawang :',
                          labelStyle: const TextStyle(color: Color(0xff142D4C)),
                          suffixIcon: IconButton(
                            onPressed: tim2tendangankegawang.clear,
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
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        toolbarOptions: const ToolbarOptions(
                          copy: true,
                          cut: false,
                          paste: false,
                          selectAll: true,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        maxLength: 3,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: tim2penguasaanbola,
                        decoration: InputDecoration(
                          icon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/images/ballpo.png'),
                          ),
                          labelText: 'Penguasaan bola :',
                          labelStyle: const TextStyle(color: Color(0xff142D4C)),
                          suffixIcon: IconButton(
                            onPressed: tim2penguasaanbola.clear,
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
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        toolbarOptions: const ToolbarOptions(
                          copy: true,
                          cut: false,
                          paste: false,
                          selectAll: true,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: tim2pelanggaran,
                        decoration: InputDecoration(
                          icon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                              'assets/images/fouls.png',
                              color: Colors.black,
                            ),
                          ),
                          labelText: 'Pelanggaran :',
                          labelStyle: const TextStyle(color: Color(0xff142D4C)),
                          suffixIcon: IconButton(
                            onPressed: tim2pelanggaran.clear,
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
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        toolbarOptions: const ToolbarOptions(
                          copy: true,
                          cut: false,
                          paste: false,
                          selectAll: true,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: tim2kartukuning,
                        decoration: InputDecoration(
                          icon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/images/yellow.png'),
                          ),
                          labelText: 'Kartu kuning :',
                          labelStyle: const TextStyle(color: Color(0xff142D4C)),
                          suffixIcon: IconButton(
                            onPressed: tim2kartukuning.clear,
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
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        toolbarOptions: const ToolbarOptions(
                          copy: true,
                          cut: false,
                          paste: false,
                          selectAll: true,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: tim2kartumerah,
                        decoration: InputDecoration(
                          icon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/images/red.png'),
                          ),
                          labelText: 'Kartu merah :',
                          labelStyle: const TextStyle(color: Color(0xff142D4C)),
                          suffixIcon: IconButton(
                            onPressed: tim2kartumerah.clear,
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
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        toolbarOptions: const ToolbarOptions(
                          copy: true,
                          cut: false,
                          paste: false,
                          selectAll: true,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(),
                        maxLength: 2,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: tim2tendangan,
                        decoration: InputDecoration(
                          icon: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset('assets/images/shots.png'),
                          ),
                          labelText: 'Tendangan :',
                          labelStyle: const TextStyle(color: Color(0xff142D4C)),
                          suffixIcon: IconButton(
                            onPressed: tim2tendangan.clear,
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
                      ),
                      const SizedBox(height: 15),
                      RoundedLoadingButton(
                        color: const Color(0xff142D4C),
                        controller: _btnController2,
                        onPressed: () {
                          if (tim1tendangankegawang.text.isNotEmpty &&
                              tim1tendangan.text.isNotEmpty &&
                              tim1pelanggaran.text.isNotEmpty &&
                              tim1penguasaanbola.text.isNotEmpty &&
                              tim1kartumerah.text.isNotEmpty &&
                              tim1kartukuning.text.isNotEmpty &&
                              tim2tendangankegawang.text.isNotEmpty &&
                              tim2tendangan.text.isNotEmpty &&
                              tim2pelanggaran.text.isNotEmpty &&
                              tim2penguasaanbola.text.isNotEmpty &&
                              tim2kartumerah.text.isNotEmpty &&
                              tim2kartukuning.text.isNotEmpty) {
                            FirebaseFirestore.instance
                                .collection('statistikPertandingan')
                                .doc(widget.id)
                                .update({
                              'tim1': {
                                'tendanganKeGawang': tim1tendangankegawang.text,
                                'tendangan': tim1tendangan.text,
                                'penguasaanBola': tim1penguasaanbola.text,
                                'pelanggaran': tim1pelanggaran.text,
                                'kartuKuning': tim1kartukuning.text,
                                'kartuMerah': tim1kartumerah.text,
                              },
                              'tim2': {
                                'tendanganKeGawang': tim2tendangankegawang.text,
                                'tendangan': tim2tendangan.text,
                                'penguasaanBola': tim2penguasaanbola.text,
                                'pelanggaran': tim2pelanggaran.text,
                                'kartuKuning': tim2kartukuning.text,
                                'kartuMerah': tim2kartumerah.text,
                              }
                            }).whenComplete(() {
                              Navigator.pop(
                                context,
                              );
                            });
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  'Inputan tidak boleh kosong! Harap kembali'),
                              backgroundColor: Color(0xff142D4C),
                            ));
                          }
                        },
                        valueColor: Colors.white,
                        borderRadius: 10,
                        child: const Text('''Simpan''',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
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
