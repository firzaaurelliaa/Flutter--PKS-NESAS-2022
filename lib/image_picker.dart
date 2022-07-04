import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  BuildContext context;
  AppImagePicker(this.context);
  // Future<File?> getImageGallery() async {
  //   ImagePicker _picker = ImagePicker();
  //   final XFile? image =
  //       await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
  //   if (image != null) {
  //     return File(image.path);
  //   } else {
  //     return null;
  //   }
  // }

  Future<List<XFile>> multiImagePicker() async {
    List<XFile>? _images = await ImagePicker().pickMultiImage();
    if (_images != null && _images.isNotEmpty) {
      return _images;
    }
    return [];
  }

  Future<List<String>> multiImageUploader(List<XFile> list, String uid) async {
    List<String> path = [];
    for (XFile _image in list) {
      // path.add(await uploadImage(_image, uid));
      path = [...path, await uploadImage(_image, uid)];
    }

    return path;
  }

  Future<String> uploadImage(XFile image, String uid) async {
    print(getImageName(image));
    Reference db =
        FirebaseStorage.instance.ref('reply/$uid/${getImageName(image)}');
    await db.putFile(File(image.path));
    return await db.getDownloadURL();
  }

  String getImageName(XFile image) {
    return image.path.split('/').last;
  }
}
