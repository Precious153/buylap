import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart'as firebase_core;
import 'package:fluttertoast/fluttertoast.dart';

class StoragePath {

  final  FirebaseAuth _auth =FirebaseAuth.instance;

  Future<void> uploadFile(
      String filePath,
      String fileName,) async {
    File file = File(filePath);
    if(filePath==null){
      Fluttertoast.showToast(msg: 'Please select image');
      return;
    }
    try {
    //   final ref = FirebaseStorage.instance.ref().child('user images').
    // child(DateTime.now().toString());
    //   await ref.putFile(file);
    // filePath=await ref.getDownloadURL();
      var reference = FirebaseStorage.instance.ref().child('last_image/car5'); // Modify this path/string as your need
      UploadTask  uploadTask = reference.putFile(file);
      TaskSnapshot  taskSnapshot = await uploadTask;
      var imageUrl = await taskSnapshot.ref.getDownloadURL();
      print(imageUrl);

    FirebaseFirestore.instance.collection('wallpaper').doc(DateTime.now().toString()).set({
      'id':_auth.currentUser!.uid,
      'email':_auth.currentUser!.email,
      'Image':filePath,
      'downloads':0,
      'createdAt':DateTime.now(),
    });
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
}