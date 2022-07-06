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

class FormListFutsal extends StatefulWidget {
  DocumentSnapshot docid;
  final String id;

  FormListFutsal({
    Key? key,
    required this.docid,
    required this.id,
  }) : super(key: key);

  @override
  _FormListFutsalState createState() => _FormListFutsalState();
}

class _FormListFutsalState extends State<FormListFutsal> {
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
  String? image;

  // File? image;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String? imagePath = '';
  String? imagePathh = '';
  String? image1 = '', image2 = '';

  @override
  void initState() {
    tim1 = TextEditingController(text: widget.docid["futsal"]["tim1"]);
    tim2 = TextEditingController(text: widget.docid["futsal"]["tim2"]);
    // tanggal = TextEditingController(text: widget.docid["futsal"]["tanggal"]);
    skor1 = TextEditingController(text: widget.docid["futsal"]["skor1"]);
    skor2 = TextEditingController(text: widget.docid["futsal"]["skor2"]);
    image1 = widget.docid.get('futsal')['logo1'];
    image2 = widget.docid.get('futsal')['logo2'];
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          pickMedia(ImageSource.gallery);
                        },
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: (imagePath == null)
                              ? CircleAvatar(
                                  backgroundImage: FileImage(File(imagePath!)))
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
                      const Text(
                        'VS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff142D4C),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          pickMediaa(ImageSource.gallery);
                        },
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: (imagePathh == null)
                              ? CircleAvatar(
                                  backgroundImage: FileImage(File(imagePathh!)))
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
                  const SizedBox(height: 40),
                  const SizedBox(height: 15),
                  TextFormField(
                    maxLength: 4,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    //memberikan identitas untuk setiap form
                    controller: tim1,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.people,
                        color: Color(0xff142D4C),
                      ),
                      hintText: 'Cth. RPL VS OTKP',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tim tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tim tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Skor tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Skor tidak boleh kosong';
                      }
                      return null;
                    },
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
                    onPressed: () async {
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

                      await uploadImage();
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
    if (file == null || file2 == null) {
      return;
    }

    try {
      String imageName = file!.name;
      File imageFile = File(file!.path);
      final firebaseStorageRef = await firebaseStorage
          .ref("logoAddFutsal/${DateTime.now().microsecondsSinceEpoch}")
          .child(imageName)
          .putFile(imageFile);
      final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl);

      String imageName2 = file2!.name;
      File imageFile2 = File(file2!.path);
      final firebaseStorageRef2 = await firebaseStorage
          .ref("logoAddFutsal/${DateTime.now().microsecondsSinceEpoch}")
          .child(imageName2)
          .putFile(imageFile2);
      final fileUrl2 = await firebaseStorageRef2.ref.getDownloadURL();
      print(fileUrl2);

      await FirebaseFirestore.instance
          .collection('cabor')
          .doc(widget.id)
          .update(
        {
          'futsal': {
            'skor1': skor1.text,
            'skor2': skor2.text,
            'tim1': tim1.text,
            'tim2': tim2.text,
            'logo1': fileUrl,
            'logo2': fileUrl2,
            // 'tanggalPertandingan' : ,
          },
        },
      );
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
