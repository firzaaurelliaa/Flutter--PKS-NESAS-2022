// ignore_for_file: must_be_immutable, avoid_print, unused_field

import 'dart:io';

import 'package:akhir/add_klasemen_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

enum MediaType {
  image,
  video,
}

class AddPemain2 extends StatefulWidget {
  const AddPemain2({Key? key}) : super(key: key);

  // DocumentSnapshot docid;
  // AddPemain({Key? key, required this.docid}) : super(key: key);

  @override
  _AddPemain2State createState() => _AddPemain2State();
}

class _AddPemain2State extends State<AddPemain2> {
  final _formKey = GlobalKey<FormState>();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('timFutsal').snapshots();

  TextEditingController nopemain2 = TextEditingController();
  TextEditingController namapemain2 = TextEditingController();
  TextEditingController posisipemain2 = TextEditingController();
  TextEditingController tim1 = TextEditingController();
  final MediaType _mediaType = MediaType.image;
  XFile? file;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('timFutsal');
  File? image;

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
              'Tambah pemain',
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
                  //   controller: tim1,
                  //   decoration: InputDecoration(
                  //     labelText: 'Nama tim :',
                  //     labelStyle: const TextStyle(color: Color(0xff142D4C)),
                  //     suffixIcon: IconButton(
                  //       onPressed: tim1.clear,
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
                    controller: namapemain2,
                    decoration: InputDecoration(
                      labelText: 'Nama pemain :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: namapemain2.clear,
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
                  const SizedBox(height: 30),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    maxLength: 12,
                    controller: posisipemain2,
                    decoration: InputDecoration(
                      labelText: 'Posisi pemain :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: posisipemain2.clear,
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
                    controller: nopemain2,
                    decoration: InputDecoration(
                      labelText: 'No punggung:',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
                      suffixIcon: IconButton(
                        onPressed: nopemain2.clear,
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
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      image != null
                          ? SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff142D4C)),
                            ),
                            child: const Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                            // onPressed: () {
                            //   widget.docid.reference.update({
                            //     'namaPemain': namapemain.text,
                            //     'posisiPemain': posisipemain.text,
                            //     'noPemain': nopemain.text,
                            //   }).whenComplete(() {
                            //     Navigator.pop(
                            //       context,
                            //     );
                            //   });
                            // },
                            onPressed: () async {
                              if (image == null) {
                                return;
                              }
                              // String imageName = image!.name;
                              File imageFile = File(image!.path);
                              print('path : ' + image!.path);
                              try {
                                final firebaseStorageRef = await firebaseStorage
                                    .ref("timFutsal")
                                    .child('tim1_')
                                    .putFile(imageFile);
                                final fileUrl = await firebaseStorageRef.ref
                                    .getDownloadURL();
                                print(fileUrl);
                                ref.add({
                                  'tim2': {
                                    'namaPemain': namapemain2.text,
                                    'noPemain': nopemain2.text,
                                    'posisiPemain': posisipemain2.text,
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
                            },
                          ),
                        ],
                      )
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
