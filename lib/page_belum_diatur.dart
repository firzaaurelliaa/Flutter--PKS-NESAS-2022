import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'Admin/FUTSAL/Lihat Detail/edit_klasemen.dart';

class PageBelumDiatur extends StatefulWidget {
  const PageBelumDiatur({Key? key}) : super(key: key);

  @override
  State<PageBelumDiatur> createState() => _PageBelumDiaturState();
}

class _PageBelumDiaturState extends State<PageBelumDiatur> {
  final MediaType _mediaType = MediaType.image;
  XFile? file;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page belum diatur'),
      ),
      body: Center(
        child: RawMaterialButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      content: Builder(
                        builder: (context) {
                          // Get available height and width of the build area of this widget. Make a choice depending on the size.
                          var height = MediaQuery.of(context).size.height;
                          var width = MediaQuery.of(context).size.width;

                          return Container(
                            height: 120,
                          
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Ambil foto dari :',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 15),
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
                              ],
                            ),
                          );
                        },
                      ),
                    ));
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return AlertDialog(
            //       title: const Text('Ambil foto dari :'),
            //       content: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           const SizedBox(height: 10),
            //           InkWell(
            //             onTap: () {
            //               pickMedia(ImageSource.gallery);
            //               Navigator.pop(context);
            //             },
            //             child: Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: const [
            //                 Icon(
            //                   Icons.image,
            //                   size: 30,
            //                   color: Color(0xff142D4C),
            //                 ),
            //                 SizedBox(width: 5),
            //                 Text(
            //                   "Galeri",
            //                   style: TextStyle(
            //                     fontSize: 15,
            //                     color: Colors.black,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           const SizedBox(height: 10),
            //           InkWell(
            //             onTap: () {
            //               pickMedia(ImageSource.camera);
            //               Navigator.pop(context);
            //             },
            //             child: Row(
            //               mainAxisSize: MainAxisSize.min,
            //               children: const [
            //                 Icon(
            //                   Icons.camera_alt,
            //                   size: 30,
            //                   color: Color(0xff142D4C),
            //                 ),
            //                 SizedBox(width: 5),
            //                 Text(
            //                   "Buka kamera",
            //                   style: TextStyle(
            //                     fontSize: 15,
            //                     color: Colors.black,
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           const SizedBox(height: 10),
            //           // InkWell(
            //           //   onTap: () {
            //           //     setState(
            //           //       () {
            //           //         imagePath = null;
            //           //       },
            //           //     );
            //           //   },
            //           //   child: Row(
            //           //     mainAxisSize: MainAxisSize.min,
            //           //     children: const [
            //           //       Icon(
            //           //         Icons.remove_circle,
            //           //         size: 30,
            //           //         color: Colors.red,
            //           //       ),
            //           //       SizedBox(width: 5),
            //           //       Text(
            //           //         "Hapus foto profil",
            //           //         style: TextStyle(
            //           //           fontSize: 15,
            //           //           color: Colors.black,
            //           //         ),
            //           //       )
            //           //     ],
            //           //   ),
            //           // ),
            //         ],
            //       ),
            //     );
            //   },
            // );
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
