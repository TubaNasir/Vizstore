import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Storage {

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(String filename, String filepath) async {
    File file = File(filepath);
    
    try {
      await storage.ref("similarImageSearch/$filename").putFile(file);

    } on FirebaseException catch (e) {
      print(e);
    }
  }
  Future<void> uploadFile2(XFile image) async {
    File file = image as File;
    
    try {
      await storage.ref("similarImageSearch/$image").putFile(file);

    } on FirebaseException catch (e) {
      print(e);
    }
  }

}