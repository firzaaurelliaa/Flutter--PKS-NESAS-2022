// import 'package:akhir/klasemen_pake_appbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';

// class editnote extends StatefulWidget {
//   DocumentSnapshot docid;
//   editnote({required this.docid});

//   @override
//   _editnoteState createState() => _editnoteState();
// }

// class _editnoteState extends State<editnote> {
//   TextEditingController title = TextEditingController();
//   TextEditingController content = TextEditingController();

//   @override
//   void initState() {
//     title = TextEditingController(text: widget.docid.get('title'));
//     content = TextEditingController(text: widget.docid.get('content'));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           MaterialButton(
//             onPressed: () {
//               widget.docid.reference.update({
//                 'title': title.text,
//                 'content': content.text,
//               }).whenComplete(() {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (_) => KlasemenPakeAppbar()));
//               });
//             },
//             child: Text("save"),
//           ),
//           MaterialButton(
//             onPressed: () {
//               widget.docid.reference.delete().whenComplete(() {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (_) => KlasemenPakeAppbar()));
//               });
//             },
//             child: Text("delete"),
//           ),
//         ],
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(border: Border.all()),
//               child: TextField(
//                 controller: title,
//                 decoration: InputDecoration(
//                   hintText: 'title',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(border: Border.all()),
//                 child: TextField(
//                   controller: content,
//                   expands: true,
//                   maxLines: null,
//                   decoration: InputDecoration(
//                     hintText: 'content',
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
