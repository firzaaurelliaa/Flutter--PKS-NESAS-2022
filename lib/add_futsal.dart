// ignore_for_file: must_be_immutable, non_constant_identifier_names, nullable_type_in_catch_clause, unused_element, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddFutsal extends StatefulWidget {
  const AddFutsal({Key? key}) : super(key: key);

  @override
  _AddFutsalState createState() => _AddFutsalState();
}

class _AddFutsalState extends State<AddFutsal> {
  final _formKey = GlobalKey<FormState>();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('cabor').snapshots();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 10), () {
      controller.success();
    });
  }

  TextEditingController tim1 = TextEditingController();
  TextEditingController tim2 = TextEditingController();
  TextEditingController skor1 = TextEditingController();
  TextEditingController skor2 = TextEditingController();

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
                          'Tambah list futsal',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff142D4C)),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: tim1,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: 'Cth. OTKP',
                            labelText: 'Tim 1 :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
                            suffixIcon: IconButton(
                              onPressed: tim1.clear,
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
                              return 'Nama tim tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: tim2,
                          maxLength: 4,
                          decoration: InputDecoration(
                            hintText: 'Cth. RPL',
                            labelText: 'Tim 2 :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
                            suffixIcon: IconButton(
                              onPressed: tim2.clear,
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
                              return 'Nama tim tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: skor1,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: 'Skor tim 1 :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
                            suffixIcon: IconButton(
                              onPressed: skor1.clear,
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
                              return 'Skor main tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          //memberikan identitas untuk setiap form
                          controller: skor2,
                          keyboardType: const TextInputType.numberWithOptions(),
                          maxLength: 2,
                          decoration: InputDecoration(
                            labelText: 'Skor tim 2 :',
                            labelStyle:
                                const TextStyle(color: Color(0xff142D4C)),
                            suffixIcon: IconButton(
                              onPressed: skor2.clear,
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
                              return 'Skor Menang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        // Center(
                        //     child: Container(
                        //         constraints: BoxConstraints(maxWidth: 600),
                        //         child: DateTimeForm())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            image != null
                                ? SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.file(
                                      image!,
                                    ),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    child: const Center(
                                        child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'Belum ada foto',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff142D4C)),
                                            ))),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff142D4C)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                            const SizedBox(
                              width: 5,
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
                        const SizedBox(height: 15),
                        const SizedBox(height: 30),
                        RoundedLoadingButton(
                          color: const Color(0xff142D4C),
                          // successColor: const Color(0xff142D4C),
                          controller: _btnController2,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              FirebaseStorage.instance
                                  .ref(
                                      "logoAddFutsal/${DateTime.now().microsecondsSinceEpoch}")
                                  .putFile(File(image!.path))
                                  .then(
                                (image) async {
                                  String imageUrl =
                                      await image.ref.getDownloadURL();
                                  FirebaseFirestore.instance
                                      .collection("cabor")
                                      .add({
                                    'futsal': {
                                      "logo1": imageUrl,
                                      "logo2": imageUrl,
                                      "tim1": tim1.text,
                                      "tim2": tim2.text,
                                      "skor1": skor1.text,
                                      "skor2": skor2.text,
                                    }
                                  });
                                },
                              ).then((value) => Navigator.pop(context));
                            }
                          },
                          valueColor: Colors.white,
                          borderRadius: 10,
                          child: const Text('''Simpan''',
                              style: TextStyle(
                                  color: Colors.white,
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
