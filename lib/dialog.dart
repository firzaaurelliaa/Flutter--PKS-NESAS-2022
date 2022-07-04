// ignore_for_file: avoid_print

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextButton(
          child: const Text('Confirm Dialog'),
          onPressed: () async {
            if (await confirm(
              context,
              title: const Text('Keluar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              content: const Text('Apakah anda yakin untuk keluar?'),
              textOK: const Text('Ya'),
              textCancel: const Text('Batal'),
            )) {
              return print('pressedOK');
            }
            return print('pressedCancel');
          },
        ),
      ),
    );
  }
}
