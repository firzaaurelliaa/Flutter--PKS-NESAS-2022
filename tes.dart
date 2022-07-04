// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';



// class Tis extends StatefulWidget {
//   @override
//   _TisState createState() => _TisState();
// }

// class _TisState extends State<Tis> {
//   File? file;
//   ImagePicker image = ImagePicker();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("WebFun"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               height: 140,
//               width: 180,
//               color: Colors.black12,
//               child: file == null
//                   ? Icon(
//                       Icons.image,
//                       size: 50,
//                     )
//                   : Image.file(
//                       file!,
//                       fit: BoxFit.fill,
//                     ),
//             ),
//             MaterialButton(
//               onPressed: () {
//                 getgall();
//               },
//               color: Colors.blue[900],
//               child: Text(
//                 "take from gallery",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             MaterialButton(
//               onPressed: () {
//                 getcam();
//               },
//               color: Colors.blue[900],
//               child: Text(
//                 "take from camera",
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   getcam() async {
//     // ignore: deprecated_member_use
//     var img = await image.getImage(source: ImageSource.camera);
//     setState(() {
//       file = File(img!.path);
//     });
//   }

//   getgall() async {
//     // ignore: deprecated_member_use
//     var img = await image.getImage(source: ImageSource.gallery);
//     setState(() {
//       file = File(img!.path);
//     });
//   }
// }