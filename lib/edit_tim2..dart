// ignore_for_file: avoid_print, unused_field, camel_case_types, must_be_immutable, prefer_const_constructors, unnecessary_null_comparison, avoid_unnecessary_containers

import 'dart:io';

import 'package:akhir/add_klasemen_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

enum MediaType {
  image,
  video,
}

class edittim2 extends StatefulWidget {
  DocumentSnapshot docid;
  String imageUrl;
  edittim2({Key? key, required this.docid, required this.imageUrl})
      : super(key: key);

  @override
  _edittim2State createState() => _edittim2State();
}

class _edittim2State extends State<edittim2> {
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  TextEditingController nopemain = TextEditingController();
  TextEditingController namapemain = TextEditingController();
  TextEditingController posisipemain = TextEditingController();
  TextEditingController tim1 = TextEditingController();
  final MediaType _mediaType = MediaType.image;
  XFile? file;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  File? image;

  @override
  void initState() {
    nopemain =
        TextEditingController(text: widget.docid.get('tim2')['noPemain']);
    namapemain =
        TextEditingController(text: widget.docid.get('tim2')['namaPemain']);
    posisipemain =
        TextEditingController(text: widget.docid.get('tim2')['posisiPemain']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pop(context);
              });
            },
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // untuk membuat form input tambahakan widget form()
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 25, top: 30),
            child: const Text(
              'Edit hh',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff142D4C)),
            ),
          ),
          Form(
            // key adalah kunci unik untuk mengidentifikasi suatu form
            // di bawah key ini tambahkan widget sesuai selera kalian
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextFormField(
                  //   maxLength: 4,
                  //   maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  //   controller: namapemain,
                  //   decoration: InputDecoration(
                  //     labelText: 'Nama tim :',
                  //     labelStyle: const TextStyle(color: Color(0xff142D4C)),
                  //     suffixIcon: IconButton(
                  //       onPressed: namapemain.clear,
                  //       icon: const Icon(Icons.clear),
                  //       color: const Color(0xff142D4C),
                  //     ),
                  //     focusedBorder: const OutlineInputBorder(
                  //       borderSide: BorderSide(color: Color(0xff142D4C)),
                  //     ),
                  //     border: const OutlineInputBorder(
                  //       borderSide: BorderSide(),
                  //     ),
                  //   ),
                  //   //memberikan validasi jika form kosong
                  //   // validator: (value) {
                  //   //   if (value!.isEmpty) {
                  //   //     return 'Tendangan ke gawang tidak boleh kosong';
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  const SizedBox(height: 15),
                  TextFormField(
                    maxLength: 13,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: namapemain,
                    decoration: InputDecoration(
                      labelText: 'Nama pemain :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: namapemain.clear,
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Penguasaan bola tidak boleh kosong';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    maxLength: 12,
                    controller: posisipemain,
                    decoration: InputDecoration(
                      labelText: 'Posisi pemain :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: posisipemain.clear,
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Pelanggaran tidak boleh kosong';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: nopemain,
                    decoration: InputDecoration(
                      labelText: 'No punggung:',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: nopemain.clear,
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Kartu kuning tidak boleh kosong';
                    //   }
                    //   return null;
                    // },
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          image != null
                              ? Container(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(
                                      image!,
                                    ),
                                  ),
                                )
                              : widget.imageUrl != null
                                  ? Container(
                                      child: SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: Image.network(widget.imageUrl),
                                      ),
                                    )
                                  : Container(),
                        ],
                      ),
                      IconButton(
                          onPressed: () async {
                            File? _images = await getImageGallery();
                            if (_images != null) {
                              setState(() {
                                image = _images;
                              });
                            }
                          },
                          icon: const Icon(Icons.add, size: 40)),
                    ],
                  ),

                  const SizedBox(height: 30),

                  RoundedLoadingButton(
                    color: const Color(0xff142D4C),
                    // successColor: const Color(0xff142D4C),
                    controller: _btnController2,
                    onPressed: () async {
                      if (image == null && widget.imageUrl == "") {
                        return;
                      }
                      if (image != null) {
                        File imageFile = File(image!.path);
                        print('path : ' + image!.path);
                        try {
                          final firebaseStorageRef = await firebaseStorage
                              .ref("timFutsal")
                              .child('tim1_' + widget.docid.id)
                              .putFile(imageFile);
                          final fileUrl =
                              await firebaseStorageRef.ref.getDownloadURL();
                          print(fileUrl);
                          widget.docid.reference.update({
                            'tim1': {
                              'namaPemain': namapemain.text,
                              'noPemain': nopemain.text,
                              'posisiPemain': posisipemain.text,
                              'fotoPemain': fileUrl,
                            },
                          });
                        } on FirebaseException catch (e) {
                          print(e);
                        } catch (error) {
                          print(error);
                        }

                        // .whenComplete(() {

                        setState(() {});
                        Navigator.pop(
                          context,
                        );
                        // });
                      } else {
                        widget.docid.reference.update({
                          'tim1': {
                            'namaPemain': namapemain.text,
                            'noPemain': nopemain.text,
                            'posisiPemain': posisipemain.text,
                            'fotoPemain': widget.imageUrl,
                          },
                        });
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
