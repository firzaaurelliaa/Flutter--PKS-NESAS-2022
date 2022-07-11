import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable, avoid_print, unnecessary_const
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:firebase_storage/firebase_storage.dart';

enum MediaType {
  image,
  video,
}

class Percobaan extends StatefulWidget {
  DocumentSnapshot docid;
  Percobaan({Key? key, required this.docid}) : super(key: key);

  @override
  State<Percobaan> createState() => _PercobaanState();
}

class _PercobaanState extends State<Percobaan> {
  TextEditingController nama = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  final MediaType _mediaType = MediaType.image;
  XFile? file;
  XFile? file2;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  String? imagePath;
  String? imagePath2;

  @override
  void initState() {
    // nama = TextEditingController(text: widget.docid.get('nama'));
    // deskripsi = TextEditingController(text: widget.docid.get('deskripsi'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142D4C),
        elevation: 0,
        title: const Text(
          'Edit Profil',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Stack(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 110,
                      child: (imagePath != null)
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
                    Positioned(
                      top: 65,
                      left: 40,
                      child: RawMaterialButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              content: Builder(
                                builder: (context) {
                                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                  var height =
                                      MediaQuery.of(context).size.height;
                                  var width = MediaQuery.of(context).size.width;

                                  return Container(
                                    height: 150,
                                    // width: 100,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Ambil foto dari :',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        InkWell(
                                          onTap: () {
                                            pickMedia(ImageSource.gallery);
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Icon(
                                                Icons.image,
                                                size: 30,
                                                color: Color(0xff142D4C),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Galeri",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        InkWell(
                                          onTap: () {
                                            pickMedia(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Icon(
                                                Icons.camera_alt,
                                                size: 30,
                                                color: Color(0xff142D4C),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                "Buka kamera",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        child: Container(
                          // ignore: prefer_const_constructors
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xff142D4C),
                          ),
                          width: 35,
                          height: 35,
                          child: const Icon(
                            Icons.add,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 110,
                  height: 110,
                  child: (imagePath2 != null)
                      ? CircleAvatar(
                          backgroundImage: FileImage(File(imagePath2!)))
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
                                    image: NetworkImage(
                                        widget.docid.get('futsal')['logo2'])),
                                shape: BoxShape.circle,
                                color: Colors.grey[300]!,
                              ),
                              width: 300,
                              height: 300,
                            ),
                ),
                Positioned(
                  top: 65,
                  left: 40,
                  child: RawMaterialButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          content: Builder(
                            builder: (context) {
                              // Get available height and width of the build area of this widget. Make a choice depending on the size.
                              var height = MediaQuery.of(context).size.height;
                              var width = MediaQuery.of(context).size.width;

                              return Container(
                                height: 150,
                                // width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Ambil foto dari :',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    InkWell(
                                      onTap: () {
                                        pickMedia2(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.image,
                                            size: 30,
                                            color: Color(0xff142D4C),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Galeri",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    InkWell(
                                      onTap: () {
                                        pickMedia2(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(
                                            Icons.camera_alt,
                                            size: 30,
                                            color: Color(0xff142D4C),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Buka kamera",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xff142D4C),
                      ),
                      width: 35,
                      height: 35,
                      child: const Icon(
                        Icons.add,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                //nama dan deskripsi
                Container(
                  margin: const EdgeInsets.all(25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(350, 38),
                          textStyle: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          primary: const Color(0xff142D4C),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          uploadImage();
                          uploadImage2();
                          // if (nama.text.isNotEmpty &&
                          //     deskripsi.text.isNotEmpty) {
                          //   widget.docid.reference.update({
                          //     // 'fotoProfil': uploadImage(),
                          //   }).whenComplete(() {
                          Navigator.pop(
                            context,
                          );
                          //   });

                          //   uploadImage();
                          // } else {
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(const SnackBar(
                          //     content: Text(
                          //         'Inputan tidak boleh kosong, silahkan kembali'),
                          //     backgroundColor: const Color(0xff142D4C),
                          //   ));
                          // }
                        },
                        child: const Text(
                          'Simpan',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  Future<void> uploadImage() async {
    if (file == null) {
      return;
    }
    String imageName = file!.name;
    File imageFile = File(file!.path);
    try {
      final firebaseStorageRef = await firebaseStorage
          .ref("futsal/${DateTime.now().microsecondsSinceEpoch}")
          .child(imageName)
          .putFile(imageFile);
      final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl);
      await FirebaseFirestore.instance
          .collection('cabor')
          .doc('ePCMGZtW6GMGF2kSiZmY')
          .update({'logo1': fileUrl});
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }

  //kedua
  void pickMedia2(ImageSource source) async {
    if (_mediaType == MediaType.image) {
      file2 = await ImagePicker().pickImage(source: source);
    } else {
      file2 = await ImagePicker().pickVideo(source: source);
    }
    if (file2 != null) {
      imagePath2 = file2!.path;
      if (_mediaType == MediaType.video) {
        imagePath2 = await VideoThumbnail.thumbnailFile(
            video: file2!.path,
            imageFormat: ImageFormat.PNG,
            quality: 100,
            maxWidth: 300,
            maxHeight: 300);
      }
      setState(() {});
    }
  }

  Future<void> uploadImage2() async {
    if (file == null) {
      return;
    }
    String imageName = file2!.name;
    File imageFile = File(file2!.path);
    try {
      final firebaseStorageRef = await firebaseStorage
          .ref("futsal/${DateTime.now().microsecondsSinceEpoch}")
          .child(imageName)
          .putFile(imageFile);
      final fileUrl2 = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl2);
      await FirebaseFirestore.instance
          .collection('cabor')
          .doc('ePCMGZtW6GMGF2kSiZmY')
          .update({'logo2': fileUrl2});
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}
