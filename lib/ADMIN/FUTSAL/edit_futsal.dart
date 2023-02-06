// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors, body_might_complete_normally_nullable

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

class EditFutsal extends StatefulWidget {
  DocumentSnapshot docid;
  final String id;

  EditFutsal({
    Key? key,
    required this.docid,
    required this.id,
  }) : super(key: key);

  @override
  _EditFutsalState createState() => _EditFutsalState();
}

class _EditFutsalState extends State<EditFutsal> {
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  TextEditingController tim1 = TextEditingController();
  TextEditingController tim2 = TextEditingController();
  // TextEditingController tanggal = TextEditingController();
  TextEditingController skor1 = TextEditingController();
  TextEditingController skor2 = TextEditingController();

  final MediaType _mediaType = MediaType.image;
  XFile? file;
  XFile? file2;
  XFile? imageFile;
  XFile? imageFile2;
  String? imagePath;
  String? imagePath2;

  // String? image;
  File? image;
  File? image2;
  var doc;

  // File? image;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  // String? imagePath = '';
  String? imagePathh = '';
  // String? image1 = '', image2 = '';

  @override
  void initState() {
    tim1 = TextEditingController(text: widget.docid["futsal"]["tim1"]);
    tim2 = TextEditingController(text: widget.docid["futsal"]["tim2"]);
    // tanggal = TextEditingController(text: widget.docid["futsal"]["tanggal"]);
    skor1 = TextEditingController(text: widget.docid["futsal"]["skor1"]);
    skor2 = TextEditingController(text: widget.docid["futsal"]["skor2"]);
    imagePath = widget.docid.get('futsal')['logo1'];
    imagePath2 = widget.docid.get('futsal')['logo2'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    print(widget.docid.reference);
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pop(context);
              });
            },
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ],
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         pickMedia(ImageSource.gallery);
                  //       },
                  //       child: SizedBox(
                  //         width: 90,
                  //         height: 90,
                  //         child: (imagePath == null)
                  //             ? CircleAvatar(
                  //                 backgroundImage: FileImage(File(imagePath!)))
                  //             : widget.docid.get('futsal')['logo1'] == ""
                  //                 ? Container(
                  //                     decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       color: Colors.grey[300]!,
                  //                     ),
                  //                     width: 150,
                  //                     height: 150,
                  //                     child: const Icon(
                  //                       Icons.person,
                  //                       color: Colors.white,
                  //                       size: 60,
                  //                     ),
                  //                   )
                  //                 : Container(
                  //                     decoration: BoxDecoration(
                  //                       image: DecorationImage(
                  //                           fit: BoxFit.cover,
                  //                           image: NetworkImage(widget.docid
                  //                               .get('futsal')['logo1'])),
                  //                       shape: BoxShape.circle,
                  //                       color: Colors.grey[300]!,
                  //                     ),
                  //                     width: 300,
                  //                     height: 300,
                  //                   ),
                  //       ),
                  //     ),
                  //     const Text(
                  //       'VS',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 20,
                  //         color: Color(0xff142D4C),
                  //       ),
                  //     ),
                  //     InkWell(
                  //       onTap: () {
                  //         pickMediaa(ImageSource.gallery);
                  //       },
                  //       child: SizedBox(
                  //         width: 90,
                  //         height: 90,
                  //         child: (imagePathh == null)
                  //             ? CircleAvatar(
                  //                 backgroundImage: FileImage(File(imagePathh!)))
                  //             : widget.docid.get('futsal')['logo2'] == ""
                  //                 ? Container(
                  //                     decoration: BoxDecoration(
                  //                       shape: BoxShape.circle,
                  //                       color: Colors.grey[300]!,
                  //                     ),
                  //                     width: 150,
                  //                     height: 150,
                  //                     child: const Icon(
                  //                       Icons.person,
                  //                       color: Colors.white,
                  //                       size: 60,
                  //                     ),
                  //                   )
                  //                 : Container(
                  //                     decoration: BoxDecoration(
                  //                       image: DecorationImage(
                  //                           fit: BoxFit.cover,
                  //                           image: NetworkImage(widget.docid
                  //                               .get('futsal')['logo2'])),
                  //                       shape: BoxShape.circle,
                  //                       color: Colors.grey[300]!,
                  //                     ),
                  //                     width: 150,
                  //                     height: 150,
                  //                   ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          File? _images = await getImageGallery();
                          if (_images != null) {
                            setState(() {
                              image = _images;
                            });
                          }
                        },
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: (image != null)
                              ? Image.file(
                                  image!,
                                  fit: BoxFit.cover,
                                )
                              : widget.docid.get('futsal')['logo1'] == ""
                                  ? Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300]!,
                                      ),
                                      width: 300,
                                      height: 300,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 100,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(widget.docid
                                                .get('futsal')['logo1'])),
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300]!,
                                      ),
                                      width: 300,
                                      height: 300,
                                    ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'VS',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 15),
                      InkWell(
                        onTap: () async {
                          File? _images = await getImageGallery2();
                          if (_images != null) {
                            setState(() {
                              image2 = _images;
                            });
                          }
                        },
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: (image2 != null)
                              ? Image.file(
                                  image2!,
                                  fit: BoxFit.cover,
                                )
                              : widget.docid.get('futsal')['logo2'] == ""
                                  ? Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300]!,
                                      ),
                                      width: 300,
                                      height: 300,
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 100,
                                      ),
                                    )
                                  : Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(widget.docid
                                                .get('futsal')['logo2'])),
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300]!,
                                      ),
                                      width: 300,
                                      height: 300,
                                    ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  TextFormField(
                    inputFormatters: [UpperCaseTextFormatter()],
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: false,
                    ),
                    maxLength: 4,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    //memberikan identitas untuk setiap form
                    controller: tim1,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.people,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. OTKP',
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
                    //memberikan identitas untuk setiap form
                    maxLength: 4,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: tim2,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.people,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. OTKP',
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
                    toolbarOptions: ToolbarOptions(
                      copy: false,
                      cut: false,
                      selectAll: true,
                      paste: false,
                    ),
                    inputFormatters: [UpperCaseTextFormatter()],
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,

                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    //memberikan identitas untuk setiap form
                    controller: skor1,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. 2',
                      labelText: 'Skor Tim 1 :',
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
                      cut: false,
                      selectAll: true,
                      paste: false,
                    ),
                    inputFormatters: [UpperCaseTextFormatter()],
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 3,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    //memberikan identitas untuk setiap form
                    controller: skor2,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.scoreboard_outlined,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. 1',
                      labelText: 'Skor Tim 2 :',
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

                  const SizedBox(height: 15),

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
                    onPressed: () async {
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
                      FirebaseFirestore.instance
                          .collection('cabor')
                          .doc(widget.id)
                          .set({
                        'futsal': {
                          'skor1': skor1.text,
                          'skor2': skor2.text,
                          // 'tanggal': tanggal.text,
                          'tim1': tim1.text,
                          'tim2': tim2.text,
                          'logo1': url.toString(),
                          'logo2': url1.toString(),

                          // 'tanggalPertandingan' : ,
                        },
                      }, SetOptions(merge: true));
                      // widget.docid.reference.update({
                      //   'futsal': {
                      //     'skor1': skor1.text,
                      //     'skor2': skor2.text,
                      //     // 'tanggal': tanggal.text,
                      //     'tim1': tim1.text,
                      //     'tim2': tim2.text,
                      //     'logo1': image,
                      //     'logo2': image2,
                      //     // 'tanggalPertandingan' : ,
                      //   },
                      // });

                      // uploadImage();
                      // uploadImage2();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Data telah diperbarui!",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xff142D4C),
                      ));

                      setState(() {});
                      // .whenComplete(() {

                      Navigator.pop(
                        context,
                      );
                      uploadImage();
                      uploadImage2();
                      // });
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

  // void pickMedia(ImageSource source) async {
  //   if (_mediaType == MediaType.image) {
  //     file = await ImagePicker().pickImage(source: source);
  //   } else {
  //     file = await ImagePicker().pickVideo(source: source);
  //   }
  //   if (file != null) {
  //     imagePath = file!.path;
  //     if (_mediaType == MediaType.video) {
  //       imagePath = await VideoThumbnail.thumbnailFile(
  //           video: file!.path,
  //           imageFormat: ImageFormat.PNG,
  //           quality: 100,
  //           maxWidth: 300,
  //           maxHeight: 300);
  //     }
  //     setState(() {});
  //   }
  // }

  // void pickMediaa(ImageSource source) async {
  //   if (_mediaType == MediaType.image) {
  //     file2 = await ImagePicker().pickImage(source: source);
  //   } else {
  //     file2 = await ImagePicker().pickVideo(source: source);
  //   }
  //   if (file2 != null) {
  //     imagePathh = file2!.path;
  //     if (_mediaType == MediaType.video) {
  //       imagePathh = await VideoThumbnail.thumbnailFile(
  //           video: file2!.path,
  //           imageFormat: ImageFormat.PNG,
  //           quality: 100,
  //           maxWidth: 300,
  //           maxHeight: 300);
  //     }
  //     setState(() {});
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
  //         .putFile(imageFile);
  //     final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
  //     print(fileUrl);

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
  //           'logo1': fileUrl,
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

  //ini yang terbaru
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

  Future<void> uploadImage() async {
    if (file == null) {
      return;
    }
    String imageName = file!.name;
    File imageFile = File(file!.path);
    // print(imageFile.path);
    try {
      final firebaseStorageRef = await firebaseStorage
          .ref("logo/${DateTime.now().microsecondsSinceEpoch}")
          .child(imageName)
          .putFile(imageFile);
      final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('cabor')
          .doc(
            '$doc',
          )
          .update({
        'futsal': {
          'logo1': fileUrl,
        }
      });
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

  Future<void> uploadImage2() async {
    if (file == null) {
      return;
    }
    String imageName = file!.name;
    File imageFile = File(file!.path);
    // print(imageFile.path);
    try {
      final firebaseStorageRef = await firebaseStorage
          .ref("logo/${DateTime.now().microsecondsSinceEpoch}")
          .child(imageName)
          .putFile(imageFile);
      final fileUrl1 = await firebaseStorageRef.ref.getDownloadURL();
      await FirebaseFirestore.instance.collection('cabor').doc('$doc').update({
        'futsal': {
          'logo2': fileUrl1,
        }
      });
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

  // void pickMedia(ImageSource source) async {
  //   if (_mediaType == MediaType.image) {
  //     file = await ImagePicker().pickImage(source: source);
  //   } else {
  //     file = await ImagePicker().pickVideo(source: source);
  //   }
  //   if (file != null) {
  //     imagePath = file!.path;
  //     if (_mediaType == MediaType.video) {
  //       imagePath = await VideoThumbnail.thumbnailFile(
  //           video: file!.path,
  //           imageFormat: ImageFormat.PNG,
  //           quality: 100,
  //           maxWidth: 300,
  //           maxHeight: 300);
  //     }
  //     setState(() {});
  //   }
  // }

  // Future<void> uploadImage() async {
  //   if (file == null) {
  //     return;
  //   }
  //   String imageName = file!.name;
  //   File imageFile = File(file!.path);
  //   try {
  //     final firebaseStorageRef = await firebaseStorage
  //         .ref("futsal/${DateTime.now().microsecondsSinceEpoch}")
  //         .child(imageName)
  //         .putFile(imageFile);
  //     final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
  //     print(fileUrl);
  //     await FirebaseFirestore.instance
  //         .collection('cabor')
  //         .doc(widget.id)
  //         .update({'logo1': fileUrl});
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  // //kedua
  // void pickMedia2(ImageSource source) async {
  //   if (_mediaType == MediaType.image) {
  //     file2 = await ImagePicker().pickImage(source: source);
  //   } else {
  //     file2 = await ImagePicker().pickVideo(source: source);
  //   }
  //   if (file2 != null) {
  //     imagePath2 = file2!.path;
  //     if (_mediaType == MediaType.video) {
  //       imagePath2 = await VideoThumbnail.thumbnailFile(
  //           video: file2!.path,
  //           imageFormat: ImageFormat.PNG,
  //           quality: 100,
  //           maxWidth: 300,
  //           maxHeight: 300);
  //     }
  //     setState(() {});
  //   }
  // }

  // Future<void> uploadImage2() async {
  //   if (file == null) {
  //     return;
  //   }
  //   String imageName = file2!.name;
  //   File imageFile2 = File(file2!.path);
  //   try {
  //     final firebaseStorageRef = await firebaseStorage
  //         .ref("futsal2/${DateTime.now().microsecondsSinceEpoch}")
  //         .child(imageName)
  //         .putFile(imageFile2);
  //     final fileUrl2 = await firebaseStorageRef.ref.getDownloadURL();
  //     print(fileUrl2);
  //     await FirebaseFirestore.instance
  //         .collection('cabor')
  //         .doc(widget.id)
  //         .update({'logo2': fileUrl2});
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   } catch (error) {
  //     print(error);
  //   }
  // }
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

class PickImage {
  final ImagePicker _picker = ImagePicker();
  Future<XFile?> pickImage({required ImageSource source}) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image == null) return null;
      final imageTemp = XFile(image.path);
      return imageTemp;
      // setState(() {
      //   this.image = imageTemp;
      // });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }
}
