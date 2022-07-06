import 'dart:io';
import 'package:akhir/form_list_futsal.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:image_picker/image_picker.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class UbahIklanTanah extends StatefulWidget {
  DocumentSnapshot docid;
  // String imageUrl;
  UbahIklanTanah({
    required this.docid,
    // required this.imageUrl
  });

  @override
  State<UbahIklanTanah> createState() => _UbahIklanTanahState();
}

class _UbahIklanTanahState extends State<UbahIklanTanah> {
  TextEditingController judul = TextEditingController();
  TextEditingController luasTanah = TextEditingController();

  TextEditingController alamatLokasi = TextEditingController();
  TextEditingController harga = TextEditingController();
  TextEditingController controllerSertifikat = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  final kamarmandi = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  final sertifikat = ['SHM', 'AJB'];
  final kamartidur = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  String? value;
  String? value1;
  String? value2;
  XFile? imageFile;
  String? image;

  void initState() {
    judul = TextEditingController(text: widget.docid.get('content'));

    luasTanah = TextEditingController(text: widget.docid.get('title'));

    image = widget.docid.get('logo');
    setState(() {});

    super.initState();
  }

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final users = firestore.collection('notess');

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Iklan Tanah'),
          backgroundColor: Color(0xff141228),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    inputFormatters: [UpperCaseTextFormatter()],
                    maxLength: 50,
                    controller: judul,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff141228)),
                      ),
                      labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                      labelText: 'Judul ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.subtitles,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  TextField(
                    controller: luasTanah,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff141228)),
                      ),
                      labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                      labelText: 'Luas Tanah ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.straighten,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: alamatLokasi,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff141228)),
                      ),
                      labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                      labelText: 'Alamat Lokasi ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.place,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: harga,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff141228)),
                      ),
                      labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                      labelText: 'Harga ',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.straighten,
                          color: Color(0xff5A5A5A),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Sertifikasi',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                        DropdownButton<String>(
                            value: value,
                            items: sertifikat.map(buildMenuItem).toList(),
                            onChanged: (value) =>
                                setState(() => this.value = value)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLength: null,
                    maxLines: null,
                    controller: deskripsi,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff141228)),
                      ),
                      labelStyle: TextStyle(color: Color(0xff5A5A5A)),
                      labelText: 'Deskripsi',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.description,
                        color: Color(0xff5A5A5A),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      imageFile != null
                          ? Container(
                              width: 120,
                              height: 120,
                              child: Image.file(
                                File(imageFile!.path),
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                              ))
                          : image != null
                              ? Container(
                                  width: 120,
                                  height: 120,
                                  child: Image.network(
                                    image!,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ))
                              : Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1)),
                                  child: Center(
                                    child: Text('Masukan Foto'),
                                  ),
                                ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Choose Photo'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          InkWell(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.image,
                                                  size: 40,
                                                ),
                                                Text('Galery')
                                              ],
                                            ),
                                            onTap: () async {
                                              imageFile = await PickImage()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                          ),
                                          InkWell(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.camera,
                                                  size: 40,
                                                ),
                                                Text('Camera')
                                              ],
                                            ),
                                            onTap: () async {
                                              imageFile = await PickImage()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.add,
                            size: 40,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Center(
                          child: ElevatedButton(
                            onPressed: () {
                              FirebaseStorage.instance
                                  .ref("${judul.text}.png")
                                  .putFile(File(imageFile!.path))
                                  .then((image) async {
                                String imageUrl =
                                    await image.ref.getDownloadURL();
                                widget.docid.reference.update({
                                  'content': judul.text,
                                  'title': luasTanah.text,
                                  'fieldGambar': imageUrl,
                                }).then((value) {
                                  Navigator.of(context)..pop();
                                  //
                                });

                                // judul.text = '';
                                // luasTanah.text = '';

                                // alamatLokasi.text = '';

                                // harga.text = '';
                                // deskripsi.text = '';
                                // controllerSertifikat.text = '';
                                // value = '';
                                // value1 = '';
                                // value2 = '';
                              });
                            },
                            //         users.add({

                            //       'title': judul.text,
                            //       'price': int.parse(harga.text),
                            //       'luasTanah': int.parse(luasTanah.text),
                            //       'luasBangunan': int.parse(luasBangunan.text),
                            //       'kamarMandi': value2,
                            //       'kamarTidur': value1,
                            //       'tipe': tipe.text,
                            //       'alamatLokasi': alamatLokasi.text,
                            //       'sumberAir':sumberAir.text,
                            //       'listrik': listrik.text,
                            //       'sertifikat': value,
                            //       'deskripsi': deskripsi.text,

                            //       // 'sertifikat': value,

                            //        });
                            //         judul.text = '';
                            //         luasTanah.text = '';
                            //         luasBangunan.text= '';
                            //         kamarTidur.text = '';
                            //         kamarMandi.text = '';
                            //         tipe.text = '';
                            //         alamatLokasi.text = '';
                            //         sumberAir.text = '';
                            //         listrik.text = '';
                            //         harga.text = '';
                            //         deskripsi.text = '';
                            //         controllerSertifikat.text = '';
                            //         value = '';
                            //         value1 = '';
                            //         value2 = '';

                            //  Navigator.push(
                            //             context,
                            //             MaterialPageRoute(
                            //                 builder: (context) =>
                            //                     (HalamanPostingan())));
                            //       },
                            child: const Text('Lanjut'),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff141228),
                                fixedSize: const Size(240, 44),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                        ),
                ],
              ),
            )
          ],
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 14),
        ),
      );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
