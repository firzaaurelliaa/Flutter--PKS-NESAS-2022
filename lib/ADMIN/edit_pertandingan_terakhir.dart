// ignore_for_file: must_be_immutable, avoid_print

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

enum MediaType {
  image,
  video,
}

class EditPertandinganTerakhir extends StatefulWidget {
  DocumentSnapshot docid;
  final String id;
  final String cabangolahraga;
  final dynamic data;
  String imageUrl;

  EditPertandinganTerakhir({
    Key? key,
    required this.docid,
    required this.id,
    required this.cabangolahraga,
    required this.data,
    required this.imageUrl,
  }) : super(key: key);

  @override
  _EditPertandinganTerakhirState createState() =>
      _EditPertandinganTerakhirState();
}

class _EditPertandinganTerakhirState extends State<EditPertandinganTerakhir> {
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  TextEditingController skor1 = TextEditingController();
  TextEditingController skor2 = TextEditingController();
  TextEditingController tim1 = TextEditingController();
  TextEditingController tim2 = TextEditingController();

  final MediaType _mediaType = MediaType.image;
  XFile? file;
  XFile? file2;
  File? image;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String? imagePath;
  String? imagePathh;
  String? image1, image2;

  @override
  void initState() {
    skor1 = TextEditingController(
        text: widget.docid.get(widget.cabangolahraga)['skor1']);
    skor2 = TextEditingController(
        text: widget.docid.get(widget.cabangolahraga)['skor2']);
    tim1 = TextEditingController(
        text: widget.docid.get(widget.cabangolahraga)['tim1']);
    tim2 = TextEditingController(
        text: widget.docid.get(widget.cabangolahraga)['tim2']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.id);
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   MaterialButton(
        //     onPressed: () {
        //       widget.docid.reference.delete().whenComplete(() {
        //         Navigator.pop(context);
        //       });
        //     },
        //     child: const Icon(
        //       Icons.delete,
        //       color: Colors.white,
        //     ),
        //   ),
        // ],
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
      ),
      // untuk membuat form input tambahakan widget form()
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    //memberikan identitas untuk setiap form
                    maxLength: 4,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim1,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.people,
                        color: Color(0xff142D4C),
                      ),
                      labelText: 'Tim 1 :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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

                    maxLength: 4,

                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    //memberikan identitas untuk setiap form
                    controller: tim2,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.people,
                        color: Color(0xff142D4C),
                      ),
                      labelText: 'Tim 2 :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                    keyboardType: const TextInputType.numberWithOptions(),
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      selectAll: true,
                    ),
                    maxLength: 3,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: skor1,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color(0xff142D4C),
                      ),
                      labelText: 'Skor tim 1 :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                      copy: false,
                      cut: true,
                      selectAll: true,
                    ),
                    inputFormatters: [UpperCaseTextFormatter()],
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,

                    maxLengthEnforcement: MaxLengthEnforcement.enforced,

                    controller: skor2,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color(0xff142D4C),
                      ),
                      labelText: 'Skor tim 2 :',
                      labelStyle: const TextStyle(color: Color(0xff142D4C)),
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
                  ),

                  const SizedBox(height: 30),
                  // Center(
                  //     child: Container(
                  //         constraints: BoxConstraints(maxWidth: 600),
                  //         child: DateTimeForm())),
                  // const SizedBox(height: 15),

                  RoundedLoadingButton(
                    color: const Color(0xff142D4C),
                    // successColor: const Color(0xff142D4C),
                    controller: _btnController2,
                    onPressed: () {
                      if (skor1.text.isNotEmpty && skor2.text.isNotEmpty) {
                        widget.docid.reference.update({
                          widget.cabangolahraga: {
                            'skor1': skor1.text,
                            'skor2': skor2.text,
                            'tim1': tim1.text,
                            'tim2': tim2.text,
                            'logo1': widget.data['logo1'],
                            'logo2': widget.data['logo2'],

                            // 'logo1': widget.data['logo1'],
                            // 'logo2': widget.data['logo2'],
                          }
                        }).whenComplete(() {
                          Navigator.pop(
                            context,
                          );
                        });

                        uploadImage();
                        uploadImage2();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                              'Inputan tidak boleh kosong, silahkan kembali'),
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void pickMedia(ImageSource source) async {
    if (_mediaType == MediaType.image) {
      file = await ImagePicker().pickImage(source: source);
    } else {
      file = await ImagePicker().pickVideo(source: source);
    }
    if (file != null) {
      imagePath = file!.path;
      if (_mediaType == MediaType.video) {
        imagePath = await VideoThumbnail.thumbnailFile(
            video: file!.path,
            imageFormat: ImageFormat.PNG,
            quality: 100,
            maxWidth: 300,
            maxHeight: 300);
      }
      setState(() {});
    }
  }

  void pickMediaa(ImageSource source) async {
    if (_mediaType == MediaType.image) {
      file2 = await ImagePicker().pickImage(source: source);
    } else {
      file2 = await ImagePicker().pickVideo(source: source);
    }
    if (file2 != null) {
      imagePathh = file2!.path;
      if (_mediaType == MediaType.video) {
        imagePathh = await VideoThumbnail.thumbnailFile(
            video: file2!.path,
            imageFormat: ImageFormat.PNG,
            quality: 100,
            maxWidth: 300,
            maxHeight: 300);
      }
      setState(() {});
    }
  }

  Future<void> uploadImage() async {
    if (file == null) {
      return;
    }
    String imageName = file!.name;
    File imageFile = File(file!.path);
    try {
      final firebaseStorageRef =
          await firebaseStorage.ref("logo").child(imageName).putFile(imageFile);
      final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl);
      await FirebaseFirestore.instance
          .collection('pertandinganTerakhir')
          .doc(widget.id)
          .set({
        'futsal': {
          'logo1': fileUrl,

          // 'tanggalPertandingan' : ,
        },
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

  Future<void> uploadImage2() async {
    if (file2 == null) {
      return;
    }
    String imageName = file2!.name;
    File imageFile = File(file2!.path);
    try {
      final firebaseStorageRef =
          await firebaseStorage.ref("logo").child(imageName).putFile(imageFile);
      final fileUrl2 = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl2);
      await FirebaseFirestore.instance.collection('cabor').doc(widget.id).set({
        'futsal': {
          'logo2': fileUrl2,
          // 'tanggalPertandingan' : ,
        },
      }, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}

//supaya kapital semua
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






// // ignore_for_file: must_be_immutable, avoid_print

// import 'dart:io';
// import 'package:akhir/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// enum MediaType {
//   image,
//   video,
// }

// class EditPertandinganTerakhir extends StatefulWidget {
  // DocumentSnapshot docid;
  // String imageUrl;
  // final String cabangolahraga;
  // final dynamic data;
//   EditPertandinganTerakhir({
//     Key? key,
//     required this.docid,
//     required this.imageUrl,
//     required this.cabangolahraga,
//     required this.data,
//   }) : super(key: key);

//   @override
//   State<EditPertandinganTerakhir> createState() =>
//       _EditPertandinganTerakhirState();
// }

// class _EditPertandinganTerakhirState extends State<EditPertandinganTerakhir> {
//   TextEditingController skor1 = TextEditingController();
//   TextEditingController skor2 = TextEditingController();
//   List<String> multipleImages = [];
//   List<XFile> multipleImage = [];

//   final MediaType _mediaType = MediaType.image;
//   XFile? file;
//   FirebaseStorage firebaseStorage = FirebaseStorage.instance;

//   String? imagePath;
//   @override
//   void initState() {
//     skor1 = TextEditingController(
//         text: widget.docid.get(widget.cabangolahraga)['skor1']);
//     skor2 = TextEditingController(
//         text: widget.docid.get(widget.cabangolahraga)['skor2']);

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff142D4C),
//         elevation: 0,
//         title: const Text(
//           'Edit pertandingan terakhir',
//           style: TextStyle(
//               color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Center(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(height: 30),
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 110,
//                     height: 110,
//                     child: (imagePath != null)
//                         ? CircleAvatar(
//                             backgroundImage: FileImage(File(imagePath!)))
//                         : widget.docid.get(widget.cabangolahraga)['logo1'] == ""
//                             ? Container(
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.grey[300]!,
//                                 ),
//                                 width: 300,
//                                 height: 300,
//                                 child: const Icon(
//                                   Icons.person,
//                                   color: Colors.white,
//                                   size: 100,
//                                 ),
//                               )
//                             : Container(
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: NetworkImage(widget.docid.get(
//                                           widget.cabangolahraga)['logo1'])),
//                                   shape: BoxShape.circle,
//                                   color: Colors.grey[300]!,
//                                 ),
//                                 width: 300,
//                                 height: 300,
//                               ),
//                   ),
//                   Positioned(
//                     top: 65,
//                     left: 40,
//                     child: RawMaterialButton(
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Text('Ambil foto dari :'),
//                               content: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const SizedBox(height: 10),
//                                   InkWell(
//                                     onTap: () {
//                                       pickMedia(ImageSource.gallery);
//                                       Navigator.pop(context);
//                                     },
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: const [
//                                         Icon(
//                                           Icons.image,
//                                           size: 30,
//                                           color: Color(0xff142D4C),
//                                         ),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           "Galeri",
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   InkWell(
//                                     onTap: () {
//                                       pickMedia(ImageSource.camera);
//                                       Navigator.pop(context);
//                                     },
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: const [
//                                         Icon(
//                                           Icons.camera_alt,
//                                           size: 30,
//                                           color: Color(0xff142D4C),
//                                         ),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           "Buka kamera",
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10),
//                                   InkWell(
//                                     onTap: () {
//                                       setState(
//                                         () {
//                                           imagePath = null;
//                                         },
//                                       );
//                                     },
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: const [
//                                         Icon(
//                                           Icons.remove_circle,
//                                           size: 30,
//                                           color: Colors.red,
//                                         ),
//                                         SizedBox(width: 5),
//                                         Text(
//                                           "Hapus foto profil",
//                                           style: TextStyle(
//                                             fontSize: 15,
//                                             color: Colors.black,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                       child: Container(
//                         // ignore: prefer_const_constructors
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: const Color(0xff142D4C),
//                         ),
//                         width: 35,
//                         height: 35,
//                         child: const Icon(
//                           Icons.add,
//                           size: 25,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),

//               //nama dan deskripsi
//               Container(
//                 margin: const EdgeInsets.all(25),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: const [
//                         Text('Skor tim 1 :'),
//                       ],
//                     ),
//                     TextFormField(
//                       keyboardType: TextInputType.numberWithOptions(),
//                       cursorColor: const Color(0xff142D4C),
//                       controller: skor1,
//                       maxLength: 25,
//                       decoration: const InputDecoration(
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xff142D4C)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: const [
//                         Text('Skor tim 2 :'),
//                       ],
//                     ),
//                     TextField(
//                       keyboardType: TextInputType.numberWithOptions(),
//                       cursorColor: const Color(0xff142D4C),

//                       controller: skor2,
//                       maxLines: 1,
//                       decoration: const InputDecoration(
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xff142D4C)),
//                         ),
//                       ),
//                       // maxLength: 15,
//                     ),
//                     const SizedBox(height: 30),
//                     Row(
//                       children: [
//                         ...multipleImage
//                             .map(
//                               (e) => Container(
//                                 margin: EdgeInsets.only(left: 20),
//                                 height: 100,
//                                 width: 100,
//                                 child: Image.file(
//                                   File(e.path),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             )
//                             .toList()
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 5),
//                             child: InkWell(
//                                 onTap: () async {
//                                   List<XFile>? _images =
//                                       await AppImagePicker(context)
//                                           .multiImagePicker();
//                                   if (_images.isNotEmpty) {
//                                     multipleImage += await _images;
//                                     setState(() {});
//                                   }
//                                 },
//                                 child: Icon(
//                                   Icons.add_a_photo,
//                                   color: const Color(0xff142D4C),
//                                 )),
//                           ),
//                           InkWell(
//                             onTap: () async {
//                               List<XFile>? _images =
//                                   await AppImagePicker(context)
//                                       .multiImagePicker();
//                               if (_images.isNotEmpty) {
//                                 multipleImage += await _images;
//                                 setState(() {});
//                               }
//                             },
//                             child: Text(
//                               'Tambahkan logo',
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                   color: const Color(0xff142D4C)),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(350, 38),
//                         textStyle: const TextStyle(
//                             fontSize: 13, fontWeight: FontWeight.bold),
//                         primary: const Color(0xff142D4C),
//                         onPrimary: Colors.white,
//                       ),
//                       onPressed: () async {
//                         List<XFile>? _images = await multipleImage;
//                         if (_images.isNotEmpty) {
//                           multipleImages = await AppImagePicker(context)
//                               .multiImageUploader(_images, '');
//                           setState(() {});

                          // widget.docid.reference.update({
                          //   widget.cabangolahraga: {
                          //     'skor1': skor1.text,
                          //     'skor2': skor2.text,
                          //     'logo1': widget.data['logo1'],
                          //     'logo2': widget.data['logo2'],
                          //   }
                          // });
//                           setState(() {});
//                         }
//                         print(multipleImages);
//                         Navigator.of(context).pop();
//                       },
//                       // onPressed: () async {
//                       // widget.docid.reference.update({
//                       //   widget.cabangolahraga: {
//                       //     'skor1': skor1.text,
//                       //     'skor2': skor2.text,
//                       //     'logo1': widget.data['logo1'],
//                       //     'logo2': widget.data['logo2'],
//                       //   }
//                       // });
//                       //   uploadImage();
//                       // setState(() {});
//                       //   // .whenComplete(() {
//                       //   Navigator.pop(
//                       //     context,
//                       //   );
//                       //   // });
//                       // },
//                       child: const Text(
//                         'Simpan',
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           )),
//         ],
//       ),
//     );
//   }

//   void pickMedia(ImageSource source) async {
//     if (_mediaType == MediaType.image) {
//       file = await ImagePicker().pickImage(source: source);
//     } else {
//       file = await ImagePicker().pickVideo(source: source);
//     }
//     if (file != null) {
//       imagePath = file!.path;
//       if (_mediaType == MediaType.video) {
//         imagePath = await VideoThumbnail.thumbnailFile(
//             video: file!.path,
//             imageFormat: ImageFormat.PNG,
//             quality: 100,
//             maxWidth: 300,
//             maxHeight: 300);
//       }
//       setState(() {});
//     }
//   }

//   Future<void> uploadImage() async {
//     if (file == null) {
//       return;
//     }
//     String imageName = file!.name;
//     File imageFile = File(file!.path);
//     try {
//       final firebaseStorageRef = await firebaseStorage
//           .ref("admin")
//           .child(imageName)
//           .putFile(imageFile);
//       final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
//       print(fileUrl);
//       await FirebaseFirestore.instance
//           .collection('profilAdmin')
//           .doc('KGe04xpEqrJkE3MuYxsG')
//           .update({'fotoProfil': fileUrl});
//     } on FirebaseException catch (e) {
//       print(e);
//     } catch (error) {
//       print(error);
//     }
//   }
// }
