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

class EditProfilAdmin extends StatefulWidget {
  DocumentSnapshot docid;
  EditProfilAdmin ({Key? key, required this.docid}) : super(key: key);

  @override
  State<EditProfilAdmin > createState() => _EditProfilAdminState();
}

class _EditProfilAdminState extends State<EditProfilAdmin > {
  TextEditingController nama = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  final MediaType _mediaType = MediaType.image;
  XFile? file;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  String? imagePath;

  @override
  void initState() {
    nama = TextEditingController(text: widget.docid.get('nama'));
    deskripsi = TextEditingController(text: widget.docid.get('deskripsi'));

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
          //untuk upload 2 image
          // Row(
          //   children: [
          //     for (File img in image!)
          //       Container(
          //         height: 200,
          //         width: 200,
          //         child: Image.file(img, fit: BoxFit.cover),
          //       ),
          //     TextButton(
          //         onPressed: () async {
          //           await getImage();
          //         },
          //         child: Icon(
          //           Icons.add,
          //           size: 40,
          //         )),
          //   ],
          // ),
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
                        : widget.docid.get('fotoProfil') == ""
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
                                          widget.docid.get('fotoProfil'))),
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
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Ambil foto dari :'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
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
                                  const SizedBox(height: 10),
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
                                  // InkWell(
                                  //   onTap: () {
                                  //     setState(
                                  //       () {
                                  //         imagePath = null;
                                  //       },
                                  //     );
                                  //   },
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     children: const [
                                  //       Icon(
                                  //         Icons.remove_circle,
                                  //         size: 30,
                                  //         color: Colors.red,
                                  //       ),
                                  //       SizedBox(width: 5),
                                  //       Text(
                                  //         "Hapus foto profil",
                                  //         style: TextStyle(
                                  //           fontSize: 15,
                                  //           color: Colors.black,
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            );
                          },
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

              //nama dan deskripsi
              Container(
                margin: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Nama :'),
                      ],
                    ),
                    TextFormField(
                      cursorColor: const Color(0xff142D4C),
                      controller: nama,
                      maxLength: 25,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff142D4C)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text('Deskripsi :'),
                      ],
                    ),
                    TextField(
                      cursorColor: const Color(0xff142D4C),
                      controller: deskripsi,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff142D4C)),
                        ),
                      ),
                      maxLength: 30,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(350, 38),
                        textStyle: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                        primary: const Color(0xff142D4C),
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        if (nama.text.isNotEmpty && deskripsi.text.isNotEmpty) {
                          widget.docid.reference.update({
                            'nama': nama.text,
                            'deskripsi': deskripsi.text,
                            // 'fotoProfil': uploadImage(),
                          }).whenComplete(() {
                            Navigator.pop(
                              context,
                            );
                          });

                          uploadImage();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Inputan tidak boleh kosong, silahkan kembali'),
                            backgroundColor: const Color(0xff142D4C),
                          ));
                        }
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
          )),
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
          .ref("admin/${DateTime.now().microsecondsSinceEpoch}")
          .child(imageName)
          .putFile(imageFile);
      final fileUrl = await firebaseStorageRef.ref.getDownloadURL();
      print(fileUrl);
      await FirebaseFirestore.instance
          .collection('profilAdmin')
          .doc('90Sqc4KDXt5WQv3Iiqfk')
          .update({'fotoProfil': fileUrl});
    } on FirebaseException catch (e) {
      print(e);
    } catch (error) {
      print(error);
    }
  }
}
