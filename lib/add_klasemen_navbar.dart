// ignore_for_file: must_be_immutable, non_constant_identifier_names, nullable_type_in_catch_clause, sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddKlasemenNavbar extends StatefulWidget {
  const AddKlasemenNavbar({Key? key}) : super(key: key);

  @override
  _AddKlasemenNavbarState createState() => _AddKlasemenNavbarState();
}

class _AddKlasemenNavbarState extends State<AddKlasemenNavbar> {
  final _formKey = GlobalKey<FormState>();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('klasemen').snapshots();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  TextEditingController no = TextEditingController();
  TextEditingController jurusan = TextEditingController();
  TextEditingController main = TextEditingController();
  TextEditingController menang = TextEditingController();
  TextEditingController seri = TextEditingController();
  TextEditingController kalah = TextEditingController();
  TextEditingController poin = TextEditingController();

  File? image;
  var index;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff142D4C),
              elevation: 0,
            ),
            body: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tambah klasemen',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff142D4C)),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: no,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 3,
                          decoration: InputDecoration(
                            hintText: 'Cth. 1.',
                            labelText: 'No :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
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
                              return 'Nomor tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: jurusan,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: 'Cth. RPL',
                            labelText: 'Jurusan :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
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
                              return 'Jurusan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: main,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: 'Main :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
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
                              return 'Jumlah main tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: menang,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: 'Menang :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
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
                              return 'Jumlah Menang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: seri,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: 'Seri :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
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
                              return 'Jumlah seri tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: kalah,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: 'Kalah :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
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
                              return 'Jumlah kalah tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: poin,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: 'Poin :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
                            suffixIcon: IconButton(
                              onPressed: poin.clear,
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
                              return ' Jumlah poin tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        // IconButton(
                        //     onPressed: () async {
                        //       File? _images = await getImageGallery();
                        //       if (_images != null) {
                        //         setState(() {
                        //           image = _images;
                        //         });
                        //       }
                        //     },
                        //     icon: const Icon(Icons.add, size: 40)),
                        // const SizedBox(height: 15),
                        // Row(
                        //   children: [
                        //     image != null
                        //         ? Container(
                        //             width: 100,
                        //             height: 100,
                        //             child: Image.file(
                        //               image!,
                        //             ),
                        //           )
                        //         : Container(),
                        //     const SizedBox(
                        //       width: 5,
                        //     ),
                        //   ],
                        // ),
                        RoundedLoadingButton(
                          color: const Color(0xff142D4C),
                          // successColor: const Color(0xff142D4C),
                          controller: _btnController2,
                          onPressed: () async {
                            if (no.text.isNotEmpty &&
                                jurusan.text.isNotEmpty &&
                                main.text.isNotEmpty &&
                                menang.text.isNotEmpty &&
                                seri.text.isNotEmpty &&
                                kalah.text.isNotEmpty &&
                                poin.text.isNotEmpty) {
                              FirebaseFirestore.instance
                                  .collection("klasemen")
                                  .add({
                                // "logo": imageUrl,
                                "no": no.text,
                                "jurusan": jurusan.text,
                                "main": main.text,
                                "menang": menang.text,
                                "seri": seri.text,
                                "kalah": kalah.text,
                                "poin": poin.text,
                              }).whenComplete(() {
                                Navigator.pop(
                                  context,
                                );
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    'Inputan tidak boleh kosong, silahkan kembali'),
                                backgroundColor: Color(0xff142D4C),
                              ));
                              setState(() {});
                              // .whenComplete(() {

                              Navigator.pop(
                                context,
                              );
                            }
                          },
                          // onPressed: () async {
                          //   FirebaseFirestore.instance
                          //       .collection('cabor')
                          //       .doc(widget.id)
                          //       .set({
                          //     'futsal': {
                          //       'skor1': skor1.text,
                          //       'skor2': skor2.text,
                          //       // 'tanggal': tanggal.text,
                          //       'tim1': tim1.text,
                          //       'tim2': tim2.text,

                          //       // 'tanggalPertandingan' : ,
                          //     },
                          //   }, SetOptions(merge: true));
                          //   // widget.docid.reference.update({
                          //   //   'futsal': {
                          //   //     'skor1': skor1.text,
                          //   //     'skor2': skor2.text,
                          //   //     // 'tanggal': tanggal.text,
                          //   //     'tim1': tim1.text,
                          //   //     'tim2': tim2.text,
                          //   //     'logo1': image,
                          //   //     'logo2': image2,
                          //   //     // 'tanggalPertandingan' : ,
                          //   //   },
                          //   // });

                          //   await uploadImage();
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //     content: Text(
                          //       "Data telah diperbarui!",
                          //       style: TextStyle(color: Colors.white),
                          //     ),
                          //     backgroundColor: Color(0xff142D4C),
                          //   ));

                          //   setState(() {});
                          //   // .whenComplete(() {

                          //   Navigator.pop(
                          //     context,
                          //   );
                          //   // });
                          // },
                          valueColor: Colors.white,
                          borderRadius: 10,
                          child: const Text('''Simpan''',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff142D4C),
                                onPrimary: Colors.grey,
                              ),
                              onPressed: () {
                                if (no.text.isNotEmpty &&
                                    jurusan.text.isNotEmpty &&
                                    main.text.isNotEmpty &&
                                    menang.text.isNotEmpty &&
                                    seri.text.isNotEmpty &&
                                    kalah.text.isNotEmpty &&
                                    poin.text.isNotEmpty) {
                                  FirebaseFirestore.instance
                                      .collection("klasemen")
                                      .add({
                                    // "logo": imageUrl,
                                    "no": no.text,
                                    "jurusan": jurusan.text,
                                    "main": main.text,
                                    "menang": menang.text,
                                    "seri": seri.text,
                                    "kalah": kalah.text,
                                    "poin": poin.text,
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        'Inputan tidak boleh kosong, silahkan kembali'),
                                    backgroundColor: Color(0xff142D4C),
                                  ));
                                  setState(() {});
                                  // .whenComplete(() {

                                  Navigator.pop(
                                    context,
                                  );
                                }
                              },
                              // onPressed: () {
                              //   FirebaseStorage.instance
                              //       .ref("")
                              //       // .ref("${jurusan.text}.png")
                              //       .putFile(File(image!.path))
                              //       .then(
                              //     (image) async {
                              //       String imageUrl =
                              //           await image.ref.getDownloadURL();
                              //       FirebaseFirestore.instance
                              //           .collection("klasemenNavbar")
                              //           .add({
                              //         "logo": imageUrl,
                              //         "no": no.text,
                              //         "jurusan": jurusan.text,
                              //         "main": main.text,
                              //         "menang": menang.text,
                              //         "seri": seri.text,
                              //         "kalah": kalah.text,
                              //         "poin": poin.text,
                              //       });
                              //     },
                              //   );
                              // },
                              child: const Text(
                                'Simpan',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
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

        // untuk membuat form input tambahakan widget form()

        );
  }
}

// class PickImage {
//   final ImagePicker _picker = ImagePicker();
//   Future<XFile?> pickImage({required ImageSource source}) async {
//     try {
//       final XFile? image = await _picker.pickImage(source: source);
//       if (image == null) return null;
//       final imageTemp = XFile(image.path);
//       return imageTemp;
//     } on PlatformException catch (e) {
//       print("Failed to pick image $e");
//     }
//   }
// }

Future<File?> getImageGallery() async {
  ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}
