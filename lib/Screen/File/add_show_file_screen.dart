import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddShowFileScreen extends StatefulWidget {
  const AddShowFileScreen({super.key,});
  @override
  State<AddShowFileScreen> createState() => _AddShowFileScreenState();
}

class _AddShowFileScreenState extends State<AddShowFileScreen> {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  Future<String?> uploadFileToFirebase(XFile file) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('Image/${file.path}');
    UploadTask uploadTask = ref.putFile(File(file.path));
    await uploadTask.whenComplete(() {
    });
    String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Center(
              child: MaterialButton(
                onPressed: () async {
                  ImagePicker picker = ImagePicker();
                  XFile? result =await picker.pickImage(source: ImageSource.gallery);
                  if (result != null) {
                    String? downloadUrl = await uploadFileToFirebase(result);
                    if (downloadUrl != null) {
                      print(downloadUrl);
                      await FirebaseFirestore.instance.collection('students').doc(uid).
                      update(
                          {
                            "image_url":downloadUrl,
                          });
                    } else {
                      print('Failed to get the download URL');
                    }
                  }
                },
                child: const Text('Add file'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
