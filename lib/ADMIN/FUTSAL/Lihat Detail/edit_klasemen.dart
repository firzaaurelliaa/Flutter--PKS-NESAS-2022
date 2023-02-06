// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors

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

class EditKlasemen extends StatefulWidget {
  DocumentSnapshot docid;

  EditKlasemen({
    Key? key,
    required this.docid,
  }) : super(key: key);

  @override
  _EditKlasemenState createState() => _EditKlasemenState();
}

class _EditKlasemenState extends State<EditKlasemen> {
  String title = 'AlertDialog';
  bool tappedYes = false;
  TextEditingController no = TextEditingController();
  TextEditingController jurusan = TextEditingController();
  TextEditingController main = TextEditingController();
  TextEditingController menang = TextEditingController();
  TextEditingController seri = TextEditingController();
  TextEditingController kalah = TextEditingController();
  TextEditingController poin = TextEditingController();
  File? image;
  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String? imagePath;
  String? image1, image2;
  final MediaType _mediaType = MediaType.image;
  XFile? file;

  @override
  void initState() {
    no = TextEditingController(text: widget.docid.get('no'));
    jurusan = TextEditingController(text: widget.docid.get('jurusan'));
    main = TextEditingController(text: widget.docid.get('main'));
    menang = TextEditingController(text: widget.docid.get('menang'));
    seri = TextEditingController(text: widget.docid.get('seri'));
    kalah = TextEditingController(text: widget.docid.get('kalah'));
    poin = TextEditingController(text: widget.docid.get('poin'));

    super.initState();
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Klasemen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
      ),
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
                  SizedBox(height: 15),
                  TextField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
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
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
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
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: seri,
                    decoration: InputDecoration(
                      labelText: 'Seri :',
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
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: kalah,
                    decoration: InputDecoration(
                      labelText: 'Kalah :',
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
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    toolbarOptions: const ToolbarOptions(
                      copy: true,
                      cut: false,
                      paste: false,
                      selectAll: true,
                    ),
                    keyboardType: const TextInputType.numberWithOptions(),
                    maxLength: 2,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    controller: poin,
                    decoration: InputDecoration(
                      labelText: 'Poin :',
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
                  ),
                  SizedBox(height: 30),
                  loading
                      ? const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xff142D4C)))
                      : SizedBox(
                          height: 38,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: const Color(0xff142D4C),
                              onPrimary: Colors.white,
                            ),
                            onPressed: () async {
                              setState(() {
                                loading = true;
                                const Center(
                                  child: const CircularProgressIndicator(
                                      color: Color(0xff142D4C)),
                                );
                              });
                              if (jurusan.text.isNotEmpty &&
                                  // no.text.isNotEmpty &&
                                  main.text.isNotEmpty &&
                                  menang.text.isNotEmpty &&
                                  seri.text.isNotEmpty &&
                                  kalah.text.isNotEmpty &&
                                  poin.text.isNotEmpty) {
                                widget.docid.reference.update({
                                  "no": no.text,
                                  "jurusan": jurusan.text,
                                  "main": main.text,
                                  "menang": menang.text,
                                  "seri": seri.text,
                                  "kalah": kalah.text,
                                  "poin": poin.text,
                                });

                                Navigator.pop(
                                  context,
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Inputan tidak boleh kosong!'),
                                  backgroundColor: Colors.red,
                                ));
                              }
                              setState(() {
                                loading = false;
                              });
                            },
                            child: const Text(
                              "SIMPAN",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
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

  void pickMediaaa(ImageSource source) async {
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

  Future<void> uploadImageee() async {
    if (file == null) {
      return;
    }
    String imageName = file!.name;
    File imageFile = File(file!.path);
    try {
      final firebaseStorageRef =
          await firebaseStorage.ref().child(imageName).putFile(imageFile);
      final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl);
      await FirebaseFirestore.instance
          .collection('klasemenFutsal')
          .doc('0pE7d7h7mdIAJVVRHtTb')
          .update({'logo': fileUrl});
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
              child: Text(
                'Batal',
                style: TextStyle(
                    color: Color(0xff142D4C), fontWeight: FontWeight.bold),
              ),
            ),

            //GANTI PUSH REPLEMENT]
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () => Navigator.pop(
                // widget.docid.reference.delete().whenComplete(() => {
                //     });
                context,

                // MaterialPageRoute(
                //   builder: (BuildContext context) => TabbarBody(),
                // ),
                // (route) => false,
              ),
              child: Text(
                'Ya',
                style: TextStyle(
                    color: Color(0xff142D4C), fontWeight: FontWeight.w700),
              ),
            )
          ],
        );
      },
    );
    return (action != null) ? action : DialogsAction.cancel;
  }
}


// // ignore_for_file: must_be_immutable, camel_case_types, avoid_print, unused_local_variable

// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';

// import 'add_klasemen_navbar.dart';

// class editnoteCrud extends StatefulWidget {
//   DocumentSnapshot docid;
//   String imageUrl;
//   editnoteCrud({Key? key, required this.docid, required this.imageUrl})
//       : super(key: key);

//   @override
//   _editnoteCrudState createState() => _editnoteCrudState();
// }

// class _editnoteCrudState extends State<editnoteCrud> {
  // TextEditingController no = TextEditingController();
  // TextEditingController jurusan = TextEditingController();
  // TextEditingController main = TextEditingController();
  // TextEditingController menang = TextEditingController();
  // TextEditingController seri = TextEditingController();
  // TextEditingController kalah = TextEditingController();
  // TextEditingController poin = TextEditingController();
  // File? image;
  // final RoundedLoadingButtonController _btnController2 =
  //     RoundedLoadingButtonController();

//   @override
//   void initState() {
    // no = TextEditingController(text: widget.docid.get('no'));
    // jurusan = TextEditingController(text: widget.docid.get('jurusan'));
    // main = TextEditingController(text: widget.docid.get('menang'));
    // menang = TextEditingController(text: widget.docid.get('main'));
    // seri = TextEditingController(text: widget.docid.get('kalah'));
    // kalah = TextEditingController(text: widget.docid.get('poin'));
    // poin = TextEditingController(text: widget.docid.get('seri'));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: const Color(0xff142D4C),
//         actions: [
//           MaterialButton(
//             onPressed: () {
//               widget.docid.reference.delete().whenComplete(() {
//                 Navigator.pop(
//                   context,
//                 );
//               });
//             },
//             child: const Icon(
//               Icons.delete,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     image != null
//                         ? SizedBox(
//                             width: 100,
//                             height: 100,
//                             child: Image.file(
//                               image!,
//                             ),
//                           )
//                         : Container(
//                             width: 100,
//                             height: 100,
//                             child: const Center(
//                                 child: Padding(
//                                     padding: EdgeInsets.all(10),
//                                     child: Text(
//                                       'Belum ada foto',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           fontSize: 15,
//                                           color: Color(0xff142D4C)),
//                                     ))),
//                             decoration: BoxDecoration(
//                               border:
//                                   Border.all(color: const Color(0xff142D4C)),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                     const SizedBox(
//                       width: 5,
//                     ),
//                     IconButton(
//                         onPressed: () async {
//                           File? _images = await getImageGallery();
//                           if (_images != null) {
//                             setState(() {
//                               image = _images;
//                             });
//                           }
//                         },
//                         icon: const Icon(Icons.add, size: 40)),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 RoundedLoadingButton(
//                   color: const Color(0xff142D4C),
//                   // successColor: const Color(0xff142D4C),
//                   controller: _btnController2,
//                   onPressed: () async {
//                     if (image == null && widget.imageUrl == "") {
//                       return;
//                     }
//                     if (image != null) {
//                       File imageFile = File(image!.path);
//                       print('path : ' + image!.path);
//                       // try {
//                       //   final firebaseStorageRef = await FirebaseStorage
//                       //       .ref ("logoJurusan")
//                       //       .child('')
//                       //       .putFile(imageFile);
//                       //   final fileUrl =
//                       //       await firebaseStorageRef.ref.getDownloadURL();
//                       //   print(fileUrl);
//                       //   widget.docid.reference.update({
//                       //     "no": no.text,
//                       //     "jurusan": jurusan.text,
//                       //     "main": main.text,
//                       //     "menang": menang.text,
//                       //     "seri": seri.text,
//                       //     "kalah": kalah.text,
//                       //     "poin": poin.text,
//                       //     'logo': widget.imageUrl,
//                       //   });
//                       // } on FirebaseException catch (e) {
//                       //   print(e);
//                       // } catch (error) {
//                       //   print(error);
//                       // }

//                       // .whenComplete(() {

//                       setState(() {});
//                       Navigator.pop(
//                         context,
//                       );
//                       // });
//                     } else {
//                       widget.docid.reference.update({
                        // "no": no.text,
                        // "jurusan": jurusan.text,
                        // "main": main.text,
                        // "menang": menang.text,
                        // "seri": seri.text,
                        // "kalah": kalah.text,
                        // "poin": poin.text,
                        // 'logo': widget.imageUrl,
//                       });
//                     }
//                   },
//                   valueColor: Colors.white,
//                   borderRadius: 10,
//                   child: const Text('''Simpan''',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 const SizedBox(height: 30),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
