// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// // For changing the language
// // import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart';

// const appName = 'DateTimeField ';

// class Date extends StatefulWidget {
//   @override
//   DateState createState() => DateState();
// }

// class DateState extends State<Date> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text(appName)),
//         body: SingleChildScrollView(
//           child: Center(
//               child: Container(
//                   constraints: BoxConstraints(maxWidth: 600),
//                   child: DateTimeForm())),
//         ));
//   }
// }

// class DateTimeForm extends StatefulWidget {
//   @override
//   _DateTimeFormState createState() => _DateTimeFormState();
// }

// class _DateTimeFormState extends State<DateTimeForm> {
//   final formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           BasicDateField(),
//           SizedBox(height: 24),
//           // ElevatedButton(
//           //   child: Text('Save'),
//           //   onPressed: () => formKey.currentState?.save(),
//           // ),
//           // ElevatedButton(
//           //   child: Text('Reset'),
//           //   onPressed: () => formKey.currentState?.reset(),
//           // ),
//           // ElevatedButton(
//           //   child: Text('Validate'),
//           //   onPressed: () => formKey.currentState?.validate(),
//           // ),
//         ],
//       ),
//     );
//   }
// }

// class BasicDateField extends StatelessWidget {
//   final format = DateFormat("yyyy-MM-dd");
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(
//             'Tanggal pertandingan :',
//             style: TextStyle(color: Color(0xff142D4C)),
//           ),
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
