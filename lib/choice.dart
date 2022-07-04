import 'package:flutter/material.dart';

class MyThreeOptions extends StatefulWidget {
  const MyThreeOptions({Key? key}) : super(key: key);

  @override
  State<MyThreeOptions> createState() => _MyThreeOptionsState();
}

class _MyThreeOptionsState extends State<MyThreeOptions> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(
        3,
        (int index) {
          return ChoiceChip(
            label: Text('Item $index'),
            selected: _value == index,
            onSelected: (bool selected) {
              setState(() {
                _value = selected ? index : null;
              });
            },
          );
        },
      ).toList(),
    );
  }
}

// // Skip to content
// // Search or jump to…
// // Pull requests
// // Issues
// // Marketplace
// // Explore

// // @firzaurellia
// // JoseBarreto1
// // /
// // chips_choice_null_safety
// // Public
// // Code
// // Issues
// // 2
// // Pull requests
// // Actions
// // Projects
// // Wiki
// // Security
// // Insights
// // chips_choice_null_safety/example/lib/main.dart
// // @josejuniorg
// // josejuniorg fix: resolve bug para alterar backgroud e borderRadius
// // Latest commit d497ee3 on Mar 15
// //  History
// //  2 contributors
// // @JoseBarreto1@josejuniorg
// // 289 lines (275 sloc)  10 KB

// import 'package:flutter/material.dart';
// import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
// import 'package:async/async.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter ChipsChoice',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class  MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // single choice value
//   int tag = 1;

//   // multiple choice value
//   List<String> tags = [];

//   // list of string options
//   List<String> options = [
//     'News',
//     'Entertainment',
//     'Politics',
//     'Automotive',
//     'Sports',
//     'Education',
//     'Fashion',
//     'Travel',
//     'Food',
//     'Tech',
//     'Science',
//   ];

//   String? user;
//   final usersMemoizer = AsyncMemoizer<List<C2Choice<String>>>();

//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final formKey = GlobalKey<FormState>();
//   List<String>? formValue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter ChipsChoice'),
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.help_outline),
//             onPressed: () => {},
//           )
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(5.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: ListView(
//                 addAutomaticKeepAlives: true,
//                 children: <Widget>[
//                   Content(
//                     title: 'Scrollable List Single Choice',
//                     child: ChipsChoice<int>.single(
//                       value: tag,
//                       onChanged: (val) => setState(() => tag = val),
//                       choiceItems: C2Choice.listFrom<int, String>(
//                         source: options,
//                         value: (i, v) => i,
//                         label: (i, v) => v,
//                       ),
//                       choiceActiveStyle: C2ChoiceStyle(
//                         color: Color.fromARGB(255, 54, 57, 244),
//                         borderColor: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                       ),
//                       choiceStyle: C2ChoiceStyle(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                       ),
//                     ),
//                   ),
//                   /*Content(
//                     title: 'Scrollable List Multiple Choice',
//                     child: ChipsChoice<String>.multiple(
//                       value: tags,
//                       onChanged: (val) => setState(() => tags = val),
//                       choiceItems: C2Choice.listFrom<String, String>(
//                         source: options,
//                         value: (i, v) => v,
//                         label: (i, v) => v,
//                       ),
//                     ),
//                   ),*/
//                   Content(
//                     title: 'Teste de mudança de cor',
//                     child: ChipsChoice<int>.single(
//                       value: tag,
//                       onChanged: (val) => setState(() => tag = val),
//                       choiceItems: C2Choice.listFrom<int, String>(
//                         source: options,
//                         value: (i, v) => i,
//                         label: (i, v) => v,
//                       ),
//                       choiceActiveStyle: C2ChoiceStyle(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       choiceStyle: C2ChoiceStyle(
//                         showCheckmark: false,
//                         color: Colors.purple,
//                         backgroundColor: Colors.orange,
//                         borderColor: Color.fromARGB(255, 36, 25, 187),
//                         borderRadius: BorderRadius.all(Radius.circular(15)),
//                       ),
//                       wrapped: true,
//                     ),
//                   ),
//                   Content(
//                     title: 'Multiplos Choices',
//                     child: ChipsChoice<String>.multiple(
//                       value: tags,
//                       onChanged: (val) => {setState(() => tags = val)},
//                       choiceItems: C2Choice.listFrom<String, String>(
//                         source: options,
//                         value: (i, v) => v,
//                         label: (i, v) => v,
//                       ),
//                       choiceStyle: C2ChoiceStyle(
//                         color: Colors.orange,
//                         borderColor: Colors.red,
//                       ),
//                       wrapped: true,
//                       textDirection: TextDirection.rtl,
//                     ),
//                   ),
//                   Content(
//                     title: 'Disabled Choice Item',
//                     child: ChipsChoice<int>.single(
//                       value: tag,
//                       onChanged: (val) => setState(() => tag = val),
//                       choiceItems: C2Choice.listFrom<int, String>(
//                         source: options,
//                         value: (i, v) => i,
//                         label: (i, v) => v,
//                         disabled: (i, v) => [0, 2, 5].contains(i),
//                       ),
//                       choiceStyle: C2ChoiceStyle(
//                         color: Colors.black,
//                         borderColor: Colors.red,
//                       ),
//                       wrapped: true,
//                     ),
//                   ),
//                   Content(
//                     title: 'Hidden Choice Item',
//                     child: ChipsChoice<String>.multiple(
//                       value: tags,
//                       onChanged: (val) => setState(() => tags = val),
//                       choiceItems: C2Choice.listFrom<String, String>(
//                         source: options,
//                         value: (i, v) => v,
//                         label: (i, v) => v,
//                         hidden: (i, v) =>
//                             ['Science', 'Politics', 'News', 'Tech'].contains(v),
//                       ),
//                       choiceStyle: C2ChoiceStyle(
//                         color: Colors.yellow,
//                         borderColor: Colors.red,
//                       ),
//                       wrapped: true,
//                     ),
//                   ),
//                   Content(
//                     title: 'Append an Item to Options',
//                     child: ChipsChoice<int>.single(
//                       value: tag,
//                       onChanged: (val) => setState(() => tag = val),
//                       choiceStyle: C2ChoiceStyle(
//                         color: Colors.blue,
//                         borderColor: Colors.red,
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                       ),
//                       choiceItems: C2Choice.listFrom<int, String>(
//                         source: options,
//                         value: (i, v) => i,
//                         label: (i, v) => v,
//                       )..insert(0, C2Choice<int>(value: -1, label: 'All')),
//                     ),
//                   ),
//                   Content(
//                     title: 'Without Checkmark and Custom Border Shape',
//                     child: ChipsChoice<int>.single(
//                       value: tag,
//                       onChanged: (val) => setState(() => tag = val),
//                       choiceItems: C2Choice.listFrom<int, String>(
//                         source: options,
//                         value: (i, v) => i,
//                         label: (i, v) => v,
//                       )..insert(0, C2Choice<int>(value: -1, label: 'All')),
//                       choiceStyle: C2ChoiceStyle(
//                         color: Colors.black,
//                         showCheckmark: false,
//                         labelStyle: TextStyle(fontSize: 20),
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                         borderColor: Colors.blueGrey.withOpacity(.5),
//                       ),
//                       choiceActiveStyle: C2ChoiceStyle(
//                         color: Colors.orange,
//                         borderColor: Colors.red,
//                         brightness: Brightness.dark,
//                         borderShape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(20)),
//                             side: BorderSide(color: Colors.red)),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class Content extends StatefulWidget {
//   final String? title;
//   final Widget? child;

//   Content({
//     Key? key,
//     required this.title,
//     required this.child,
//   }) : super(key: key);

//   @override
//   _ContentState createState() => _ContentState();
// }

// class _ContentState extends State<Content>
//     with AutomaticKeepAliveClientMixin<Content> {
//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Card(
//       elevation: 2,
//       margin: EdgeInsets.all(5),
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(15),
//             color: Colors.blueGrey[50],
//             child: Text(
//               widget.title!,
//               style: TextStyle(
//                   color: Colors.blueGrey, fontWeight: FontWeight.w500),
//             ),
//           ),
//           Flexible(fit: FlexFit.loose, child: widget.child!),
//         ],
//       ),
//     );
//   }
// }
// // © 2022 GitHub, Inc.
// // Terms
// // Privacy
// // Security
// // Status
// // Docs
// // Contact GitHub
// // Pricing
// // API
// // Training
// // Blog
// // About
// // Loading complete

// // import 'package:flutter/material.dart';
// // import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
// // import 'package:async/async.dart';

// // class Choice extends StatefulWidget {
// //   @override
// //   _ChoiceState createState() => _ChoiceState();
// // }

// // class _ChoiceState extends State<Choice> {
// //   // single choice value
// //   int tag = 0;

// //   // list of string options
// //   List<String> options = [
// //     'Futsal',
// //     'Basket',
// //     'Voli',
// //     'Catur',
// //     'Bulutangkis',
// //     'Tenis Meja',
// //   ];

// //   String? user;
// //   final usersMemoizer = AsyncMemoizer<List<C2Choice<String>>>();

// //   // Create a global key that uniquely identifies the Form widget
// //   // and allows validation of the form.
// //   //
// //   // Note: This is a GlobalKey<FormState>,
// //   // not a GlobalKey<MyCustomFormState>.
// //   final formKey = GlobalKey<FormState>();
// //   List<String>? formValue;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(5.0),
// //         child: Row(
// //           children: [
// //             Expanded(
// //               child: ListView(
// //                 // addAutomaticKeepAlives: true,
// //                 children: <Widget>[
// //                   Content(
// //                     child: ChipsChoice<int>.single(
// //                       value: tag,
// //                       onChanged: (val) => setState(() => tag = val),
// //                       choiceItems: C2Choice.listFrom<int, String>(
// //                         source: options,
// //                         value: (i, v) => i,
// //                         label: (i, v) => v,
// //                       ),
// //                       choiceActiveStyle: const C2ChoiceStyle(
// //                         labelStyle: TextStyle(fontWeight: FontWeight.bold),
// //                         color: Colors.white,
// //                         backgroundColor: Color(0xff142D4C),
// //                         borderColor: Color(0xff142D4C),
// //                         borderRadius: BorderRadius.all(Radius.circular(10)),
// //                       ),
// //                       choiceStyle: const C2ChoiceStyle(
// //                         backgroundColor: Color(0xfff6f6f6),
// //                         color: Color(0xff142D4C),
// //                         borderColor: Color(0xff142D4C),
// //                         borderRadius: BorderRadius.all(Radius.circular(10)),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }

// // class Content extends StatefulWidget {
// //   final Widget? child;

// //   const Content({
// //     Key? key,
// //     required this.child,
// //   }) : super(key: key);

// //   @override
// //   _ContentState createState() => _ContentState();
// // }

// // class _ContentState extends State<Content>
// //     with AutomaticKeepAliveClientMixin<Content> {
// //   @override
// //   bool get wantKeepAlive => true;

// //   @override
// //   Widget build(BuildContext context) {
// //     super.build(context);
// //     return Card(
// //       elevation: 2,
// //       margin: const EdgeInsets.all(5),
// //       clipBehavior: Clip.antiAliasWithSaveLayer,
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         mainAxisSize: MainAxisSize.min,
// //         children: <Widget>[
// //           Flexible(fit: FlexFit.loose, child: widget.child!),
// //         ],
// //       ),
// //     );
// //   }
// // }
