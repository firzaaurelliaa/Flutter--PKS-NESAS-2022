// ignore_for_file: must_be_immutable, non_constant_identifier_names, nullable_type_in_catch_clause, unused_element, prefer_typing_uninitialized_variables, unused_local_variable, avoid_print, unnecessary_const

import 'dart:async';
import 'dart:io';
import 'package:akhir/Admin/FUTSAL/Lihat%20Detail/edit_klasemen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class AddFutsal extends StatefulWidget {
  final String id;
  const AddFutsal({
    Key? key,
    required this.id,
  }) : super(key: key);

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
  File? image2;
  var index;

  final MediaType _mediaType = MediaType.image;

  // XFile? file;
  // XFile? file2;
  // String? imagePath;
  // String? imagePathh;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  // String? image, image2;
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
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: const Text(
                                'Logo 1 :',
                                style: const TextStyle(
                                    color: Color(0xff142D4C),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            image != null
                                ? InkWell(
                                    onTap: () async {
                                      File? _images = await getImageGallery();
                                      if (_images != null) {
                                        setState(() {
                                          image = _images;
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(
                                    width: 100,
                                    height: 100,
                                    child: IconButton(
                                        onPressed: () async {
                                          File? _images =
                                              await getImageGallery();
                                          if (_images != null) {
                                            setState(() {
                                              image = _images;
                                            });
                                          }
                                        },
                                        icon: const Icon(Icons.add, size: 40)),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xff142D4C)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // image == null
                        //     ? IconButton(
                        //         onPressed: () async {
                        //           File? _images =
                        //               await getImageGallery();
                        //           if (_images != null) {
                        //             setState(() {
                        //               image = _images;
                        //             });
                        //           }
                        //         },
                        //         icon: const Icon(Icons.add, size: 40))
                        //     : IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(null)),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: const Text(
                                'Logo 2 :',
                                style: const TextStyle(
                                    color: Color(0xff142D4C),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                File? _images = await getImageGallery2();
                                if (_images != null) {
                                  setState(() {
                                    image2 = _images;
                                  });
                                }
                              },
                              child: image2 != null
                                  ? SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: Image.file(
                                        image2!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : Container(
                                      width: 100,
                                      height: 100,
                                      child: IconButton(
                                          onPressed: () async {
                                            File? _images =
                                                await getImageGallery2();
                                            if (_images != null) {
                                              setState(() {
                                                image2 = _images;
                                              });
                                            }
                                          },
                                          icon:
                                              const Icon(Icons.add, size: 40)),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xff142D4C)),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // image2 == null
                        //     ? IconButton(
                        //         onPressed: () async {
                        //           File? _images =
                        //               await getImageGallery2();
                        //           if (_images != null) {
                        //             setState(() {
                        //               image2 = _images;
                        //             });
                        //           }
                        //         },
                        //         icon: const Icon(Icons.add, size: 40))
                        //     : IconButton(
                        //         onPressed: () {},
                        //         icon: const Icon(null)),
                      ],
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        TextFormField(
                          inputFormatters: [UpperCaseTextFormatter()],
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: false,
                            paste: false,
                            selectAll: true,
                          ),
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
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          inputFormatters: [UpperCaseTextFormatter()],
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: false,
                            paste: false,
                            selectAll: true,
                          ),
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
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: false,
                            paste: false,
                            selectAll: true,
                          ),
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
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            cut: false,
                            paste: false,
                            selectAll: true,
                          ),
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
                        ),
                        const SizedBox(height: 35),
                        RoundedLoadingButton(
                          color: const Color(0xff142D4C),
                          // successColor: const Color(0xff142D4C),
                          controller: _btnController2,
                          onPressed: () async {
                            if (tim1.text.isNotEmpty &&
                                tim2.text.isNotEmpty &&
                                skor1.text.isNotEmpty &&
                                skor2.text.isNotEmpty) {
                              String? url, url1;
                              // Gambar ke 1
                              if (image != null) {
                                await FirebaseStorage.instance
                                    .ref('logo/${image!.path}')
                                    .putFile(image!)
                                    .then((result) async {
                                  url = await result.ref.getDownloadURL();
                                  print(url);
                                });
                              }
                              //Gambar ke 2
                              if (image2 != null) {
                                await FirebaseStorage.instance
                                    .ref('logo/${image2!.path}')
                                    .putFile(image2!)
                                    .then((result) async {
                                  url1 = await result.ref.getDownloadURL();
                                  print(url1);
                                });
                              }
                              //Insert to cabor
                              DocumentReference<Map<String, dynamic>> caborId =
                                  await FirebaseFirestore.instance
                                      .collection('cabor')
                                      .add({
                                'futsal': {
                                  'logo1': url.toString(),
                                  'logo2': url1.toString(),
                                  'skor1': skor1.text,
                                  'skor2': skor2.text,
                                  'tim1': tim1.text,
                                  'tim2': tim2.text,

                                  // 'tanggalPertandingan' : ,
                                },
                              });
                              
                              //Insert to statistik
                              FirebaseFirestore.instance
                                  .collection('statistikPertandingan')
                                  .add({
                                'caborId': caborId.id,
                                'tim1': {
                                  'kartuKuning': '-',
                                  'kartuMerah': '-',
                                  'pelanggaran': '-',
                                  'penguasaanBola': '-',
                                  'tendangan': '-',
                                  'tendanganKeGawang': '-',
                                },
                                'tim2': {
                                  'kartuKuning': '-',
                                  'kartuMerah': '-',
                                  'pelanggaran': '-',
                                  'penguasaanBola': '-',
                                  'tendangan': '-',
                                  'tendanganKeGawang': '-',
                                }
                              });
                              FirebaseFirestore.instance
                                  .collection('deskripsiFutsal')
                                  .add({
                                'caborId': caborId.id,
                                'deskripsi': 'Isi deskripsi pertandingan',
                              });
                              FirebaseFirestore.instance
                                  .collection('timFutsal')
                                  .add({
                                'caborId': caborId.id,
                                'tim1': {
                                  'namaPemain': '',
                                  'noPemain': '',
                                  'posisiPemain': '',
                                  'fotoPemain': '',
                                },
                                'tim2': {
                                  'namaPemain': '',
                                  'noPemain': '',
                                  'posisiPemain': '',
                                  'fotoPemain': '',
                                }
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Data berhasil ditambahkan!",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Color(0xff142D4C),
                              ));
                              setState(() {});
                              // .whenComplete(() {

                              Navigator.pop(
                                context,
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Inputan tidak boleh kosong! harap kembali",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              ));
                            }

                            // uploadImage();
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
        });
  }

  // void getImage(ImageSource imageSource) async {
  //   final pickedFile = await ImagePicker().pickImage(source: imageSource);
  //   if (pickedFile != null) {
  //     selectedImagePath.value = pickedFile.path;
  //   } else {
  //     SnackBar(
  //       content: Text('No image selected.'),
  //       backgroundColor: Colors.red,
  //     );
  //   }
  // }

  // Future<void> uploadImage() async {
  //   if (file == null || file2 == null) {
  //     return;
  //   }

  //   try {
  //     String imageName = file!.name;
  //     File imageFile = File(file!.path);
  //     final firebaseStorageRef = await firebaseStorage
  //         .ref("logoAddFutsal/${DateTime.now().microsecondsSinceEpoch}")
  //         .child(imageName)
  //         .putFile(imageFile)
  //         .then((result) async {
  //       String fileUrl = await result.ref.getDownloadURL();
  //     });
  //     await FirebaseFirestore.instance
  //         .collection('cabor')
  //         .doc(widget.id)
  //         .update(
  //       {
  //         'futsal': {
  //           'skor1': skor1.text,
  //           'skor2': skor2.text,
  //           'tim1': tim1.text,
  //           'tim2': tim2.text,
  //           'logo1': file,
  //           // 'logo2': fileUrl2,
  //           // 'tanggalPertandingan' : ,
  //         },
  //       },
  //     );

  //     String imageName2 = file2!.name;
  //     File imageFile2 = File(file2!.path);
  //     final firebaseStorageRef2 = await firebaseStorage
  //         .ref("logoAddFutsal/${DateTime.now().microsecondsSinceEpoch}")
  //         .child(imageName2)
  //         .putFile(imageFile2);
  //     final fileUrl2 = await firebaseStorageRef2.ref.getDownloadURL();
  //     print(fileUrl2);

  //     await FirebaseFirestore.instance
  //         .collection('cabor')
  //         .doc(widget.id)
  //         .update(
  //       {
  //         'futsal': {
  //           'skor1': skor1.text,
  //           'skor2': skor2.text,
  //           'tim1': tim1.text,
  //           'tim2': tim2.text,
  //           'logo1': file,
  //           'logo2': fileUrl2,
  //           // 'tanggalPertandingan' : ,
  //         },
  //       },
  //     );
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   } catch (error) {
  //     print(error);
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

  Future<File?> getImageGallery2() async {
    ImagePicker _picker = ImagePicker();
    final XFile? image2 = await _picker.pickImage(source: ImageSource.gallery);
    if (image2 != null) {
      return File(image2.path);
    } else {
      return null;
    }
  }
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
