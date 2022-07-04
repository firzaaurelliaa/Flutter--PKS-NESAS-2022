// ignore_for_file: must_be_immutable, avoid_print, unused_field

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

class AddKlasemenFutsal extends StatefulWidget {
  const AddKlasemenFutsal({Key? key}) : super(key: key);

  // DocumentSnapshot docid;
  // AddPemain({Key? key, required this.docid}) : super(key: key);

  @override
  _AddKlasemenFutsalState createState() => _AddKlasemenFutsalState();
}

class _AddKlasemenFutsalState extends State<AddKlasemenFutsal> {
  final _formKey = GlobalKey<FormState>();
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('klasemenFutsal').snapshots();

  TextEditingController poin = TextEditingController();
  TextEditingController jurusan = TextEditingController();
  TextEditingController main = TextEditingController();
  TextEditingController menang = TextEditingController();
  TextEditingController seri = TextEditingController();
  TextEditingController kalah = TextEditingController();
  TextEditingController no = TextEditingController();
  final MediaType _mediaType = MediaType.image;
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();
  XFile? file;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  CollectionReference ref =
      FirebaseFirestore.instance.collection('klasemenFutsal');
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
                  const Text(
                    'Tambah klasemen',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff142D4C)),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: no,
                    decoration: InputDecoration(
                      labelText: 'No :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Penguasaan bola tidak boleh kosong';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    maxLength: 4,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: jurusan,
                    decoration: InputDecoration(
                      labelText: 'Jurusan :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Penguasaan bola tidak boleh kosong';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    //memberikan identitas untuk setiap form
                    maxLength: 2,
                    controller: main,
                    decoration: InputDecoration(
                      labelText: 'Main :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    controller: menang,
                    decoration: InputDecoration(
                      labelText: 'Menang :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Kartu kuning tidak boleh kosong';
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
                    controller: seri,
                    decoration: InputDecoration(
                      labelText: 'Seri:',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Kartu kuning tidak boleh kosong';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    //memberikan identitas untuk setiap form
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: kalah,
                    decoration: InputDecoration(
                      labelText: 'Kalah:',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Kartu kuning tidak boleh kosong';
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
                    controller: poin,
                    decoration: InputDecoration(
                      labelText: 'Poin:',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Kartu kuning tidak boleh kosong';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 30),
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
                  RoundedLoadingButton(
                    color: const Color(0xff142D4C),
                    // successColor: const Color(0xff142D4C),
                    controller: _btnController2,
                    onPressed: () async {
                      if (image == null) {
                        return;
                      }
                      // String imageName = image!.name;
                      File imageFile = File(image!.path);
                      print('path : ' + image!.path);
                      try {
                        final firebaseStorageRef = await firebaseStorage
                            .ref()
                            .child('tim1_')
                            .putFile(imageFile);
                        final fileUrl =
                            await firebaseStorageRef.ref.getDownloadURL();
                        print(fileUrl);
                        ref.add({
                          'jurusan': jurusan.text,
                          'no': no.text,
                          'kalah': kalah.text,
                          'main': main.text,
                          'menang': menang.text,
                          'seri': seri.text,
                          'poin': poin.text,
                          'logo': fileUrl,
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
                    valueColor: Colors.white,
                    borderRadius: 10,
                    child: const Text('''Simpan''',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
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





// // ignore_for_file: must_be_immutable, non_constant_identifier_names, nullable_type_in_catch_clause, prefer_typing_uninitialized_variables, sized_box_for_whitespace

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class AddKlasemenFutsal extends StatefulWidget {
//   const AddKlasemenFutsal({Key? key}) : super(key: key);

//   @override
//   _AddKlasemenFutsalState createState() => _AddKlasemenFutsalState();
// }

// class _AddKlasemenFutsalState extends State<AddKlasemenFutsal> {
//   final _formKey = GlobalKey<FormState>();
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('klasemenFutsal').snapshots();

//   TextEditingController no = TextEditingController();
//   TextEditingController jurusan = TextEditingController();
//   TextEditingController main = TextEditingController();
//   TextEditingController menang = TextEditingController();
//   TextEditingController seri = TextEditingController();
//   TextEditingController kalah = TextEditingController();
//   TextEditingController poin = TextEditingController();

//   File? image;
//   var index;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: const Color(0xff142D4C),
//               elevation: 0,
//             ),
//             body: ListView(
//               children: [
//                 Form(
//                   key: _formKey,
//                   child: Container(
//                     padding: const EdgeInsets.all(25.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Tambah klasemen futsal',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff142D4C)),
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           controller: no,
//                           keyboardType: const TextInputType.numberWithOptions(),
//                           maxLength: 3,
//                           decoration: InputDecoration(
//                             hintText: 'Cth. 1.',
//                             labelText: 'No :',
//                             labelStyle:
//                                 const TextStyle(color: Color(0xff142D4C)),
//                             suffixIcon: IconButton(
//                               onPressed: no.clear,
//                               icon: const Icon(Icons.clear),
//                               color: const Color(0xff142D4C),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff142D4C)),
//                             ),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           //memberikan validasi jika form kosong
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Nomor tidak boleh kosong';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           //memberikan identitas untuk setiap form
//                           controller: jurusan,
//                           maxLength: 4,
//                           decoration: InputDecoration(
//                             hintText: 'Cth. RPL',
//                             labelText: 'Jurusan :',
//                             labelStyle:
//                                 const TextStyle(color: Color(0xff142D4C)),
//                             suffixIcon: IconButton(
//                               onPressed: jurusan.clear,
//                               icon: const Icon(Icons.clear),
//                               color: const Color(0xff142D4C),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff142D4C)),
//                             ),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           //memberikan validasi jika form kosong
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Jurusan tidak boleh kosong';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           //memberikan identitas untuk setiap form
//                           controller: main,
//                           keyboardType: const TextInputType.numberWithOptions(),
//                           maxLength: 2,
//                           decoration: InputDecoration(
//                             labelText: 'Main :',
//                             labelStyle:
//                                 const TextStyle(color: Color(0xff142D4C)),
//                             suffixIcon: IconButton(
//                               onPressed: main.clear,
//                               icon: const Icon(Icons.clear),
//                               color: const Color(0xff142D4C),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff142D4C)),
//                             ),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           //memberikan validasi jika form kosong
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Jumlah main tidak boleh kosong';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           //memberikan identitas untuk setiap form
//                           controller: menang,
//                           keyboardType: const TextInputType.numberWithOptions(),
//                           maxLength: 2,
//                           decoration: InputDecoration(
//                             labelText: 'Menang :',
//                             labelStyle:
//                                 const TextStyle(color: Color(0xff142D4C)),
//                             suffixIcon: IconButton(
//                               onPressed: menang.clear,
//                               icon: const Icon(Icons.clear),
//                               color: const Color(0xff142D4C),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff142D4C)),
//                             ),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           //memberikan validasi jika form kosong
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Jumlah Menang tidak boleh kosong';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           //memberikan identitas untuk setiap form
//                           controller: seri,
//                           keyboardType: const TextInputType.numberWithOptions(),
//                           maxLength: 2,
//                           decoration: InputDecoration(
//                             labelText: 'Seri :',
//                             labelStyle:
//                                 const TextStyle(color: Color(0xff142D4C)),
//                             suffixIcon: IconButton(
//                               onPressed: seri.clear,
//                               icon: const Icon(Icons.clear),
//                               color: const Color(0xff142D4C),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff142D4C)),
//                             ),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           //memberikan validasi jika form kosong
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Jumlah seri tidak boleh kosong';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           //memberikan identitas untuk setiap form
//                           controller: kalah,
//                           keyboardType: const TextInputType.numberWithOptions(),
//                           maxLength: 2,
//                           decoration: InputDecoration(
//                             labelText: 'Kalah :',
//                             labelStyle:
//                                 const TextStyle(color: Color(0xff142D4C)),
//                             suffixIcon: IconButton(
//                               onPressed: kalah.clear,
//                               icon: const Icon(Icons.clear),
//                               color: const Color(0xff142D4C),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff142D4C)),
//                             ),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           //memberikan validasi jika form kosong
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Jumlah kalah tidak boleh kosong';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         TextFormField(
//                           //memberikan identitas untuk setiap form
//                           controller: poin,
//                           keyboardType: const TextInputType.numberWithOptions(),
//                           maxLength: 2,
//                           decoration: InputDecoration(
//                             labelText: 'Poin :',
//                             labelStyle:
//                                 const TextStyle(color: Color(0xff142D4C)),
//                             suffixIcon: IconButton(
//                               onPressed: poin.clear,
//                               icon: const Icon(Icons.clear),
//                               color: const Color(0xff142D4C),
//                             ),
//                             focusedBorder: const OutlineInputBorder(
//                               borderSide: BorderSide(color: Color(0xff142D4C)),
//                             ),
//                             border: const OutlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           //memberikan validasi jika form kosong
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return ' Jumlah poin tidak boleh kosong';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         IconButton(
//                             onPressed: () async {
//                               File? _images = await getImageGallery();
//                               if (_images != null) {
//                                 setState(() {
//                                   image = _images;
//                                 });
//                               }
//                             },
//                             icon: const Icon(Icons.add, size: 40)),
//                         const SizedBox(height: 15),
//                         Row(
//                           children: [
//                             image != null
//                                 ? Container(
//                                     width: 100,
//                                     height: 100,
//                                     child: Image.file(
//                                       image!,
//                                     ),
//                                   )
//                                 : Container(),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: const Color(0xff142D4C),
//                                 onPrimary: Colors.grey,
//                               ),
//                               onPressed: () {
//                                 FirebaseStorage.instance
//                                     .ref("")
//                                     // .ref("${jurusan.text}.png")
//                                     .putFile(File(image!.path))
//                                     .then(
//                                   (image) async {
//                                     String imageUrl =
//                                         await image.ref.getDownloadURL();
//                                     FirebaseFirestore.instance
//                                         .collection("klasemenFutsal")
//                                         .add({
//                                       "logo": imageUrl,
//                                       "no": no.text,
//                                       "jurusan": jurusan.text,
//                                       "main": main.text,
//                                       "menang": menang.text,
//                                       "seri": seri.text,
//                                       "kalah": kalah.text,
//                                       "poin": poin.text,
//                                     });
//                                   },
//                                 );
//                               },
//                               child: const Text(
//                                 'Simpan',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }

//         // untuk membuat form input tambahakan widget form()

//         );
//   }
// }

// // class PickImage {
// //   final ImagePicker _picker = ImagePicker();
// //   Future<XFile?> pickImage({required ImageSource source}) async {
// //     try {
// //       final XFile? image = await _picker.pickImage(source: source);
// //       if (image == null) return null;
// //       final imageTemp = XFile(image.path);
// //       return imageTemp;
// //     } on PlatformException catch (e) {
// //       print("Failed to pick image $e");
// //     }
// //   }
// // }

// Future<File?> getImageGallery() async {
//   ImagePicker _picker = ImagePicker();
//   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//   if (image != null) {
//     return File(image.path);
//   } else {
//     return null;
//   }
// }
