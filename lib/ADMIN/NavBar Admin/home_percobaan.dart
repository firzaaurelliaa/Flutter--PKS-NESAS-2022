// // ignore_for_file: unused_field, avoid_print, sized_box_for_whitespace, curly_braces_in_flow_control_structures, deprecated_member_use

// import 'dart:io';
// import 'package:akhir/Admin/Profil%20Admin/edit_profil_admin.dart';
// import 'package:akhir/User/Navbar%20User/navbar_user.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

// enum MediaType {
//   image,
//   video,
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   String title = 'AlertDialog';
//   bool tappedYes = false;
//   // final nama = TextEditingController();
//   // final deskripsi = TextEditingController();
//   final MediaType _mediaType = MediaType.image;
//   String? imagePath;

//   // Future<void> update([DocumentSnapshot? snapshot]) async {
//   //   if (snapshot != null) {
//   //     nama.text = snapshot['nama'];
//   //     deskripsi.text = snapshot['deskripsi'];
//   //   }
//   // }

//   // Future<void> delete(String docid) async {
//   //   await _usersStream.delete();

//   //   ScaffoldMessenger.of(context)
//   //       .showSnackBar(SnackBar(content: Text('sudah dihapus')));
//   // }
//   // final CollectionReference _profilAdmin =
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('cabor').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: StreamBuilder(
//         stream: _usersStream,
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Tunggu sebentar, ada yang salah:(");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xff142D4C),
//               ),
//             );
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (_, index) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Stack(
//                     children: [
//                       Container(
//                         height: 300,
//                         decoration: const BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               spreadRadius: 0,
//                               color: Colors.grey,
//                               blurRadius: 2.7,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(30),
//                             bottomRight: Radius.circular(30),
//                           ),
//                           color: Colors.white,
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           InkWell(
//                             onTap: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => EditProfilAdmin(
//                                       docid: snapshot.data!.docs[index]),
//                                 ),
//                               ),
//                             },
//                             child: SizedBox(
//                               width: 135,
//                               height: 135,
//                               child: (imagePath != null)
//                                   ? CircleAvatar(
//                                       backgroundImage:
//                                           FileImage(File(imagePath!)))
//                                   : Container(
//                                       width: 300,
//                                       height: 300,
//                                       child: ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(500),
//                                         child: Image.network(
//                                           snapshot.data!.docs[index]
//                                               .get('logo1'),
//                                           fit: BoxFit.cover,
//                                           loadingBuilder: (BuildContext context,
//                                               Widget child,
//                                               ImageChunkEvent?
//                                                   loadingProgress) {
//                                             if (loadingProgress == null)
//                                               return child;
//                                             return Center(
//                                               child: CircularProgressIndicator(
//                                                 color: const Color(0xff142D4C),
//                                                 value: loadingProgress
//                                                             .expectedTotalBytes !=
//                                                         null
//                                                     ? loadingProgress
//                                                             .cumulativeBytesLoaded /
//                                                         loadingProgress
//                                                             .expectedTotalBytes!
//                                                     : null,
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                             ),
//                           ),
//                           // ListTile(
//                           //   title: Center(
//                           //       child: Text(
//                           //     snapshot.data!.docs[index]['nama'],
//                           //   )),
//                           //   subtitle: Container(
//                           //     padding: const EdgeInsets.all(8.0),
//                           //     child: Center(
//                           //         child: Text(
//                           //             snapshot.data!.docs[index]['deskripsi'])),
//                           //   ),
//                           // ),
//                           TextButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: Colors.white,
//                               onPrimary: Colors.grey,
//                             ),
//                             onPressed: () => {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => EditProfilAdmin(
//                                       docid: snapshot.data!.docs[index]),
//                                 ),
//                               ),
//                             },
//                             child: const Text(
//                               'Edit Profil',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(20.0),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(350, 38),
//                         textStyle: const TextStyle(
//                             fontSize: 13, fontWeight: FontWeight.bold),
//                         primary: const Color(0xff142D4C),
//                         onPrimary: Colors.white,
//                       ),
//                       onPressed: () async {
//                         final action = await AlertDialogs.yesCancelDialog(
//                             context,
//                             'Keluar',
//                             'Apakah anda yakin untuk keluar akun?');
//                         if (action == DialogsAction.yes) {
//                           setState(() => tappedYes = true);
//                         } else {
//                           setState(() => tappedYes = false);
//                         }
//                       },
//                       // padding: EdgeInsets.all(12.0),
//                       // color: Color(0xFFC41A3B),
//                       child: Text(
//                         'Keluar'.toUpperCase(),
//                         style: const TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   void pickMedia(ImageSource source) async {
//     XFile? file;
//     if (_mediaType == MediaType.image) {
//       file = await ImagePicker().pickImage(source: source);
//     } else {
//       file = await ImagePicker().pickVideo(source: source);
//     }
//     if (file != null) {
//       imagePath = file.path;
//       if (_mediaType == MediaType.video) {
//         imagePath = await VideoThumbnail.thumbnailFile(
//             video: file.path,
//             imageFormat: ImageFormat.PNG,
//             quality: 100,
//             maxWidth: 300,
//             maxHeight: 300);
//       }
//       setState(() {});
//     }
//   }
// }

// enum DialogsAction { yes, cancel }

// class AlertDialogs {
//   static Future<DialogsAction> yesCancelDialog(
//     BuildContext context,
//     String title,
//     String body,
//   ) async {
//     final action = await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//           title: Text(title),
//           content: Text(body),
//           actions: <Widget>[
//             FlatButton(
//               onPressed: () => Navigator.of(context).pop(DialogsAction.cancel),
//               child: const Text(
//                 'Batal',
//                 style: TextStyle(
//                     color: Color(0xff142D4C), fontWeight: FontWeight.bold),
//               ),
//             ),
//             FlatButton(
//               onPressed: () => Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(
//                   builder: (BuildContext context) => const NavBarUser(),
//                 ),
//                 (route) => false,
//               ),
//               child: const Text(
//                 'Ya',
//                 style: TextStyle(
//                     color: Color(0xff142D4C), fontWeight: FontWeight.w700),
//               ),
//             )
//           ],
//         );
//       },
//     );
//     return (action != null) ? action : DialogsAction.cancel;
//   }
// }
