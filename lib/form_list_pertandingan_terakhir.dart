// import 'package:flutter/material.dart';
// import 'detail_page.dart';

// class FormListPertandinganTerakhir extends StatefulWidget {
//   const FormListPertandinganTerakhir({Key? key}) : super(key: key);

//   @override
//   _FormListPertandinganTerakhirState createState() => _FormListPertandinganTerakhirState();
// }

// class _FormListPertandinganTerakhirState extends State<FormListPertandinganTerakhir> {
//   final _formKey = GlobalKey<FormState>();

//   final tim = TextEditingController();
//   final tanggal = TextEditingController();
//   final skor = TextEditingController();
//   final cabor = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff142D4C),
//         elevation: 0,
//       ),
//       // untuk membuat form input tambahakan widget form()
//       body: Form(
//         // key adalah kunci unik untuk mengidentifikasi suatu form
//         // di bawah key ini tambahkan widget sesuai selera kalian
//         key: _formKey,
//         child: Container(
//           padding: const EdgeInsets.all(20.0),
//           margin: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 //memberikan identitas untuk setiap form
//                 controller: tanggal,
//                 decoration: InputDecoration(
//                   icon: const Icon(
//                     Icons.calendar_today,
//                     color: Color(0xff142D4C),
//                   ),
//                   hintText: 'Cth. Kamis, 20 Februari 2022',
//                   labelText: 'Tanggal :',
//                   labelStyle: const TextStyle(color: Color(0xff142D4C)),
//                   suffixIcon: IconButton(
//                     onPressed: tanggal.clear,
//                     icon: const Icon(Icons.clear),
//                     color: const Color(0xff142D4C),
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xff142D4C)),
//                   ),
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(),
//                   ),
//                 ),
//                 //memberikan validasi jika form kosong
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Tanggal tidak boleh kosong';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 //memberikan identitas untuk setiap form
//                 controller: tim,
//                 decoration: InputDecoration(
//                   icon: const Icon(
//                     Icons.people,
//                     color: Color(0xff142D4C),
//                   ),
//                   hintText: 'Cth. RPL VS OTKP',
//                   labelText: 'Tim :',
//                   labelStyle: const TextStyle(color: Color(0xff142D4C)),
//                   suffixIcon: IconButton(
//                     onPressed: tim.clear,
//                     icon: const Icon(Icons.clear),
//                     color: const Color(0xff142D4C),
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xff142D4C)),
//                   ),
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(),
//                   ),
//                 ),
//                 //memberikan validasi jika form kosong
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Tim tidak boleh kosong';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 //memberikan identitas untuk setiap form
//                 controller: cabor,
//                 decoration: InputDecoration(
//                   icon: const Icon(
//                     Icons.sports_basketball,
//                     color: Color(0xff142D4C),
//                   ),
//                   hintText: 'Cth. Basket',
//                   labelText: 'Cabor :',
//                   labelStyle: const TextStyle(color: Color(0xff142D4C)),
//                   suffixIcon: IconButton(
//                     onPressed: cabor.clear,
//                     icon: const Icon(Icons.clear),
//                     color: const Color(0xff142D4C),
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xff142D4C)),
//                   ),
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(),
//                   ),
//                 ),
//                 //memberikan validasi jika form kosong
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Cabang Olaharag tidak boleh kosong';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 //memberikan identitas untuk setiap form
//                 controller: skor,
//                 decoration: InputDecoration(
//                   icon: const Icon(
//                     Icons.scoreboard_outlined,
//                     color: Color(0xff142D4C),
//                   ),
//                   hintText: 'Cth. 2 - 1',
//                   labelText: 'Skor :',
//                   labelStyle: const TextStyle(color: Color(0xff142D4C)),
//                   suffixIcon: IconButton(
//                     onPressed: skor.clear,
//                     icon: const Icon(Icons.clear),
//                     color: const Color(0xff142D4C),
//                   ),
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(color: Color(0xff142D4C)),
//                   ),
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(),
//                   ),
//                 ),
//                 //memberikan validasi jika form kosong
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Skor tidak boleh kosong';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(const Color(0xff142D4C)),
//                     ),
//                     child: const Text(
//                       "Submit",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     onPressed: () {
//                       //jika data lengkap maka kirim data ke halaman selanjutnya
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 //tim.text adalah parameter yang dikirim
//                                 //tanggal.text adalah paramter yang dikirim
//                                 //skor.text adalah paramter yang dikirim
//                                 builder: (_) => DetailPage(
//                                       tim: tim.text,
//                                       tanggal: tanggal.text,
//                                       skor: skor.text,
//                                       cabor: cabor.text,
//                                     )));
//                       }
//                     },
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
