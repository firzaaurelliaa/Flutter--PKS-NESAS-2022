// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

// import 'package:akhir/tim_futsal.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class EditTim1FutsalRplOtkp extends StatefulWidget {
//   const EditTim1FutsalRplOtkp({Key? key}) : super(key: key);

//   @override
//   State<EditTim1FutsalRplOtkp> createState() => _EditTim1FutsalRplOtkpState();
// }

// class _EditTim1FutsalRplOtkpState extends State<EditTim1FutsalRplOtkp> {
//   TextEditingController controller = TextEditingController();
//   TextEditingController controllers = TextEditingController();
//   TextEditingController controllerss = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff142D4C),
//         elevation: 0,
//         actions: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 15),
//             child: TextButton(
//                 onPressed: () => {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               TimFutsalRplOtkp(tim1: '', tim2: ''),
//                         ),
//                       ),
//                     },
//                 child: Text(
//                   'Simpan',
//                   style: TextStyle(color: Colors.white),
//                 )),
//           )
//         ],
//       ),
//       body: ListView(
//         children: [
//           const SizedBox(height: 30),
//           Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     child: Text(
//                       ' Pemain',
//                       style: TextStyle(fontSize: 15, color: Color(0xff142D4C)),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       ' Posisi',
//                       style: TextStyle(fontSize: 15, color: Color(0xff142D4C)),
//                     ),
//                   ),
//                   Container(
//                     child: Text(
//                       ' No.',
//                       style: TextStyle(fontSize: 15, color: Color(0xff142D4C)),
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: 20),
//                   Container(
//                       child: Icon(
//                     Icons.add_photo_alternate,
//                     color: Color(0xff142D4C),
//                   )),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controller,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controllers,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 55,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       controller: controllerss,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Icon(
//                     Icons.delete,
//                     color: Color(0xff142D4C),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: 20),
//                   Container(
//                       child: Icon(
//                     Icons.add_photo_alternate,
//                     color: Color(0xff142D4C),
//                   )),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controller,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controllers,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 55,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       controller: controllerss,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Icon(
//                     Icons.delete,
//                     color: Color(0xff142D4C),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: 20),
//                   Container(
//                       child: Icon(
//                     Icons.add_photo_alternate,
//                     color: Color(0xff142D4C),
//                   )),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controller,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controllers,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 55,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       controller: controllerss,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Icon(
//                     Icons.delete,
//                     color: Color(0xff142D4C),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: 20),
//                   Container(
//                       child: Icon(
//                     Icons.add_photo_alternate,
//                     color: Color(0xff142D4C),
//                   )),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controller,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controllers,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 55,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       controller: controllerss,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Icon(
//                     Icons.delete,
//                     color: Color(0xff142D4C),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   SizedBox(width: 20),
//                   Container(
//                       child: Icon(
//                     Icons.add_photo_alternate,
//                     color: Color(0xff142D4C),
//                   )),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controller,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 130,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       controller: controllers,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 55,
//                     height: 55,
//                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//                     child: TextFormField(
//                       maxLengthEnforcement: MaxLengthEnforcement.enforced,
//                       keyboardType: TextInputType.numberWithOptions(),
//                       controller: controllerss,
//                       decoration: InputDecoration(
//                         fillColor: const Color(0xffD7E9F7),
//                         filled: true,
//                         contentPadding: const EdgeInsets.only(left: 10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide:
//                                 const BorderSide(color: Color(0xff142D4C))),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Icon(
//                     Icons.delete,
//                     color: Color(0xff142D4C),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 5),
//               Row(
//                 children: [
//                   SizedBox(width: 20),
//                   Container(
//                     child: Icon(
//                       Icons.person_add,
//                       color: Color(0xff142D4C),
//                     ),
//                   ),
//                   Text('Tambah pemain',
//                       style: TextStyle(color: Color(0xff142D4C))),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
