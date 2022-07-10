// ignore_for_file: avoid_init_to_null, use_key_in_widget_constructors, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Foto extends StatefulWidget {
  @override
  _FotoState createState() => _FotoState();
}

class _FotoState extends State<Foto> {
  File? _image = null;
  late final _picker = ImagePicker();

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (image != null) {
          _image = File(image.path);
        } else {
          print('No image selected.');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan'),
      ),
      body: Center(
        child: _image == null
            ? IconButton(
                icon: const Icon(Icons.add_box_outlined),
                color: Colors.blue,
                iconSize: 100.0,
                onPressed: () {
                  getImage();
                },
              )
            : Stack(
                children: <Widget>[
                  SizedBox(
                    width: 250.0,
                    height: 320.0,
                    child: Image.file(_image!),
                  ),
                  Positioned(
                    right: 5.0,
                    child: InkWell(
                      child: const Icon(
                        Icons.remove_circle,
                        size: 30,
                        color: Colors.red,
                      ),
                      // This is where the _image value sets to null on tap of the red circle icon
                      onTap: () {
                        setState(
                          () {
                            _image = null;
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
