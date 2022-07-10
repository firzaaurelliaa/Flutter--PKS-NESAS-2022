// import 'package:flutter/material.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:intl/intl.dart';

// class BasicDateField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd");
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text('Masukan tanggal pertandingan :'),
//         ],
//       ),
//       DateTimeField(
//         format: format,
//         onShowPicker: (context, currentValue) {
//           return showDatePicker(
//             context: context,
//             firstDate: DateTime(1900),
//             initialDate: currentValue ?? DateTime.now(),
//             lastDate: DateTime(2100),
//             confirmText: 'SIMPAN',
//             cancelText: 'BATAL',
//             builder: (context, child) => Theme(
//               data: ThemeData().copyWith(
//                 colorScheme: ColorScheme.light(
//                   primary: Color(0xff142D4C),
//                   onPrimary: Colors.white,
//                 ),
//               ),
//               child: child!,
//             ),
//           );
//         },
//       ),
//     ]);
//   }
// }
