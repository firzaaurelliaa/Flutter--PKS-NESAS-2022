
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

enum MediaType {
  image,
  video,
}

class TimFutsalRplOtkp extends StatefulWidget {
  final String id;
  // final String? tim1;
  // final String? tim2;
  // final String docId;

  // Future<void> update([DocumentSnapshot? snapshot]) async {
  //   if (snapshot != null) {
  //     namapemain.text = snapshot['nama'];
  //     deskripsi.text = snapshot['deskripsi'];
  //   }
  // }

  TimFutsalRplOtkp({
    Key? key,
    required this.id,
    // required this.tim1,
    // required this.tim2,
    // required this.docId,
  }) : super(key: key);
  @override
  _TimFutsalRplOtkpState createState() => _TimFutsalRplOtkpState();
}

class _TimFutsalRplOtkpState extends State<TimFutsalRplOtkp> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('timFutsal').snapshots();
  final namapemain = TextEditingController();
  final nopemain = TextEditingController();
  final posisipemain = TextEditingController();
  final MediaType _mediaType = MediaType.image;

  String? imagePath;

  var id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff142D4C),
          child: Icon(Icons.add),
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (_) => const AddPemain(
            //             // docid: id,
            //             )));
          }),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (_) => addnote()));
      //   },
      //   child: Icon(
      //     Icons.add,
      //   ),
      // ),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('timFutsal')
            .where(
              'caborId',
              isEqualTo: widget.id,
            )
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff142D4C),
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff142D4C),
              ),
            );
          }
          return ListView(
            children: [
              ...snapshot.data!.docs.map(
                (e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Tim 1',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff142D4C)),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            ...List.generate(
                              snapshot.data!.size,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (_) => edittim(
                                    //               docid: snapshot.data!.docs[index],
                                    //               imageUrl: '',
                                    //               // docid: id,
                                    //             )));
                                  },
                                  child: Card(
                                    nama: snapshot.data!.docs[index]
                                        .get('tim1')['namaPemain'],
                                    posisi: snapshot.data!.docs[index]
                                        .get('tim1')['posisiPemain'],
                                    no: snapshot.data!.docs[index]
                                        .get('tim1')['noPemain'],
                                    foto: snapshot.data!.docs[index]
                                        .get('tim1')['fotoPemain'],
                                    imageUrl: snapshot.data!.docs[index]
                                        .get('tim1')['fotoPemain'],
                                    id: snapshot.data!.docs[index],
                                  ),
                                );
                              },
                            ),
                            //   GestureDetector(
                            //     onTap: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (_) => const AddPemain(
                            //                   // docid: id,
                            //                   )));
                            //     },
                            //     child: Container(
                            //       width: 50.0,
                            //       height: 50.0,
                            //       decoration: const BoxDecoration(
                            //         color: Color(0xff142D4C),
                            //         shape: BoxShape.circle,
                            //       ),
                            //       child: const Icon(Icons.add, color: Colors.white),
                            //     ),
                            //   )
                            //
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Tim 2',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xff142D4C)),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            ...List.generate(
                              snapshot.data!.size,
                              (index) {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (_) => edittim(
                                    //               docid: snapshot.data!.docs[index],
                                    //               imageUrl: '',
                                    //               // docid: id,
                                    //             )));
                                  },
                                  child: Card(
                                    nama: snapshot.data!.docs[index]
                                        .get('tim2')['namaPemain'],
                                    posisi: snapshot.data!.docs[index]
                                        .get('tim2')['posisiPemain'],
                                    no: snapshot.data!.docs[index]
                                        .get('tim2')['noPemain'],
                                    foto: snapshot.data!.docs[index]
                                        .get('tim2')['fotoPemain'],
                                    imageUrl: snapshot.data!.docs[index]
                                        .get('tim2')['fotoPemain'],
                                    id: snapshot.data!.docs[index],
                                  ),
                                );
                              },
                            ),
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (_) => const AddPemain2(
                            //                 // docid: id,
                            //                 )));
                            //   },
                            //   child: Container(
                            //     width: 50.0,
                            //     height: 50.0,
                            //     decoration: const BoxDecoration(
                            //       color: Color(0xff142D4C),
                            //       shape: BoxShape.circle,
                            //     ),
                            //     child: const Icon(Icons.add, color: Colors.white),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void pickMedia(ImageSource source) async {
    XFile? file;
    if (_mediaType == MediaType.image) {
      file = await ImagePicker().pickImage(source: source);
    } else {
      file = await ImagePicker().pickVideo(source: source);
    }
    if (file != null) {
      imagePath = file.path;
      if (_mediaType == MediaType.video) {
        imagePath = await VideoThumbnail.thumbnailFile(
            video: file.path,
            imageFormat: ImageFormat.PNG,
            quality: 100,
            maxWidth: 300,
            maxHeight: 300);
      }
      setState(() {});
    }
  }
}

class Card extends StatelessWidget {
  const Card({
    Key? key,
    required this.nama,
    required this.foto,
    required this.posisi,
    required this.no,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);

  final String nama;
  final String foto;
  final String posisi;
  final String no;
  final String imageUrl;
  final DocumentSnapshot id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  foto,
                ),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      color: const Color(0xff142D4C),
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                nama,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  posisi,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff142D4C),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        no,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:akhir/add_pemain.dart';
// import 'package:akhir/add_pemain2.dart';
// import 'package:akhir/edit_tim.dart';
// import 'package:akhir/edit_tim2..dart';
// import 'package:akhir/page_belum_diatur.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

// enum MediaType {
//   image,
//   video,
// }

// class TimFutsalRplOtkp extends StatefulWidget {
//   final String id;
//   // final String? tim1;
//   // final String? tim2;
//   // final String docId;

//   // Future<void> update([DocumentSnapshot? snapshot]) async {
//   //   if (snapshot != null) {
//   //     namapemain.text = snapshot['nama'];
//   //     deskripsi.text = snapshot['deskripsi'];
//   //   }
//   // }

//   TimFutsalRplOtkp({
//     Key? key,
//     required this.id,
//     // required this.tim1,
//     // required this.tim2,
//     // required this.docId,
//   }) : super(key: key);
//   @override
//   _TimFutsalRplOtkpState createState() => _TimFutsalRplOtkpState();
// }

// class _TimFutsalRplOtkpState extends State<TimFutsalRplOtkp> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('timFutsal').snapshots();
//   final namapemain = TextEditingController();
//   final nopemain = TextEditingController();
//   final posisipemain = TextEditingController();
//   final MediaType _mediaType = MediaType.image;

//   String? imagePath;

//   var id;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//           backgroundColor: Color(0xff142D4C),
//           child: Icon(Icons.add),
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => const AddPemain(
//                         // docid: id,
//                         )));
//           }),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     Navigator.pushReplacement(
//       //         context, MaterialPageRoute(builder: (_) => addnote()));
//       //   },
//       //   child: Icon(
//       //     Icons.add,
//       //   ),
//       // ),

//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('timFutsal')
//             .where(
//               'caborId',
//               isEqualTo: widget.id,
//             )
//             .snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             return const Text("something is wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xff142D4C),
//               ),
//             );
//           }
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 color: Color(0xff142D4C),
//               ),
//             );
//           }
//           return ListView(
//             children: [
//               ...snapshot.data!.docs.map(
//                 (e) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(25),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             const Text(
//                               'Tim 1',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w900,
//                                   color: Color(0xff142D4C)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5),
//                             ...List.generate(
//                               snapshot.data!.size,
//                               (index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     // Navigator.push(
//                                     //     context,
//                                     //     MaterialPageRoute(
//                                     //         builder: (_) => edittim(
//                                     //               docid: snapshot.data!.docs[index],
//                                     //               imageUrl: '',
//                                     //               // docid: id,
//                                     //             )));
//                                   },
//                                   child: Card(
//                                     nama: snapshot.data!.docs[index]
//                                         .get('tim1')['namaPemain'],
//                                     posisi: snapshot.data!.docs[index]
//                                         .get('tim1')['posisiPemain'],
//                                     no: snapshot.data!.docs[index]
//                                         .get('tim1')['noPemain'],
//                                     foto: snapshot.data!.docs[index]
//                                         .get('tim1')['fotoPemain'],
//                                     imageUrl: snapshot.data!.docs[index]
//                                         .get('tim1')['fotoPemain'],
//                                     id: snapshot.data!.docs[index],
//                                   ),
//                                 );
//                               },
//                             ),
//                             //   GestureDetector(
//                             //     onTap: () {
//                             //       Navigator.push(
//                             //           context,
//                             //           MaterialPageRoute(
//                             //               builder: (_) => const AddPemain(
//                             //                   // docid: id,
//                             //                   )));
//                             //     },
//                             //     child: Container(
//                             //       width: 50.0,
//                             //       height: 50.0,
//                             //       decoration: const BoxDecoration(
//                             //         color: Color(0xff142D4C),
//                             //         shape: BoxShape.circle,
//                             //       ),
//                             //       child: const Icon(Icons.add, color: Colors.white),
//                             //     ),
//                             //   )
//                             //
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Container(
//                         padding: const EdgeInsets.all(25),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             const Text(
//                               'Tim 2',
//                               style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w900,
//                                   color: Color(0xff142D4C)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5),
//                             ...List.generate(
//                               snapshot.data!.size,
//                               (index) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     // Navigator.push(
//                                     //     context,
//                                     //     MaterialPageRoute(
//                                     //         builder: (_) => edittim(
//                                     //               docid: snapshot.data!.docs[index],
//                                     //               imageUrl: '',
//                                     //               // docid: id,
//                                     //             )));
//                                   },
//                                   child: Card(
//                                     nama: snapshot.data!.docs[index]
//                                         .get('tim2')['namaPemain'],
//                                     posisi: snapshot.data!.docs[index]
//                                         .get('tim2')['posisiPemain'],
//                                     no: snapshot.data!.docs[index]
//                                         .get('tim2')['noPemain'],
//                                     foto: snapshot.data!.docs[index]
//                                         .get('tim2')['fotoPemain'],
//                                     imageUrl: snapshot.data!.docs[index]
//                                         .get('tim2')['fotoPemain'],
//                                     id: snapshot.data!.docs[index],
//                                   ),
//                                 );
//                               },
//                             ),
//                             // GestureDetector(
//                             //   onTap: () {
//                             //     Navigator.push(
//                             //         context,
//                             //         MaterialPageRoute(
//                             //             builder: (_) => const AddPemain2(
//                             //                 // docid: id,
//                             //                 )));
//                             //   },
//                             //   child: Container(
//                             //     width: 50.0,
//                             //     height: 50.0,
//                             //     decoration: const BoxDecoration(
//                             //       color: Color(0xff142D4C),
//                             //       shape: BoxShape.circle,
//                             //     ),
//                             //     child: const Icon(Icons.add, color: Colors.white),
//                             //   ),
//                             // )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 50),
//                     ],
//                   );
//                 },
//               ),
//             ],
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

// class Card extends StatelessWidget {
//   const Card({
//     Key? key,
//     required this.nama,
//     required this.foto,
//     required this.posisi,
//     required this.no,
//     required this.id,
//     required this.imageUrl,
//   }) : super(key: key);

//   final String nama;
//   final String foto;
//   final String posisi;
//   final String no;
//   final String imageUrl;
//   final DocumentSnapshot id;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 120,
//             height: 120,
//             child: Image(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(
//                   foto,
//                 ),
//                 loadingBuilder: (BuildContext context, Widget child,
//                     ImageChunkEvent? loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: const Color(0xff142D4C),
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               loadingProgress.expectedTotalBytes!
//                           : null,
//                     ),
//                   );
//                 }),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 nama,
//                 style: const TextStyle(
//                   fontSize: 17,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 120,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   posisi,
//                   style: const TextStyle(fontSize: 15, color: Colors.grey),
//                 ),
//                 Container(
//                   width: 30,
//                   height: 30,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: const Color(0xff142D4C),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         no,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         // textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
