// ignore_for_file: camel_case_types, must_be_immutable

import 'package:akhir/HOME.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class editpemaintes extends StatefulWidget {
  DocumentSnapshot docid;
  editpemaintes({Key? key, required this.docid}) : super(key: key);

  @override
  _editpemaintesState createState() => _editpemaintesState();
}

class _editpemaintesState extends State<editpemaintes> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController tim = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docid.get('title'));
    content = TextEditingController(text: widget.docid.get('content'));
    tim = TextEditingController(text: widget.docid.get('tim'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'title': title.text,
                'content': content.text,
                'tim': tim.text,
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Home()));
              });
            },
            child: const Text("save"),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => const Home()));
              });
            },
            child: const Text("delete"),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: title,
              decoration: const InputDecoration(
                hintText: 'title',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: content,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'content',
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: TextField(
              controller: content,
              expands: true,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'tim',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
